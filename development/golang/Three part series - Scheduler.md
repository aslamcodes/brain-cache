---
tags:
type:
date: 2025-09-11
done: false
---
> [[Three part series - Scheduler#Scheduling in GO|Skip to go]]

> [!NOTE] Takeaways
> - Design Go Code with as much Safe points as possible, this helps reduce latencies and increase overall performance
> - The ability to mask IO work as CPU bound task via context switching goroutines within the goruntime is what that stands out off a tranditional OS level context swtiching, from 12k to 2k
> - You can reasonably expect to get all of your work done (CPU and IO/Blocking bound) with just one OS Thread per virtual core
> - Sequential success -> Readability -> technical reviews -> think about concurrency
# Concept of thread
- Is the concept of thread tangible?
	- Logical construct
- Is it a abstract or concrete concept?
	- Yes, abstraction from OS and runtime
- How it is represented in the hardware level?
	- **Program Counter (PC/IP)** → which instruction to run next
	- **Registers** → general-purpose, flags, stack pointer
	- **Stack memory** → for function calls, locals
- Thread is path of execution of multiple machine instructions in sequential manner, that means a thread is collection of pointers to instruction in order, or collection of instruction?
	- **Neither**, Its just program counter and execution context, the code live in memory
- Thread = execution context + current position

Each process is given a individual thread, and scheduling decisions are done at the thread level. 

The scheduler are responsible for making sure all the cores are not idle and all the threads are given its turn. 

The machine code is stored sequentially in the RAM, and each instruction has a instruction size, the **control unit CU** updates the **Program counter** by the next instruction size. 

# Thread states
- **Waiting** - If lot of threads are waiting, that is an indicator of bad performance
- **Runnable** - If lot of threads are runnable, and havent' got the core time, it means its time to upgrade the hardware
- **Executing** - ok

# Types of thread
**CPU Bound** - never likely to be at waiting state
**IO Bound** - Network calls, syscalls and stuff

# Context switching
> The act of swapping threads into the core is called context switching

Context switching are expensive since
- Time takes to perform the context switch ~1000 to ~1500 nanoseconds
- An Exection takes around ~12 to ~10 nanoseconds
- So you're losing around 12k executions
https://www.youtube.com/watch?v=jEG4Qyo_4Bc&t=266s

This is an advantage, if we are dealing with IO related task, we should not let the CPU go to IDLE if we have runnable threads.

# Cache Line
A Cache line is 64 bytes chunk of memory transferred from the main memory to the caching system

![[Three part series - Scheduler-1757921113449.png]]

The CPU cache doesn’t grab memory one byte at a time. It always exchanges data in **chunks** (cache lines).
- If the cache line size is **64 bytes**, and you access 1 byte at address `0x1000`, the CPU actually pulls in the whole 64-byte block (`0x1000–0x103F`) into cache.
- Any later access within that block is now a **cache hit**.

In a multi threaded application, each thread that needs to read from the same data, will have their own cache line pull, resulting in a performance nightmare

**False Sharing** - Core0 writes to its cache invalidates Core 1. 

If one of the cores, writes to the cache data, and the hardware makes all other caches as invalid and all other cores need to get its data from the main memory (~100 clock cycles) This is called cache coherency problem

# Scheduling in GO
When go program is run, it is given a "Logical representation of all the cores in the CPU **(P)'s**

```
package main

import (
	"fmt"
	"runtime"
)

func main() {

    // NumCPU returns the number of logical
    // CPUs usable by the current process.
    fmt.Println(runtime.NumCPU())
}
```

- Every P is assigned a OS thread **M**
- Goroutines are application level threads, and called **G**
- Just as OS threads are context switched on and off of a **P**, Goroutines are context switched on and off a **M**

- **GRQ and LRQ** - Global Run Queue and Local Run Queue
- "Each **P** is given with **LRQ** that contains **G**s that are executed **within** the context of **P**, And the **G**s within the **LRQ** are context switched on and off of the **M**s" - That way the the cost of context switching OS threads is mitigated when **G**s with same context are packed in a **GRQ/LRQ**s, genius."
- Go scheduler runs on user-space. Go runtime scheduler is more of a co-operative scheduler than preemptive scheduler, but the control is given to go runtime rather than the developer. This means go scheduler must be given with **well defined user space events** as a signal to **safe point** to **safely** context switch go routines, perform GC activities and maintenance tasks.
- 

# Concurrency and Parellelism
- Concurrency improves responsiveness and structure but can slow throughput due to switching or scheduling **overhead**.
- Parallelism provides speedup for CPU-bound tasks, but only up to the point where **overhead** and resource limits dominate.

## Workload
- The workload is more CPU bound, then leveraging parallelism makes sense
- IO bound, then concurrency makes sense.

IO bound Goroutines naturally be in a waiting state, then there could be a another goroutine that can take its place instead. More goroutines than that of CPU threads available could result in bettter performance here.