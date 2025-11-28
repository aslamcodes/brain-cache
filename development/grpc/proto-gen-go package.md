---
tags:
type:
date: 2025-09-06
done: false
---
```
option go_package = "module_path/`"
```

When you `go_package` is set to a package, it will create the files at the directory. 

It will create components such as types, marshalling/unmarshalling components, client/server interfaces

So in short: **structs + boilerplate methods + service interfaces + client stubs**.

So stub, in context here, represents a remote service locally, enables the client to call the services without  handling network details. 

"Just enough code that compiles and runs"