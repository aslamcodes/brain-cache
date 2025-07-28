---
tags: 
type: 
date: 2025-07-27
done: false
---
1. You create a event in the change calendar to have open or close. 
2. you check at your Automation **document**
```yaml
- name: CheckCalendar
  action: aws:assertAwsResourceProperty
  inputs:
    Service: ssm
    Api: GetCalendarState
    CalendarNames:
      - "arn:aws:ssm:region:account-id:document/calendar-name"
    PropertySelector: $.State
    DesiredValues:
      - OPEN

```