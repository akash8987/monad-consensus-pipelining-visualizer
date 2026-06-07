# MonadBFT Consensus Pipelining Visualizer

In 2026, sustaining transaction processing speeds of up to 10,000 TPS requires extreme optimization within the distributed systems layer. **Monad** achieves this through **MonadBFT**, an advanced, high-performance consensus mechanism based on HotStuff that decouples and pipelines block production steps.

Traditional blockchain networks require a strict sequential loop: propose a block, wait for consensus validation parameters, execute the state transitions, and only then propose the subsequent block. MonadBFT introduces an efficient **Pipelined Topology** where round-robin block proposals, cryptographic voting, and execution happen concurrently across staggered block phases.

## Pipelined Consensus Topology
* **Round-Staggered Proposing:** While Block $N$ is being executed and finalized by background threads, Block $N+1$ and Block $N+2$ are already actively accumulating quorum certificates ($QC$) in the consensus layer.
* **BLS Signature Aggregation:** Signatures from validating nodes are grouped into a single aggregated cryptographic proof, slashing network bandwidth overhead.

## Setup & Profiling
1. Install development framework structures: `npm install`
2. Launch the pipelining timeline tracking simulation: `node simulatePipelineTimeline.js`
