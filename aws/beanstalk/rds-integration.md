---
tags: 
type: 
date: 2025-07-20
done: false
---
- When a database instance is coupled with an EB environment it provides the connection information to the application by setting up environment variables
- If this is the first time setting up an database to your existing environment, first test in testing [[environment]]

- Moving to prod, decoupling the database offers more flexibility, as multiple environments can be connected to a external rds database

# Decoupling the database
- You have to choose what happens when you decouple a database from environment
	- Snapshot (Restore into a EB environment or standalone instances)
	- Retain
	- Delete (Dangerous)