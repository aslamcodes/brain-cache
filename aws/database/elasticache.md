Managed redis/memcached benefits like RDS
Help reduces load off of DBs
Makes application stateless, putting state in elasticache

Needs, heavy application code changes

DB Cache - Architecture
- Application looks for cache hit
- If not, queries DB
- Writes to cache

Session Storage - Architecture
- The seesion data gets stored on the cache
- Multiple stateless application can access this state

Cache must have invalidation strategy.
Elasticache Node is a network attached fixed size RAM block with a Compute

# Redis
- Data can be sharded or replicated for HA  
- Supports failovers 

# Memcached
- Data has to be sharded, and it our responisibilty to do so, accross nodes

# Replication
Cluster mode disabled
- One primary node, up to 5 replicas
- Async replication
- Primary rw, other r
- Multi AZ enabled by default
Cluster mode enabled
- Data is sharded partially
- Each shard behaves like a node group, one primary, upto 5 replicas
- Upto 500 nodes per cluster

500 shards - 1 replica (500 nodes in total)
..
..
83 shards - 5 replica (413 nodes in total)

# Scaling
[[elasticache-scaling]]
- Horizontal, upto 5 read replicas
- Scaling vertically will create a new node group, then data replication and then dns update

Auto Scaling
- Metric: Elasticache primary engine cpu utiliation metric 
- Add Shards to maintain the metric

# Connection
- Standalone node - One endpoint
- Cluster mode disabled
    - Primary Endpoing - rw
    - Reader endpoint - r (evently split acroos replicas)
    - NodeEndpoing - r 
- Cluster mode enabled
    - Configuration enpoint - one endpoint for r/w operation
    - NodeEndpoint - For r operation

# Sysops Operations
**Scale (cluster mode disabled)**
Horizontal - add upto 5 read replicas
Vertical - Update the config, but internally aws creates new node group and replicates the data

**Scale (Cluster mode enabled)**
Horizontal - Supports both online and offline
    - Resharding:  Add or remove shards
    - Shard Rebalancing: Evenly distributes keysapces across the shards
    
Vertical - Supports online scaling
    - Adjust the node types

Metrics
- Evictions (Memory is overfilled, add more memory or evict LRUs)
- CPUUtilizations (Overall Host CPU usage)
- SWAP Usage (Should not exceed 50MB)
- CurrConncetions
- 

