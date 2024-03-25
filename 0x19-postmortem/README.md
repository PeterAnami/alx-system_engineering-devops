# My First Postmortem

## Issue Summary

- **Duration of outage:** The outage lasted for 2 hours, starting at 14:00 UTC and ending at 16:00 UTC.
- **Impact of outage:** The outage caused a disruption in service for approximately 10,000 users.
- **Root cause of outage:** The root cause of the outage was a bug in a left padding function in one of the packages used as a dependency in the codebase.

## Timeline

- 14:00 UTC: Incident discovered by monitoring systems.
- 14:05 UTC: Issue detected as a spike in error rates.
- 14:10 UTC: On-call engineer notified and began investigating the issue.
- 14:20 UTC: Debugging steps taken to identify the root cause.
- 14:45 UTC: Issue escalated to the development team.
- 15:00 UTC: Root cause identified as a bug in a left padding function in one of the packages used as a dependency in the codebase.
- 15:30 UTC: Fix implemented and deployed.
- 16:00 UTC: Service fully restored.

## Root Cause and Resolution

The root cause of the outage was identified as a bug in a left padding function in one of the packages used as a dependancy in the codebase. This bug caused an unexpected behavior that resulted in a disruption of service for approximately 10,000 users. The development team was able to quickly identify and fix the issue, and fix was deployed within an hour of the root cause being identified. Service was fully restored at 16:00 UTC.

## Corrective and Preventive Measures

- **Improvements and fixes:** To prevent similar incidents from occuring in the future, several improvements and fixes have been identified. These include updating the package to a version without the bug, implementing additional monitoring and alerting systems to detect issues earlier, and improving communication and escalation procedures to ensure faster resolution times.
- **Tasks to address the issue:** The following tasks have been identified to address the issue:
    1. Remove the dependancy and rewrite the functionility internally.
    2. Implement additional monitoring and alerting systems.
    3. Improve communication and escalation procedures.
    4. Conduct a thorough review of the codebase to identify and fix any other potential issues.
