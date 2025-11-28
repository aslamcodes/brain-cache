---
tags:
type:
date: 2025-08-24
done: false
---
![[Interrupts-1756056211030.png]]

The interrupt architecture must accommodate storing the state before servicing the interrupt, so that it can restore to that state after being done with servicing the interrupt.

Each interrupt has their own service routine. When an interrupt is received, a general interrupt routine is triggered, which examines the interrupt information and triggers the appropriate interrupt service routine with the help of a lookup table.

**The lookup** table or **Interrupt Vector Table** is a table of pointers to the program, which is generally stored in low memory for speed

# Interrupt request line
The CPU will have a **interrupt request line**, which the device controllers asserts for a signal with a interrupt number. The number is then gets used on the lookup table.

Maskable vs Non-maskable interrupt line. CPU can turn off the maskable interrupt line, during critical events.

![[Interrupts-1756099823703.png]]
# Interrupt chaining 
Often devices outrun the available address space, so solve this, we then pass interrupts to a head of list of interrupt handler, and iterate one by one, until we found a handler that can handle the interrupt. This is called **interrupt chaining**

