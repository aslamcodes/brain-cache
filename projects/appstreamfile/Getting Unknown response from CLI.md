---
tags:
type:
date: 2025-12-15
done: false
---
Almost all of the image-assistant operation work as expected, but except image-build service. When the command is executed outside of the program it works.
```powershell
C:\Program Files\Amazon\Photon\ConsoleImageBuilder\image-assistant.exe create-image --name "example_image" --display-name "example image" --description "example image" --enable-dynamic-app-catalog --tags "team" "infra" "env" "dev"
ConsoleImageBuilder 4.0.0.886
Copyright 2022 Amazon.com, Inc. or its affiliates. All Rights Reserved.
ERROR(S):
Option 'name "example_image"' is unknown.
Option 'display-name "example image"' is unknown.
Option 'description "example image"' is unknown.
Option 'tags "team" "infra" "env" "dev"' is unknown.
Required option 'name' is missing.
```

The issue is with my mental model, I thought go's `exec` works like any other shell, but rather it needs **argv** list

My original version
```go
func (i *Image) Args() []string {
	args := []string{}

	if i.Name != "" {
		args = append(args, fmt.Sprintf(`--name "%s"`, i.Name))
	}

	if i.DisplayName != "" {
		args = append(args, fmt.Sprintf(`--display-name "%s"`, i.DisplayName))
	}
	if i.Description != "" {
		args = append(args, fmt.Sprintf(`--description "%s"`, i.Description))
	}
	if i.UseLatestAgentVersion {
		args = append(args, "--use-latest-agent-version")
	}
	if i.EnableDynamicAppCatalog {
		args = append(args, "--enable-dynamic-app-catalog")
	}
	if i.DryRun {
		args = append(args, "--dry-run")
	}

	if len(i.Tags) > 0 {
		tagString := []string{"--tags"}
		for _, tag := range i.Tags {
			parts := strings.SplitSeq(tag, ":")
			for part := range parts {
				tagString = append(tagString, fmt.Sprintf(`"%s"`, part))
			}
		}
		args = append(args, strings.Join(tagString, " "))
	}

	return args
}

```
The correct version
```go
func (i *Image) Args() []string {
	var args []string

	if i.Name != "" {
		args = append(args, "--name", i.Name)
	}

	if i.DisplayName != "" {
		args = append(args, "--display-name", i.DisplayName)
	}

	if i.Description != "" {
		args = append(args, "--description", i.Description)
	}

	if i.UseLatestAgentVersion {
		args = append(args, "--use-latest-agent-version")
	}

	if i.EnableDynamicAppCatalog {
		args = append(args, "--enable-dynamic-app-catalog")
	}

	if i.DryRun {
		args = append(args, "--dry-run")
	}

	if len(i.Tags) > 0 {
		args = append(args, "--tags")
		for _, tag := range i.Tags {
			// keep exactly what the CLI expects
			args = append(args, tag)
		}
	}

	return args
}

```