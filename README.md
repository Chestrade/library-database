# library-database
A database that allows a fictional library to manage its book rentals and its personnel.
This is a student project. The code contains french terminology because it is part of a data base course given in french. Once it's submitted, I will translate everything into English.

## Context
A multisectoral university library wishes to computerize the management of its document lending service and its personnel. A relational model has been designed to record all relevant information in a database.
The relationship between different entities can be described as follows : 
- **Documents** (books, magazines, digital media, etc.) are provided by several **publishers** and are assigned to **sections** in the library.
- Every section contains **employees**.
- Among the employees, some are **team leaders**. A team leader can be responsible for multiple employees, but every emplopyee has only one team leader.
- Each section contains only one manager.

To make things more simple, we consider that :
- Every loan concerns only one document.
- Every acquisition concerns only one document and one section.

## What is asked
### 1. Create the database by using SQL querries.
- It is important to properly assign primary and foreign keys.
- Each table needs to contain at least 2 different constraints (CHECK, NOT NULL, etc.).
- Every foreign key constraint needs to have an explicit name.
- The ON DELETE option **should not** be used.

### 2. Insert the following information into the database (see annex bellow) :
- Loan : 2005, 2006, 2007, 2009, 2013, 2014, 2015, 2019 and 2020.
- Section : Science, Litterature, Computer Science, History, Medecine, Arts and Administration.
- Employee : 1, 2, 3, 9, 14, 15 and 17.
- Acquisition : 3001, 3002, 3003.
- Document : Advanced databases, Introduction to SQL, Algorithms, Distributed Systems.
- **IMPORTANT** : Add any other entry that would cause issues due to foreign constraints even if they are explicitly mentionned.

### 3. Delete the following entries from the database : 
- Loan : 2005
- Employee : 2,3

If one or more deletions fail (nt), explain why (comment in the .sql file).

### 4. Add a **Loan_date** field in the Loan table.
This field will have the current date as the default value. (DD/MM/YYYY).


### 5. With a SQL request, change the name of the document **after the creation of the table**
**"Distributed Systems"** in the Documents table should be renamed to **"SysDistrib"**.
- Explain why this request does not work.
- Suggest a solution that allows the name to be changed while maintenaing the coherence of the database.

### 6. In a table, display the total number of lent books by their title.
For example, if a document has been lent 1 time with a quantity of 3 and another time with a quantity of 2, the result will be 5.
This table needs to display the title, loan quantity and the langage of the document.

### 7. Display the sections that had no loan.
### 8. Display the names of the employees who work in a section that loaned less than 2 different documents.
### 9. Increase the salaries of all the employees who earn less than 60 000$.
### 10. Delete all tables without causing errors. DO NOT USE DROP DATABASE.

## Format
All the code should be located in **one** .sql file.

## Annex
**Editor table**
| Editor_num  | Editor_name | 
|-------------|-------------|
| 10      | Pearson        | 
| 20     | OReilly      | 
| 30      | Springer      | 
| 40      | Dunod     | 

**Document table**
| Document_title      | Document_type | Document_Language | 
|---------------------|---------------|-------------------|
|Advanced databases   |Book           |French             |
|Introduction to SQL  |Book           |French             |
|Algorithms           |Book           |French             |
|Distributed Systems  |Book           |English            |

**Section Table**
|Section_name     | Floor_number | Telephone_number |Team_leader_number| 
|-----------------|--------------|------------------|------------------|
|Science |1 | 5141111111|1|
|Litterature|2|5142222222|2|
|Computer Science|3|5143333333|2|
|History|4|5144444444|2|
|Medicine|5|5145555555|1|
|Arts|6|5146666666|15|
|Administration|7|5147777777|17|

**Employee Table***
| Employee_number   | Name | Salary | Section_Name|
|-------------------|------|--------|-------------|
|1|Tremblay|62000|Science|
|2|Gagnon|60000|Litterature|
|3|Roy|65000|Computer Science|
|9|Bouchard|58000|History|
|14|Pelletier|70000|Medecine|
|15|Lefebvre|55000|Arts|
|17|Moreau|72000|Administration|

**Acquisition table**
|Acquisiton_number|Acquired_quantity|Document_title|Section_name|Editor_number|
|-----------------|-----------------|--------------|------------|-------------|
|3001|10|Advanced databases|Computer Science|30|
|3002|8|Introduction to SQL|Computer Science|20|
|3003|6|Algorithms|Science|10|
|3004|5|Distributed Systems|Computer Science|30|
|3005|4|Algorithms|Science|10|

**Loan Table**
|Loan_number|Quantity|Document_title|Section_name|
|-----------|--------|--------------|------------|
|2005|2|Advanced databases|Computer Science|
|2006|1|Introduction to SQL |Computer Science|
|2007|3|Algorithms|Science|
|2009|1|Algorithms|Science|
|2013|2|Distributed Systems|Computer Science|
|2015|4|Advanced databases|Computer Science|
|2019|1|Algorithms|Science|
|2020|1|Distributed Systems|Computer Science|


