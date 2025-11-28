---
tags:
type:
date: 2025-08-25
done: false
---
bit - 0 or 1
bytes - most common in computers, 8 bits
word - comptuters native unit of data. if a computer is 64-bit registers and memory addressing, then its word size is 8bytes. Operation are executed in its native unit size.

Throughput is measured in bytes and collection of bytes. MB, KB, GB

The CPU `load`s instruction from the memory. Most of the general purpose computer programs are stored in main memory, often DRAM. But RAM is volatile, hence Bootstrap programs are stored in EEPROM.
# Addressing
All forms of memory provides array of bytes and each bytes has a \*address

`load` moves from memory to cpu registers
`store` stores from cpu registers to main memory

> CPU often loads program stored in addressed, that is stored in `program counter`

# 