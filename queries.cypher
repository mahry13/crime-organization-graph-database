// Which people are connected to a certain organized crime group and what are their positions?

MATCH (p:Member)-[:IS_A_MEMBER_OF|HOLDS_HIGH_POSITION]->(comp:Company {name:"Mancini Holdings"})
WITH p, comp, labels(p) AS labels
WITH p, comp, [l IN labels WHERE NOT l IN ["Person","Member"]] AS positionLabels
RETURN p.name AS name, p.surname AS surname, positionLabels[0] AS position, comp.name AS company;

// What is the hierarchy of the selected organized crime group?

MATCH p = SHORTEST 1 (member:Member)-[r:IS_A_SUBORDINATE]-+(boss:Boss)
RETURN member.name as name, member.surname as surname, length(p) AS hierarchy;

// What are the relations with other people of the boss?

MATCH (boss:Boss)-[r]-(entity)
RETURN boss.name as name, boss.surname as surname, r, entity.name;

// What are the owners of all tracked companies?

MATCH (person:Person)-[r:HOLDS_HIGH_POSITION]->(comp:Company)
WHERE r.position='CEO'
RETURN person.name as name, r.position as position, comp.name;

// What is the total amount of laundered money?

MATCH (comp1:Company {name:"Mancini Holdings"})-[transfer:BUYS_CURRENCY]->(comp2:Company {name:"White Money"})
RETURN transfer.currency as Currency, sum(transfer.amount) as Total_Amount, sum(transfer.amount * transfer.rate) as Sum_in_PLN;

// Who is the spy and whom does he spy on?

// Create a Spy that will be conducting surveillance over a Luca’s group
MATCH (capo:Caporegime {name: "Luca"})
CREATE (rat:Soldier:Spy:Person:Member {
    name: "Ratto",
    surname: "Ratatouille",
    sex: "M",
    date_of_birth: date("1985-09-14")
}),
(rat)-[:IS_A_SUBORDINATE{since: date("2020-10-19")}]->(capo);

// Add relation with all members of Luca’s group
MATCH (capo:Caporegime {name: "Luca"})<-[r:IS_A_SUBORDINATE]-(member)
MATCH (spy:Spy {name:"Ratto"})
WHERE NOT member:Spy
MERGE (spy)-[:SPIES_ON {since: date("2020-10-19")}]->(member);

// Add relation with Luca
MATCH (capo:Caporegime {name: "Luca"})
MATCH (spy:Spy {name:"Ratto"})
CREATE (spy)-[:SPIES_ON {since: date("2020-10-19")}]->(capo);

// Set all members attribute is_spied_on within a group to be true
MATCH (group:Caporegime {name: "Luca"})<-[rel:IS_A_SUBORDINATE]-(members)
WHERE NOT members:Spy
FOREACH (member IN members | SET member.is_spied_on = true);

// Set Luca to be spied on
MATCH (capo:Caporegime {name: "Luca"})
SET capo.is_spied_on = true;

// Display all spies and people they monitor
MATCH (spies:Spy)-[r:SPIES_ON]->(member)
RETURN spies.name, spies.surname, r.since, member.name, member.surname;
