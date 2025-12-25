	# Intuition
> An interface between Computer Hardware and The processes

I always think kernel as the *orchestrator* of computer resources. It will manage the resources and provide an interface to the processes that are running. 

1. Memory Management
2. Process Management
3. Device Drivers
4. System calls
# Memory Management
1. Kernel Space 
	- A process running in the kernel space has unrestricted access to the hardware
	- eg - Kernel Code, Device Drivers, [[Kernel Modules]]
	- The memory is simply divided into kernel and user space - as all bits and its context lives in memory - The kernel as a program gives you unrestricted access to the hardware resources when you are a kernel space program. 
2. User Space
	- The application programs get access to data by making special request called system calls. 
	- Such as when your go code says `os.Open(file)`, it is simply making a system call.
	- eg Interrupts, GNU applications, basically everything except the kernel space applications
