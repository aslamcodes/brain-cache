---
tags:
type:
date: 2025-12-25
done: false
---
> Store contract is more like API contract but for storage

svelte has a store implementation on `svelte/store` 

The store values are prefixed with `$` symbols. Local variables must not have the $ prefix. Although it feels arbitrary, the intent for this is to visually distinguish between store values and local values. I dislike using symbols for variable names, it'd be nice if it could be like store.variable format, since svelte is going towards explicit language.

Jinx, That's prior to svelte5, you can export the `$state()` rune and its made universal, as it can also provide cross component reactivity.

```js
export const userState = $state({
	name: 'name',
	/* ... */
});
```

But its not deprecated, stores are meant to be used for advanced use cases