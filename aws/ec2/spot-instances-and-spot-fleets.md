Define a max spot price bid, keep the instance

If current spot price > max price, choose to stop or terminate, all within 2 minutes time.

Spot block: Block for a specified time frame, one to 6 hours

Spot price varies based on a AZ's capacity

![[spot-cycle.png]]

PS Cancelling spot request won't terminate instances.

So cancel and terminate the instances to get rid of instances

# Spot fleets
= Set of spot instances + optional on demand instances
Stops launching fleet, when reaching capacity or max cost

Gives us some extra savings