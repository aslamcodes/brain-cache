---
dg-publish: true
tags: 
type: 
date: 19th July 2025
done: false
---

| Feature           | **StatsD**                           | **CollectD**                          |
| ----------------- | ------------------------------------ | ------------------------------------- |
| **Type**          | Metrics aggregator                   | System statistics collection daemon   |
| **Language**      | Node.js (originally), many ports     | C                                     |
| **Use Case**      | App-level metrics (counters, timers) | System-level metrics (CPU, mem, etc.) |
| **Input**         | Metrics sent by apps (UDP/TCP)       | Pulls from system plugins             |
| **Plugins**       | Few                                  | Rich plugin ecosystem                 |
| **Protocol**      | Plaintext over UDP/TCP               | Custom binary + network plugins       |
| **Storage**       | Forwards to backend (Graphite, etc.) | Forwards to RRD, Graphite, InfluxDB   |
| **Overhead**      | Low                                  | Medium                                |
| **Customization** | High (in app code)                   | High (via plugins)                    |

- Use **StatsD** for app instrumentation.
- Use **CollectD** for system-level monitoring.
- Combine both for full observability.
	\- ChatGPT
