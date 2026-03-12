CREATE (boss:Person:Member:Boss {
name: "Vito",
	surname: "Mancini",
	date_of_birth: date("1943-08-17"),
	sex: "M"
});

CREATE (boss_comp:Company {
name: "Mancini Holdings", 
date_of_creation: date("1990-10-10"),
	is_legal: false,
sector: "financial",
headquaters_location: "Panama, Panama"
});

MATCH (boss:Boss), (boss_comp: Company {name:"Mancini Holdings"})
CREATE (boss)-[:HOLDS_HIGH_POSITION {
since: date("1990-10-10"),
position: "CEO"
}]->(boss_comp);

CREATE (underboss:Person:Member:Underboss {
name: "Rocco",
surname: "Moretti",
	date_of_birth: date("1960-11-09"),
	sex: "M"
});

MATCH (underboss:Underboss), (boss:Boss)
CREATE (underboss)-[:IS_A_SUBORDINATE{
since: date("1990-10-10")}]->(boss);


CREATE (underboss_comp:Company {
name: "Moretti Imports",
date_of_creation: date("1993-05-10"),
	is_legal: false,
sector: "trade",
headquarters_location: "Charlestown, Saint Kitts and Nevis"});

MATCH (underboss:Underboss), (underboss_comp: Company {name:"Moretti Imports"})
CREATE (underboss)-[:HOLDS_HIGH_POSITION {
since: date("1993-05-10"),
position: "CEO"
}]->(underboss_comp);

MATCH (underboss:Underboss), (boss_comp: Company {name:"Mancini Holdings"})
CREATE (underboss)-[:HOLDS_HIGH_POSITION {
since: date("1993-05-10"),
position: "Management Board"
}]->(boss_comp);

CREATE (wife:Person {
name: "Sofia",
	surname: "Moretti",
	date_of_birth: date("1967-08-19"),
	sex:"F"
});

MATCH (wife:Person {name: "Sofia"}), (underboss: Underboss)
CREATE (wife)-[:IS_MARRIED_TO {
since: date("1990-02-10")
}]->(underboss);


CREATE (wife_comp:Company {
name: "White Money",
date_of_creation: date("2010-05-10"),
	is_legal: true,
sector: "financial",
headquarters_location: "Prague, Czech Republic"});

MATCH (wife:Person {name: "Sofia"}), (wife_comp:Company {name:"White Money"})
CREATE (wife)-[:HOLDS_HIGH_POSITION {
since: date("2010-05-10"),
position: "CEO"
}]->(wife_comp);

MATCH (boss_comp:Company {name: "Mancini Holdings"}), (wife_comp:Company {name:"White Money"})
CREATE (boss_comp)-[:BUYS_CURRENCY {
date: date("2010-06-11"),
currency:"USD",
amount: 200000,
rate: 3.3761
}]->(wife_comp);

MATCH (boss_comp:Company {name: "Mancini Holdings"}), (wife_comp:Company {name:"White Money"})
CREATE (boss_comp)-[:BUYS_CURRENCY {
date: date("2011-06-11"),
currency:"EUR",
amount: 100000,
rate: 4.2135
}]->(wife_comp);

MATCH (boss_comp:Company {name: "Mancini Holdings"}), (wife_comp:Company {name:"White Money"})
CREATE (boss_comp)-[:BUYS_CURRENCY {
date: date("2010-08-11"),
currency:"USD",
amount: 50000,
rate:3.3961
}]->(wife_comp);

CREATE (capo:Person:Member:Caporegime {
    name: "Marco",
    surname: "Bellini",
    sex: "M",
    date_of_birth: date("1978-04-12")
});

CREATE (capo:Person:Member:Caporegime {
    name: "Luca",
    surname: "Esposito",
    sex: "M",
    date_of_birth: date("1982-11-03")
});

CREATE (capo:Person:Member:Caporegime {
    name: "Dario",
    surname: "Moretti",
    sex: "M",
    date_of_birth: date("1975-08-29")
});

CREATE (capo:Person:Member:Caporegime {
    name: "Alessia",
    surname: "Romano",
    sex: "F",
    date_of_birth: date("1987-02-17")
});

MATCH (capo:Caporegime {name: "Marco"}), (underboss:Underboss)
CREATE (capo)-[:IS_A_SUBORDINATE{since: date("2000-04-05")}]->(underboss);

MATCH (capo:Person:Member:Caporegime {name: "Luca"}), (underboss:Underboss)
CREATE (capo)-[:IS_A_SUBORDINATE{since: date("2005-02-15")}]->(underboss);

MATCH (capo:Person:Member:Caporegime {name: "Dario"}), (underboss:Underboss)
CREATE (capo)-[:IS_A_SUBORDINATE{since: date("2004-09-25")}]->(underboss);

MATCH (capo:Person:Member:Caporegime {name: "Alessia"}), (underboss:Underboss)
CREATE (capo)-[:IS_A_SUBORDINATE{since: date("2007-04-30")}]->(underboss);

MATCH (capo:Person:Member:Caporegime {name: "Marco"})
CREATE (soldier:Person:Member:Soldier {
    name: "Giovanni",
    surname: "Conti",
    sex: "M",
    date_of_birth: date("1988-03-22")
}),
(soldier)-[:IS_A_SUBORDINATE{since: date("2005-01-10")}]->(capo);

MATCH (capo:Person:Member:Caporegime {name: "Marco"})
CREATE (soldier:Person:Member:Soldier {
    name: "Elena",
    surname: "Marchetti",
    sex: "F",
    date_of_birth: date("1994-07-11")
}),
(soldier)-[:IS_A_SUBORDINATE{since: date("2020-01-12")}]->(capo);

MATCH (capo:Person:Member:Caporegime {name: "Luca"})
CREATE (soldier:Person:Member:Soldier {
    name: "Paolo",
    surname: "DeLuca",
    sex: "M",
    date_of_birth: date("1983-09-15")
}),
(soldier)-[:IS_A_SUBORDINATE{since: date("2002-07-11")}]->(capo);

MATCH (capo:Person:Member:Caporegime {name: "Luca"})
CREATE (soldier:Person:Member:Soldier {
    name: "Francesca",
    surname: "Gatti",
    sex: "F",
    date_of_birth: date("1992-01-08")
}),
(soldier)-[:IS_A_SUBORDINATE{since: date("2010-08-12")}]->(capo);

MATCH (capo:Person:Member:Caporegime {name: "Dario"})
CREATE (soldier:Person:Member:Soldier {
    name: "Matteo",
    surname: "Serra",
    sex: "M",
    date_of_birth: date("1986-09-06")
}),
(soldier)-[:IS_A_SUBORDINATE{since: date("2005-05-12")}]->(capo);

MATCH (capo:Caporegime {name:"Dario"})
CREATE (soldier:Person:Member:Soldier {
    name: "Chiara",
    surname: "Palmieri",
    sex: "F",
    date_of_birth: date("1995-04-21")
}),
(soldier)-[:IS_A_SUBORDINATE{since: date("2015-06-10")}]->(capo);

MATCH (capo:Person:Member:Caporegime {name: "Alessia"})
CREATE (soldier:Person:Member:Soldier {
    name: "Silvia",
    surname: "Pagani",
    sex: "F",
    date_of_birth: date("1990-09-19")
}),
(soldier)-[:IS_A_SUBORDINATE{since: date("2010-02-20")}]->(capo);

MATCH (capo:Caporegime {name: "Alessia"})
CREATE (soldier:Person:Member:Soldier {
    name: "Federico",
    surname: "Sartori",
    sex: "M",
    date_of_birth: date("1988-06-14")
}),
(soldier)-[:IS_A_SUBORDINATE{since: date("2010-10-19")}]->(capo);

MATCH (bossCompany:Company {name: "Mancini Holdings"})
MATCH (person)
WHERE person:Person:Member:Caporegime OR person:Person:Member:Soldier
MERGE (person)-[:IS_A_MEMBER_OF]->(bossCompany);

MATCH (capo:Person:Member:Caporegime {name: "Marco"}), (wife_comp:Company {name: "White Money"}) CREATE (capo)-[:IS_A_MEMBER_OF]->(wife_comp);

CREATE (ministry:Company {
    name: "Ministry of justice",
    sector: "Law",
    country: "Italy"
});

CREATE (assoc:Person:Associate {
    name: "Daniel",
    surname: "Ricci",
    sex: "M",
    date_of_birth: date("1979-10-14")
});

MATCH (assoc:Person:Associate {name:"Daniel", surname:"Ricci"}), (ministry:Company {name: "Ministry of justice"})
CREATE (assoc)-[:HOLDS_HIGH_POSITION{
since: date("2010-01-11"),
position:"Secretary of State"
}]->(ministry);

MATCH (assoc:Associate), (boss:Boss)
CREATE (assoc)-[:OWNS{
	type_of_debt: "Money",
	amount: 300000
}]->(boss);

MATCH (assoc:Associate), (bossCompany:Company {name: "Mancini Holdings"})
CREATE (assoc)-[:HOLDS_HIGH_POSITION{
since: date("2020-12-01"),
position:"Management Board"
}]->(bossCompany);

