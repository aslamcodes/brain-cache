---
tags:
type:
date: 2026-01-01
done: false
---
The process of retraining a pre-trained model's parameters based on a specific often smaller dataset

**SFT - Supervised Fine Tuning.** 
The dataset is provided explicitly telling what data is beforehand

> We're not creating a new model, we're just creating a new outputted state of the model

# Types of fine tuning
**Changing the dataset**
- Instruction fine tuning - good and bad prompt examples provided
- Domain specific fine tuning - a new knowledge base to be provided (blogs, docs)
**Changing the method of training**
- Full Fine Tuning - All of the models weights are updated, and **expensive**
- PEFT - Parameter efficient fine tuning, update small set of parameters and freezes the rest
- Last Layer Fine Tuning - Freeze all the layer except the last layer
**Removing Params and Weights**
- Pruning - Removing parameters, to make the model smaller and efficient (less compute)
	- Train-Time Pruning
	- Post-Training Pruning