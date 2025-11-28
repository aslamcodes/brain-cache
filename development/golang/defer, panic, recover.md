---
tags:
type:
date: 2025-09-08
done: false
---
A **defer statement** pushes a function call onto a list. And executed in Last in, First Out order. The expression is evaluated when the function is *deferred(pushed to list)*. A Defer function executes just before the surrounding function about to exit (after return statement or panics)

- If you pass `i` as an **argument** to a deferred call → value is taken immediately.
- If you **modify a named return variable** inside a deferred closure → it affects the final return value.

*Panic/Recover* are *Throw/Catch* equivalent. 