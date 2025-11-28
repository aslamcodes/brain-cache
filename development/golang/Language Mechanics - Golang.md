---
tags:
type:
date: 2025-09-23
done: false
---
Frame boundaries are individual memory space for a given function.  A function has direct access to the memory inside its frame, but access to memory ouside requires indirect access which is most probably controlled by go runtime

Each go routines as of 1.8, has allocated a memory space of 2048 bytes, which is what that provides physical memory space for frame boundaries



High level Idea
![[Language Mechanics - Golang-1758620781023.png]]

When a data is pass by value
![[Language Mechanics - Golang-1758620903579.png]]

pass by addr
![[Language Mechanics - Golang-1758621074549.png]]