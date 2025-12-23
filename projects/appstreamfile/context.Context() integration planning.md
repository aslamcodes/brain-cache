---
tags:
type:
date: 2025-12-22
done: false
---
# The problem

# Background knowledge
# Integration Planning
- The base context is going to be non cancellable, and other time bound and cancellable contexts will be derived from it and passed downwards
- For appstreamfile, which is based on variety of IO calls (network, disks, other executables), should the component that performing the operation may have timeouts, ie components interactive with IO boundary or the root context is to have a universal timeout and configurable by the user?
	- The former is better. Your parent context remain as the root, while your child operations doing the IO operations should embrace the deadlines, cancellation. 
	- This is similar to server components from React. You'd try to keep the reactivity until the last component. Here, you would keep the timeouts, cancellation upto the last IO boundary.

ChatGPT
- For **appstreamfile**, which spans multiple IO boundaries (network, disk, external processes), timeouts should live **at the IO-performing components**, not only at the root context.
- Keep the **parent context as the root** (for overall cancellation).
- Each **child operation** that crosses an IO boundary should set its **own deadline/timeout** and respect cancellation.
- This keeps control close to where latency and failure actually happen.
- Analogy: like **React server components**—you defer side effects and constraints until the last possible boundary.
- Result: better granularity, safer defaults, and user-configurable behavior without over-constraining the whole execution.