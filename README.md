# PROG212-GR5-PART-1
# Marathon Event Management System

A simple system for managing marathon events, participants, categories, enrolments, and race results.

##  Overview

The **Marathon Event Management System** helps administrators organise and manage marathon events. Users can register, enrol in events, join categories, and view their results after an event.

The system supports three main activities:

* Managing users and their roles
* Creating and managing marathon events
* Registering participants and recording race results
  **# Features**

###  User Management

* Register and manage users
* User login and authentication
* Assign roles to users
* Activate or deactivate users

###  Event Management

* Create marathon events
* Set event date, time, venue, and location
* Define marathon distance
* Set entry fees
* Manage event status
  ###  Enrolment Management

* Allow users to enrol in events
* Select an event category
* Track enrolment status
* Track payment status and amounts

### Participant Management

* Add participants to events
* Assign bib numbers
* Track participant entry status

### Results Management

* Record finishing positions
* Record finish times
* Calculate participant rankings
* Track category rankings
* Record prize money
##  Database Relationships

The main relationships in the system are:

```text
USER <<-->>USERROLE <<->>> ROLE
 
 EVENT <<->>CATEGORY
                    
ENROLMENT <<->> PARTICIPANT_EVENT
          RESULT
```

### Example Flow



