---
tags:
type:
date: 2025-09-07
done: false
---
CPU has threads
OS has threads
Programming languages has their own threads

From what I understand from Reddit, Say a Quad Core processor with 4 core and 4 thread, can only run 4 threads at the same time. The Programming lanaguges/OS thread can spin up tens, and thousands of threads. Only 4 can be run at the same time. The OS juggles between them in sub milliseconds so, it feels like they all happen at the same time. [[concurrency-parallelism]], concurrency enabled parallelism

- **CPU threads** = hardware execution contexts (like 4 cores → 4 threads, or 8 with hyper-threading). That’s the max number of instructions executed _at the same instant_.
- **OS threads** = abstractions managed by the kernel. You can create thousands, but only as many as hardware threads can run _in parallel_. The rest get time-sliced.
- **Language threads (green threads, goroutines, fibers, etc.)** = scheduled by runtime, often multiplexed onto fewer OS threads.