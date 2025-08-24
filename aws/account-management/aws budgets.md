---
tags:
  - aws
type:
date: 19th July 2025
done: false
---

| Feature           | **AWS Budgets**                          | **Billing Alarms (CloudWatch)**       |
| ----------------- | ---------------------------------------- | ------------------------------------- |
| **Granularity**   | Fine-grained (services, linked accounts) | Entire account only                   |
| **Forecasting**   | Yes                                      | No                                    |
| **Notifications** | Multiple thresholds (e.g., 80%, 100%)    | Single threshold                      |
| **Frequency**     | Daily checks                             | ~6-hour delay (based on billing data) |
| **Customization** | Highly customizable                      | Very basic                            |
| **Service**       | Budgets Dashboard                        | CloudWatch + Billing metrics          |
| **Ideal for**     | Proactive cost control                   | Simple cost monitoring                |

Send alarms

Types of budgets
- Usage
- Cost
- Reservation (tracks utilisation)
- Savings plan

Upto 5 sns notifcation per budget

![[Screenshot 2025-07-06 at 12.17.40.png]]


![[Screenshot 2025-07-06 at 12.22.58.png]]
