# Crime Organization Graph Database  

## Description  
This is a **graph database** project modeling connections within organized crime groups. It helps detectives and law enforcement track hierarchies, relationships, and suspicious transactions in criminal organizations.  

> **Note:** This database is **example-based**; names, companies, and hierarchy are illustrative. The structure will vary for each organization.  

> **This project was completed as part of university studies in a group of 2**  

---

## Database Design  

### Node Labels  
- **Person** (with roles: Boss, Underboss, Caporegime, Soldier, Member, Associate)  
- **Company** (legal or illegal, with sector and location)  

### Relationships  
The database models **various types of connections** between people and companies, including membership, hierarchy, marriages, positions of authority, financial transactions, and surveillance.

### People Hierarchy  
Boss → Underboss → Caporegime → Soldier → Member

**Example queries demonstrate:**  

- Identifying members and their positions  
- Showing organizational hierarchy  
- Inspecting the boss’s relations  
- Tracking company ownership and suspicious transactions  
- Monitoring spies and their targets
