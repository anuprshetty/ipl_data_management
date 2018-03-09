# IPL Data Management

**IPL Data Management** is a relational database system which helps to store and retrieve **_Indian Premier League (Twenty20 cricket league that is annually held in India)_** data.  
**_Normalization techniques_** are applied on this relational database model to minimize the redundancy in the database tables.

## E-R Model

**Entity-Relationship model** for IPL database.
![Entity-Relationship model](./images/ipl_schema.png)

### Attribute symbols

![Attribute symbols](./images/attribute_symbols.png)

## Commands

- docker compose --file mysql_server/docker-compose.yaml up --build --detach
- docker compose --file mysql_server/docker-compose.yaml down
- docker compose --file mysql_server/docker-compose.yaml logs --timestamps --follow

## Tools and Technologies Used

- MySQL Server
- MySQL Workbench
- MySQL Command Line Client
- MySQL query language

## Database Setup

- Run MySQL Server docker container.
- Open MySQL Workbench.
- Import and execute **ipl.sql** and **normalized_ipl.sql** files in MySQL Workbench.
- Play with **ipl** database.

## Project Explanation

IPL database contains 8 tables.

<!--- Use 2 SPACEs at the end of a line for line break(\n). -->

1. player  
   ![player](./images/player_table.png)
2. team  
   ![team](./images/team_table.png)
3. owner  
   ![owner](./images/owner_table.png)
4. coach  
   ![coach](./images/coach_table.png)
5. c_match (Current match)  
   ![c_match](./images/c_match_table.png)
6. venue  
   ![venue](./images/venue_table.png)
7. individual_score (A player's score in a perticular match)  
   ![individual_score](./images/individual_score_table.png)
8. total_score (A player's total score in all the matches)  
   ![total_score](./images/total_score_table.png)

## Normalization

Normalization is the process of minimizing redundancy from a relation or set of relations in a database.

### First Normal Form (1NF)

_If the table is flat, i.e., no composite and multivalued attributes, then we say that the relation is in 1NF._

**player** table contains a multivalued attribute **role**. So **player** table is not in 1NF.

**_Conversion of player table to 1NF:_**  
![1NF Conversion](./images/1nf_conversion.png)


