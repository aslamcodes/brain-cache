---
tags:
type:
date: 2025-12-17
done: false
---
In Go, interfaces are satisfied implicitly. Whether a type satisfies an interface depends on its **method set**—the collection of methods accessible on that type.

The rules are simple:

- **Value type `T`**: method set contains only methods with value receivers
- **Pointer type `*T`**: method set contains methods with both value and pointer receivers

This asymmetry is intentional and explains most interface satisfaction behavior in Go.

## An Example

Let's use one type throughout to see how this works:

```go
type Counter struct {
    value int
}

// Value receiver
func (c Counter) GetValue() int {
    return c.value
}

// Pointer receiver  
func (c *Counter) Increment() {
    c.value++
}
```

**Method sets:**

- `Counter` has: `{GetValue}`
- `*Counter` has: `{GetValue, Increment}`

## Why This Design?

When you call a method on a value, Go makes a copy. If `Increment()` were available on `Counter`, it would modify the copy, not the original. 

Conversely, when you have a pointer, Go can always dereference it to call value methods and use the pointer directly for pointer methods.

## Interface Satisfaction
Now the interface rules make sense:

```go
type Reader interface {
    GetValue() int
}

type Modifier interface {
    Increment()
}
```

**Which types satisfy which interfaces?**

```go
var r Reader
var m Modifier

c := Counter{value: 5}
r = c       // ✓ Counter has GetValue
m = c       // ✗ Counter doesn't have Increment

cp := &Counter{value: 5}
r = cp      // ✓ *Counter has GetValue  
m = cp      // ✓ *Counter has Increment
```

The compiler error says: `Counter does not implement Modifier (Increment method has pointer receiver)`

## The Practical Rule
If any method you need has a pointer receiver, you must use a pointer to satisfy the interface.

```go
type Incrementer interface {
    Increment()
    GetValue() int
}

func Process(inc Incrementer) {
    inc.Increment()
    fmt.Println(inc.GetValue())
}

func main() {
    c := Counter{value: 5}
    // Process(c)    // ✗ Won't compile
    Process(&c)      // ✓ Works
}
```
## Summary

Method sets determine interface satisfaction in Go. The rule is simple but has consequences:

- Value types see only value-receiver methods
- Pointer types see all methods
- If you need pointer-receiver methods through an interface, use a pointer

Once you internalize this, Go's type system becomes predictable and the compiler errors make sense.