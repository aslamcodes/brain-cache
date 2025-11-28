---
tags:
type:
date: 2025-11-02
done: false
---
Every process in a UNIX and UNIX-like system will get three files to work with.
1. stdin
2. stdout
3. stderr

Each file that a process handles is going to have a file descriptor.

stdin - 0
stdout - 1
stderr - 2

and any other files that we may access in the process is going to be assigned a file descriptor starting with the lowest one being 3. 

However a process can and should be limited handle a set of files at a time, so every process have a limit to have files opened up. This is why if we write code for scale, we should always close those files, and we should think about scale from start. 

Coming back to stdin, stdout, stderr, where are those files? 

`go run main.go | grep sucess`

Here we can observe two processes. `go` and `grep`. 

go's stdin is a `Terminal`, ie Its an apex from the start. 
go's stdout is a `pipe to grep` 
grep's stdin in a `pipe from go`
grep's stdout is a `Terminal`, ie its the last

When we say `Terminal`, its what the screen reads from. Our terminal emulators present the stdout which is linked to a file that often looks like /dev/tty001. Use the `tty` utility to know from which file that you Terminal emulator like **Ghossty**, **Terminal.app** reads from.

In our programs, we have the ability to know if we are working at a terminal level or not, for example

```go
package main

import (
	"fmt"
	"os"
	
	"github.com/x/term"
)

func isTerminal(f *os.File) bool {
	return term.IsTerminal(f)
}

func main() {
	if isTerminal(os.Stdout) {
		fmt.Println("yes from terminal")
	} else {
		fmt.Println("no not from terminal")
	}
}

```

If we look some abstractions below

```go
package main

import (
	"fmt"
	"os"

	"github.com/x/term"
	"golang.org/x/sys/unix"
)

func isTerminalwUnix() bool {
	t, err := unix.IoctlGetTermios(int(os.Stdout.Fd()), unix.TIOCGETA)

	fmt.Println(t)

	if err != nil {
		return false
	}
	return true
}

func isTerminal(f *os.File) bool {
	return term.IsTerminal(f)
}

func main() {
	if isTerminal(os.Stdout) {
		fmt.Println("yes from term")
	} else {
		fmt.Println("no from term")
	}

	if isTerminalwUnix() {
		fmt.Println("Yes from unix")
	} else {
		fmt.Println("no from unix")
	}
}

```

Here's the content of the `IoctlGetTermios` function

```go
type Termios struct {
	Iflag  uint64
	Oflag  uint64
	Cflag  uint64
	Lflag  uint64
	Cc     [20]uint8
	Ispeed uint64
	Ospeed uint64
}

func IoctlGetTermios(fd int, req uint) (*Termios, error) {
	var value Termios
	err := ioctlPtr(fd, req, unsafe.Pointer(&value))
	return &value, err
}
```

We are using the ioctl, which is a way to manage IO information in a POSIX compliant systems. and the `unix.TIOCGETA` is a contant value defined in the unix package. which is a `command code` to **GET** **T**erminal **IO**  **A**ttributes, with the IO*C*TL interface. Think about why i bolded out some characters. 

```go
...
	TIOCGETA                                = 0x40487413
...
```

Basically the logic is, the ioctlPtr function throws an error if our file is not a terminal device, we can use that information to know whether we are working at terminal level or not. 

Why you may ask? 

Its mostly going to be humans that gonna be working at the terminal level, we show them progress bars, loading spinners and everything, we don't have to do that to a another utility, you know what i mean right?
