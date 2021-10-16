# Database Hw3

## Q1

![alt](/Users/jiwang/Github/csci4380/hw3/hw3_q1_submission.png)



## Q2

```
Kudos(Id, Timestamp, Text, UserEmail)
key: Id

Users(Email, Address, preferred pronouns, preferred name, password, PersonalStatement)
key: Email

Pods(Id, Creation Date, Name, City, State, Neighborhood, Private/Public, Values, Status, UserEmail, JoinedDate)
key: Id

Services(Time, Day, NumUnits, Capacity, UserEmail, PodId, ServiceTypeId)
key: Time, Day, UserEmail, PodId, ServiceTypeId

ServiceTypes(Id, Description, UnitType, Name)
key: Id
```

