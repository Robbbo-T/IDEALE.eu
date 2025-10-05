// SPDX-License-Identifier: Apache-2.0
pragma solidity ^0.8.20;

/**
 * @title RevenueSplit (skeleton)
 * @notice Registra un artefacto con su lista de creadores y reparte tokens TT
 *         según bps definidos en su "revshare".
 * @dev   Esquema mínimo para auditoría y PoC. Complementar con OZ (PaymentSplitter, AccessControl),
 *        timelocks, pausas y control de listas.
 */
contract RevenueSplit {
    struct Allocation {
        address account;
        uint16  shareBps;  // out of 10000
    }

    struct Artifact {
        bytes32 contentHash;
        uint16  totalBps; // debe ser 10000
        Allocation[] allocations;
        bool exists;
    }

    mapping(bytes32 => Artifact) public artifacts;

    event Registered(bytes32 indexed hash, uint16 totalBps);
    event Distributed(bytes32 indexed hash, address token, uint256 amount);

    function register(bytes32 contentHash, Allocation[] memory allocs, uint16 totalBps) external {
        require(!artifacts[contentHash].exists, "already-registered");
        require(totalBps == 10000, "totalBps!=10000");
        uint256 sum;
        for (uint i=0; i<allocs.length; i++) sum += allocs[i].shareBps;
        require(sum == totalBps, "sum!=10000");


        Artifact storage a = artifacts[contentHash];
        a.contentHash = contentHash;
        a.totalBps = totalBps;
        for (uint i=0; i<allocs.length; i++) a.allocations.push(allocs[i]);
        a.exists = true;

        emit Registered(contentHash, totalBps);
    }

    /// @dev Reparte `amount` del token TT a los creadores según bps.
    ///      Para PoC, asume token compatible con IERC20 y `transfer` directo.
    function distribute(bytes32 contentHash, address token, uint256 amount) external {
        Artifact storage a = artifacts[contentHash];
        require(a.exists, "not-registered");
        for (uint i=0; i<a.allocations.length; i++) {
            uint256 share = amount * a.allocations[i].shareBps / a.totalBps;
            // IERC20(token).transfer(a.allocations[i].account, share);
            // <-- sustituir con llamada real a token y controles (reentrancy guard, etc.)
        }
        emit Distributed(contentHash, token, amount);
    }
}
