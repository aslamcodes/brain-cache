---
tags:
type:
date: 2025-12-15
done: false
---
`appstreamfile v0.1.0` only supports local File System from the image builder. 

```sh
appstreamfile.exe -source local -location C:/path/to/config
```
For a tool like this, we definitely need to support S3, HTTP and other external sources. As the external sources are limitless, I need a way to determine the arguments, so its easy to expand for future integrations.

I'm thinking that it is fine to have source specific arguments for `s3`, `http` and so on, this is easily possible as `BackendSource` can have its own implementation to fetch the config

```sh
appstreamfile -source s3 --bucket my-bucket --key path/config.yaml
appstreamfile -source http --url https://example.com/config.yaml
appstreamfile -source local --path C:/path/to/config
```

Any concrete type implementing `BackendSource` can have arbitrary arguments and any way of of fetching the config in `GetConfig()` implementation. 

```go
type BackendSource interface {
	GetConfig() c.Config
}
```


