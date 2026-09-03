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
```text
User registers
      ↓
User logs in
      ↓
User views available events
      ↓
User selects an event and category
      ↓
User enrols and makes payment
      ↓
User becomes a confirmed participant
      ↓
Participant receives a bib number
      ↓
Event takes place
      ↓
Administrator records results
      ↓
User views their results
```

---
Here ERD Image

## API Endpoints

The system provides REST API endpoints for managing the different parts of the application.

### Authentication

```text
POST   /api/auth/register
POST   /api/auth/login
POST   /api/auth/logout
GET    /api/auth/profile
PUT    /api/auth/profile
```

### Users

```text
GET    /api/users
GET    /api/users/{id}
POST   /api/users
PUT    /api/users/{id}
DELETE /api/users/{id}
```

### Events

```text
GET    /api/events
GET    /api/events/{id}
POST   /api/events
PUT    /api/events/{id}
DELETE /api/events/{id}
```

### Categories

```text
GET    /api/categories
GET    /api/categories/{id}
POST   /api/categories
PUT    /api/categories/{id}
DELETE /api/categories/{id}
```

### Enrolments

```text
GET    /api/enrolments
GET    /api/enrolments/{id}
POST   /api/enrolments
PUT    /api/enrolments/{id}
DELETE /api/enrolments/{id}
```

### Results

```text
GET    /api/results
GET    /api/results/{id}
POST   /api/results
PUT    /api/results/{id}
DELETE /api/results/{id}
```

---

## Tools

The system will be developed using:
**In future For now its SSMS for database**
* **Backend:** ASP.NET Core Web API
* **Programming Language:** C#
* **Database:** MySQL
* **Database Tool:** MySQL Workbench
* **API Testing:** Postman
* **Frontend:** Web, Mobile, or Desktop Application
---
##  Getting Started

### 1. Clone the project

```bash
git clone 
```

### 2. Create the database

Create a MySQL database called:

```sql
CREATE DATABASE EventManagementDB;
```

### 3. Select the database

```sql
USE EventManagementDB;
```

### 4. Run the SQL scripts

Run the SQL commands provided in the project to create the following tables:

* USER
* ROLE
* USERROLE
* EVENT
* CATEGORY
* ENROLMENT
* PARTICIPANT_EVENT
* RESULT

### 5. Configure the database connection

Add your MySQL connection string to your application's configuration file.

Example:

```json
{
  "ConnectionStrings": {
    "DefaultConnection": "Server=localhost;Database=EventManagementDB;User=root;Password=your_password;"
  }
}
```

> Replace `your_password` with your actual MySQL password.

### 6. Run the application


---

##  User Roles

The system may include the following roles:

| Role            | Responsibilities                                             |
| --------------- | ------------------------------------------------------------ |
| Administrator   | Manages users, events, categories, participants, and results |
| Event Organizer | Creates and manages events                                   |
| Participant     | Enrols in events and views results                           |

---

##  Example Event

```text
Event Name: Johannesburg City Marathon
Date: 15 October 2026
Distance: 42.2 km
Location: Johannesburg
Entry Fee: R250.00
Status: Upcoming
```

---

##  Future Improvements

Possible future features include:

* Online payment integration
* Email notifications
* SMS notifications
* QR code participant check-in
* Live participant tracking
* Digital certificates
* Event leaderboards
* Mobile application support

---

##  Conclusion

The **Marathon Event Management System** provides a simple way to manage marathon events from registration to final results. The system helps reduce manual work and keeps event, participant, payment, and result information organised in one central database.

