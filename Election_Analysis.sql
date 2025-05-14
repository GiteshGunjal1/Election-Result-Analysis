create database India_Election_Result;
use India_Election_Result;

Desc constituencywise_details;
Desc constituencywise_results;
Desc partywise_results;
Desc states;
Desc statewise_results;

select * from constituencywise_details;
select * from constituencywise_results;
select * from partywise_results;
select * from states;
select * from statewise_results;


-- Subquery Questions and Solutions

-- 1.Find the winning candidate with the highest percentage of votes in any constituency.
SELECT Candidate, Party, Total_Votes, Percentage_of_Votes
FROM constituencywise_details
WHERE Percentage_of_Votes= (
SELECT MAX(Percentage_of_Votes) 
FROM constituencywise_details
);

-- 2. Find the names of states where the leading candidate had a margin of more than 3000 votes. Retrieve the state name using a subquery.
SELECT * FROM states
WHERE State_ID IN (
SELECT State_ID 
FROM statewise_results 
WHERE Margin > 3000
)limit 5;


-- 3.Find the party,total votes and percentage of votes received by Sachin Gupta in the constituency with the highest total votes among all constituencies.
SELECT candidate,Total_Votes,Percentage_of_Votes
FROM constituencywise_details
WHERE Candidate = 'Sachin Gupta'
AND Total_Votes = (
SELECT MAX(Total_Votes)
FROM constituencywise_details
WHERE Candidate = 'Sachin Gupta'
);

-- 4.Get the candidate with the lowest margin among winning candidates across all states.
SELECT Winning_Candidate, Constituency_Name, Margin
FROM constituencywise_results
WHERE Margin = (SELECT MIN(Margin)
FROM constituencywise_results
WHERE Winning_Candidate IS NOT NULL
);


-- Join Questions and Solutions

-- 5.Find the state and constituency names where the total votes are greater than 10,00,000.
SELECT s.State, cr.Constituency_Name,cr.Total_Votes
FROM constituencywise_results cr
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE cr.Total_Votes > 1000000;


-- 6.List the winning candidates, along with their constituency name and state, for the first five results where a winning candidate is available.
SELECT cr.Winning_Candidate, s.State, cr.Constituency_Name
FROM constituencywise_results cr
JOIN statewise_results sr ON cr.Parliament_Constituency = sr.Parliament_Constituency
JOIN states s ON sr.State_ID = s.State_ID
WHERE cr.Winning_Candidate IS NOT NULL
LIMIT 5;


-- 7.List the names of all parties along with the number of seats won by each party, where the party has won at least one seat.
SELECT pr.Party, pr.Won
FROM partywise_results pr
JOIN constituencywise_results cr ON pr.Party_ID = cr.Party_ID
WHERE pr.Won > 0 limit 5;


-- 8.write a query to find the total number of seats won by each party. 
SELECT cd.Party, COUNT(cr.Constituency_ID) AS Seats_Won
FROM constituencywise_details cd
JOIN constituencywise_results cr ON cd.Constituency_ID = cr.Constituency_ID
WHERE cr.Winning_Candidate IS NOT NULL
GROUP BY cd.Party
ORDER BY Seats_Won DESC limit 5;

-- View Question and Solutions

-- 9.Create a view that shows the names of states where the leading candidate had a margin of more than 3000 votes.
CREATE VIEW PartyVotesByState AS
SELECT * FROM states
WHERE State_ID IN (
SELECT State_ID 
FROM statewise_results 
WHERE Margin > 3000
)limit 5;

SELECT * FROM PartyVotesByState;

-- 10.Create a view that lists each constituency with its leading and trailing candidates and the margin.
CREATE VIEW ConstituencyMargins AS
SELECT sr.Constituency, sr.Leading_Candidate, sr.Trailing_Candidate, sr.Margin
FROM statewise_results sr;

SELECT * FROM ConstituencyMargins LIMIT 5;

