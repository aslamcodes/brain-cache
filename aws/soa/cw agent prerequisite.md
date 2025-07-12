- We must install cloudwatch agent on all instances through CLI
- the instance should have a role to push metrics/logs to cloudwatch
- `CloudWatchAgentServerPolicy` or ``
```
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "cloudwatch:PutMetricData",
        "logs:PutLogEvents",
        "logs:CreateLogGroup",
        "logs:CreateLogStream"
      ],
      "Resource": "*"
    }
  ]
}

```
