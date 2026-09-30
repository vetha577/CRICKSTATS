// Run: sf apex run --file scripts/apex/sample-data.apex
List<Player__c> players = new List<Player__c>{
  new Player__c(Name='Virat Kohli',  Player_Number__c='18', Date_of_Birth__c=Date.newInstance(1988,11,5),  Role__c='Batsman', Batting_Style__c='Right-Handed', Bowling_Style__c='Right-Arm Medium', Nationality__c='India', Team__c='India'),
  new Player__c(Name='Jasprit Bumrah', Player_Number__c='93', Date_of_Birth__c=Date.newInstance(1993,12,6), Role__c='Bowler', Batting_Style__c='Right-Handed', Bowling_Style__c='Right-Arm Fast', Nationality__c='India', Team__c='India'),
  new Player__c(Name='Ravindra Jadeja', Player_Number__c='8', Date_of_Birth__c=Date.newInstance(1988,12,6), Role__c='All Rounder', Batting_Style__c='Left-Handed', Bowling_Style__c='Left-Arm Spin', Nationality__c='India', Team__c='India'),
  new Player__c(Name='Steve Smith', Player_Number__c='49', Date_of_Birth__c=Date.newInstance(1989,6,2), Role__c='Batsman', Batting_Style__c='Right-Handed', Bowling_Style__c='Right-Arm Spin', Nationality__c='Australia', Team__c='Australia'),
  new Player__c(Name='Pat Cummins', Player_Number__c='30', Date_of_Birth__c=Date.newInstance(1993,5,8), Role__c='Bowler', Batting_Style__c='Right-Handed', Bowling_Style__c='Right-Arm Fast', Nationality__c='Australia', Team__c='Australia'),
  new Player__c(Name='Jos Buttler', Player_Number__c='63', Date_of_Birth__c=Date.newInstance(1990,9,8), Role__c='Batsman & Wicket Keeper', Batting_Style__c='Right-Handed', Bowling_Style__c='Right-Arm Medium', Nationality__c='England', Team__c='England')
};
insert players;
Map<String, Id> ids = new Map<String, Id>();
for (Player__c p : players) ids.put(p.Name, p.Id);
List<Match_Performance__c> mps = new List<Match_Performance__c>{
  new Match_Performance__c(Name='IND vs AUS - Match 1', Player__c=ids.get('Virat Kohli'), Match_Result__c='WON', Player_of_the_Match__c=true, Runs_Scored__c=112, Balls_Faced__c=98, Fours__c=10, Sixes__c=3),
  new Match_Performance__c(Name='IND vs ENG - Match 2', Player__c=ids.get('Virat Kohli'), Match_Result__c='WON', Runs_Scored__c=64, Balls_Faced__c=70, Fours__c=6, Sixes__c=1, Catches__c=1),
  new Match_Performance__c(Name='IND vs AUS - Match 1', Player__c=ids.get('Jasprit Bumrah'), Match_Result__c='WON', Overs_Bowled__c=10, Wickets_Taken__c=4, Runs_Conceded__c=38, Maiden_Overs__c=2),
  new Match_Performance__c(Name='IND vs ENG - Match 2', Player__c=ids.get('Jasprit Bumrah'), Match_Result__c='WON', Overs_Bowled__c=9.3, Wickets_Taken__c=3, Runs_Conceded__c=41, Maiden_Overs__c=1),
  new Match_Performance__c(Name='IND vs AUS - Match 1', Player__c=ids.get('Ravindra Jadeja'), Match_Result__c='WON', Runs_Scored__c=45, Balls_Faced__c=40, Fours__c=4, Sixes__c=2, Overs_Bowled__c=8, Wickets_Taken__c=2, Runs_Conceded__c=36, Catches__c=2),
  new Match_Performance__c(Name='AUS vs IND - Match 1', Player__c=ids.get('Steve Smith'), Match_Result__c='LOST', Runs_Scored__c=55, Balls_Faced__c=60, Fours__c=5, Sixes__c=1),
  new Match_Performance__c(Name='AUS vs ENG - Match 3', Player__c=ids.get('Steve Smith'), Match_Result__c='DRAW', Runs_Scored__c=101, Balls_Faced__c=130, Fours__c=9, Sixes__c=1),
  new Match_Performance__c(Name='AUS vs IND - Match 1', Player__c=ids.get('Pat Cummins'), Match_Result__c='LOST', Overs_Bowled__c=10, Wickets_Taken__c=2, Runs_Conceded__c=52, Maiden_Overs__c=0),
  new Match_Performance__c(Name='ENG vs IND - Match 2', Player__c=ids.get('Jos Buttler'), Match_Result__c='LOST', Runs_Scored__c=38, Balls_Faced__c=29, Fours__c=3, Sixes__c=2, Stumpings__c=1, Catches__c=2)
};
insert mps;
System.debug('Sample data loaded');
