---
tags:
type:
date: 2025-12-28
done: false
---
> A feature is a characteristic extracted that has been **Prepared*** for our [[ML Model]] to ingest to **infer** prediction

A **feature** is an **input signal that carries information** useful for a task.
Concrete:
- Image → pixel intensity, edge, texture
- Text → word presence, embedding dimension
- Audio → frequency energy
- Tabular → age, income, clicks
 In neural nets:
 - Early layers → simple features
 - Deeper layers → abstract features
 - Each neuron learns to detect **one pattern** (a feature)