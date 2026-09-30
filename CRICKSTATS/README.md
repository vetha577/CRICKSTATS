# CRICKSTATS – Cricket Player Performance Tracking Application

Salesforce DX project (source format, API 60.0).

## Deploy (Sprint order)
```bash
sf org login web --alias crickstats --set-default          # Developer Edition org
sf project deploy start --source-dir force-app             # objects, fields, roll-ups, validation, tabs, flow, app, security
sf project deploy start --source-dir analytics             # report types, reports, dashboard
sf org assign permset --name CRICKSTATS_Manager            # (or _Coach / _Analyst)
sf apex run --file scripts/apex/sample-data.apex           # optional demo data
sf org open
```
Open the **CRICKSTATS** app from the App Launcher.

## What is inside
| Layer | Components |
|---|---|
| Presentation | Lightning App `CRICKSTATS` (Standard nav, Desktop + Phone), tabs: Home, Players, Match Performances, Reports, Dashboards |
| Application | Screen Flow `Player Flow` (Team picklist -> Get Records -> Data Table) shown on the Home tab (Lightning App Page `CRICKSTATS Home`), validation rules |
| Data | `Player__c`, `Match_Performance__c` (Master-Detail to Player, Lookup to User) with 10 roll-ups + AVG Score formula |
| Analytics | 9 reports (folder *CRICKSTATS Reports*) and dashboard *CRICKSTATS Dashboard* (9 components) |

Data flow: User -> Lightning UI -> Player -> Match Performance -> Reports -> Dashboards

## Roll-up logic
* Matches Played = COUNT(Match Performances)
* Number of 50's = COUNT where Runs Scored >= 50 and < 100
* Number of 100's = COUNT where Runs Scored >= 100
* Total 4's / 6's / Runs / Overs / Wickets / Stumpings / Catches = SUM
* AVG Score = IF(Matches_Played__c > 0, Total_Runs__c / Matches_Played__c, 0)

## Security
* Permission sets: `CRICKSTATS_Coach` (read), `CRICKSTATS_Manager` (create/edit/delete), `CRICKSTATS_Analyst` (read all + run/export reports)
* System Administrator: full access via the Admin profile changes
* Roles: CRICKSTATS Team Manager > Coach, Sports Analyst
* Player OWD = Public Read/Write (access controlled by object/field permissions); Match Performance = Controlled by Parent
* Configuration (Setup) stays admin-only. Authentication: Salesforce login (enable MFA in Setup > Identity).
* Analysts who must *create* reports need "Create and Customize Reports" added in Setup.

## Sprint plan (Agile)
1. Sprint 1 – Developer org, Player + Match Performance objects
2. Sprint 2 – Tabs, Lightning App, fields, relationships, page layouts
3. Sprint 3 – Validation rules, roll-ups, Player Flow
4. Sprint 4 – Reports, dashboards, testing, deployment

## Test checklist
Create Player; create Match Performance (check Player roll-ups + AVG Score update); edit/delete a performance (roll-ups recalc);
negative runs / missing result / wickets > 10 / overs 4.7 (validation errors); Player Flow team filter; reports run; dashboard loads;
log in as Coach/Manager/Analyst users and confirm access.

## Limitations
* Requires Salesforce licenses (Developer Edition is free for learning, paid editions for production)
* Internet dependency; limited offline access
* Total Overs is a simple SUM (4.3 + 4.3 = 8.6, not 9.0) – cricket-notation conversion would need a formula/Apex
* Rich-text Profile Picture shows as text inside the Flow data table (Flow data tables can't render HTML)

## Future enhancements
Mobile app, AI performance prediction (Einstein), video analysis, player ranking, public stats portal (Experience Cloud), multi-league support.
