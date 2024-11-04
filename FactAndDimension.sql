--------------- Fact And Dimensions --------------------

/* 
In a data warehouse or star schema, data is often organized into two main types of tables: fact tables 
and dimension tables. These tables are used to structure data for efficient analytical queries and to 
support business intelligence.

1. Fact Table
A fact table contains quantitative data that you want to analyze. It generally stores metrics or measurements
and has relationships with dimension tables. Fact tables typically contain numerical values, often called
"measures" (e.g., sales revenue, number of units sold), and foreign keys to connect with related dimension tables.

Characteristics of a Fact Table:
Measures: Contains numeric metrics that can be aggregated, such as sales amount, quantity, or profit.
Foreign Keys: Links to primary keys in dimension tables, creating relationships.
Granularity: Defines the level of detail for each record (e.g., one row per sale, one row per daily summary).

2. Dimension Table
A dimension table contains descriptive attributes related to the fact table's measures, providing context for
the data. Dimension tables typically hold information about who, what, when, where, and how aspects related to
the facts, such as customer details, product information, or date specifics.

Characteristics of a Dimension Table:
Attributes: Contains descriptive data, like product name, customer name, or date.
Primary Key: Uniquely identifies each record and links to the foreign keys in fact tables.
Hierarchies: Often structured to support hierarchies, such as Year > Quarter > Month > Day.
*/

