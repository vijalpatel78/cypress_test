**Prerequisite:**
You should have Nodejs installed on your system. 
https://nodejs.org/en
<br>
<br>

1. Clone or download the project from the repository

2. Open your terminal (or command prompt) and navigate to the project directory using the cd command.
- `cd tests`

3. Install project dependencies by running the following command:
- `npm install --legacy-peer-deps`

4. Finally, run any one of the following commands to execute automation scripts on the different testing environments on cypress dashboard
- `npm run production` //to run on production environment and US country for all cases
- `npm run stage` //to run on stage testing environment and US country for all cases
- `npm run stage2` //to run on stage2 testing environment and US country for all cases
- `npm run stage3` //to run on stage3 testing environment and US country for all cases
- `npm run stage4` //to run on stage4 testing environment and US country for all cases
- `npm run stage5` //to run on stage5 testing environment and US country for all cases
- `npm run stage6` //to run on stage6 testing environment and US country for all cases
- `npm run stage7` //to run on stage7 testing environment and US country for all cases
- `npm run stage8` //to run on stage8 testing environment and US country for all cases
- `npm run stage9` //to run on stage9 testing environment and US country for all cases

- `npm run production-uk` //to run on production environment and UK country for all cases
- `npm run stage-uk` //to run on stage testing environment and UK country for all cases
- `npm run stage2-uk` //to run on stage2 testing environment and UK country for all cases
- `npm run stage3-uk` //to run on stage3 testing environment and UK country for all cases
- `npm run stage4-uk` //to run on stage4 testing environment and UK country for all cases
- `npm run stage5-uk` //to run on stage5 testing environment and UK country for all cases
- `npm run stage6-uk` //to run on stage6 testing environment and UK country for all cases
- `npm run stage7-uk` //to run on stage7 testing environment and UK country for all cases
- `npm run stage8-uk` //to run on stage8 testing environment and UK country for all cases
- `npm run stage9-uk` //to run on stage9 testing environment and UK country for all cases

- `npm run production-eu` //to run on production environment and EU country for all cases
- `npm run stage-eu` //to run on stage testing environment and EU country for all cases
- `npm run stage2-eu` //to run on stage2 testing environment and EU country for all cases
- `npm run stage3-eu` //to run on stage3 testing environment and EU country for all cases
- `npm run stage4-eu` //to run on stage4 testing environment and EU country for all cases
- `npm run stage5-eu` //to run on stage5 testing environment and EU country for all cases
- `npm run stage6-eu` //to run on stage6 testing environment and EU country for all cases
- `npm run stage7-eu` //to run on stage7 testing environment and EU country for all cases
- `npm run stage8-eu` //to run on stage8 testing environment and EU country for all cases
- `npm run stage9-eu` //to run on stage9 testing environment and EU country for all cases

- `npm run production-smoke` //to run on production environment and US country for smoke cases
- `npm run stage-smoke` //to run on stage testing environment and US country for smoke cases
- `npm run stage2-smoke` //to run on stage2 testing environment and US country for smoke cases
- `npm run stage3-smoke` //to run on stage3 testing environment and US country for smoke cases
- `npm run stage4-smoke` //to run on stage4 testing environment and US country for smoke cases
- `npm run stage5-smoke` //to run on stage5 testing environment and US country for smoke cases
- `npm run stage6-smoke` //to run on stage6 testing environment and US country for smoke cases
- `npm run stage7-smoke` //to run on stage7 testing environment and US country for smoke cases
- `npm run stage8-smoke` //to run on stage8 testing environment and US country for smoke cases
- `npm run stage9-smoke` //to run on stage9 testing environment and US country for smoke cases

- `npm run production-uk-smoke` //to run on production environment and UK country for smoke cases
- `npm run stage-uk-smoke` //to run on stage testing environment and UK country for smoke cases
- `npm run stage2-uk-smoke` //to run on stage2 testing environment and UK country for smoke cases
- `npm run stage3-uk-smoke` //to run on stage3 testing environment and UK country for smoke cases
- `npm run stage4-uk-smoke` //to run on stage4 testing environment and UK country for smoke cases
- `npm run stage5-uk-smoke` //to run on stage5 testing environment and UK country for smoke cases
- `npm run stage6-uk-smoke` //to run on stage6 testing environment and UK country for smoke cases
- `npm run stage7-uk-smoke` //to run on stage7 testing environment and UK country for smoke cases
- `npm run stage8-uk-smoke` //to run on stage8 testing environment and UK country for smoke cases
- `npm run stage9-uk-smoke` //to run on stage9 testing environment and UK country for smoke cases

- `npm run production-eu-smoke` //to run on production environment and EU country for smoke cases
- `npm run stage-eu-smoke` //to run on stage testing environment and EU country for smoke cases
- `npm run stage2-eu-smoke` //to run on stage2 testing environment and EU country for smoke cases
- `npm run stage3-eu-smoke` //to run on stage3 testing environment and EU country for smoke cases
- `npm run stage4-eu-smoke` //to run on stage4 testing environment and EU country for smoke cases
- `npm run stage5-eu-smoke` //to run on stage5 testing environment and EU country for smoke cases
- `npm run stage6-eu-smoke` //to run on stage6 testing environment and EU country for smoke cases
- `npm run stage7-eu-smoke` //to run on stage7 testing environment and EU country for smoke cases
- `npm run stage8-eu-smoke` //to run on stage8 testing environment and EU country for smoke cases
- `npm run stage9-eu-smoke` //to run on stage9 testing environment and EU country for smoke cases

5. After the test execution, you can see test report by opening the following link:
https://cloud.cypress.io/projects/w6nbcy/runs

6. You can use any one of the following commands to run the scripts in local for various testing environments
- `npx cypress open --env testingEnvironment="production",country="US",tags="@us and @all"` //to run on production environment and US country for all cases
- `npx cypress open --env testingEnvironment="staging",country="US",tags="@us and @all"` //to run on stage testing environment and US country for all cases
- `npx cypress open --env testingEnvironment="staging2",country="US",tags="@us and @all"` //to run on stage2 testing environment and US country for all cases
- `npx cypress open --env testingEnvironment="staging3",country="US",tags="@us and @all"` //to run on stage3 testing environment and US country for all cases
- `npx cypress open --env testingEnvironment="staging4",country="US",tags="@us and @all"` //to run on stage4 testing environment and US country for all cases
- `npx cypress open --env testingEnvironment="staging5",country="US",tags="@us and @all"` //to run on stage5 testing environment and US country for all cases
- `npx cypress open --env testingEnvironment="staging6",country="US",tags="@us and @all"` //to run on stage6 testing environment and US country for all cases
- `npx cypress open --env testingEnvironment="staging7",country="US",tags="@us and @all"` //to run on stage7 testing environment and US country for all cases
- `npx cypress open --env testingEnvironment="staging8",country="US",tags="@us and @all"` //to run on stage8 testing environment and US country for all cases
- `npx cypress open --env testingEnvironment="staging9",country="US",tags="@us and @all"` //to run on stage9 testing environment and US country for all cases

- `npx cypress open --env testingEnvironment="production",country="UK",tags="@uk and @all"` //to run on production environment and UK country for all cases
- `npx cypress open --env testingEnvironment="staging",country="UK",tags="@uk and @all"` //to run on stage testing environment and UK country for all cases
- `npx cypress open --env testingEnvironment="staging2",country="UK",tags="@uk and @all"` //to run on stage2 testing environment and UK country for all cases
- `npx cypress open --env testingEnvironment="staging3",country="UK",tags="@uk and @all"` //to run on stage3 testing environment and UK country for all cases
- `npx cypress open --env testingEnvironment="staging4",country="UK",tags="@uk and @all"` //to run on stage4 testing environment and UK country for all cases
- `npx cypress open --env testingEnvironment="staging5",country="UK",tags="@uk and @all"` //to run on stage5 testing environment and UK country for all cases
- `npx cypress open --env testingEnvironment="staging6",country="UK",tags="@uk and @all"` //to run on stage6 testing environment and UK country for all cases
- `npx cypress open --env testingEnvironment="staging7",country="UK",tags="@uk and @all"` //to run on stage7 testing environment and UK country for all cases
- `npx cypress open --env testingEnvironment="staging8",country="UK",tags="@uk and @all"` //to run on stage8 testing environment and UK country for all cases
- `npx cypress open --env testingEnvironment="staging9",country="UK",tags="@uk and @all"` //to run on stage9 testing environment and UK country for all cases

- `npx cypress open --env testingEnvironment="production",country="EU",tags="@eu and @all"` //to run on production environment and EU country for all cases
- `npx cypress open --env testingEnvironment="staging",country="EU",tags="@eu and @all"` //to run on stage testing environment and EU country for all cases
- `npx cypress open --env testingEnvironment="staging2",country="EU",tags="@eu and @all"` //to run on stage2 testing environment and EU country for all cases
- `npx cypress open --env testingEnvironment="staging3",country="EU",tags="@eu and @all"` //to run on stage3 testing environment and EU country for all cases
- `npx cypress open --env testingEnvironment="staging4",country="EU",tags="@eu and @all"` //to run on stage4 testing environment and EU country for all cases
- `npx cypress open --env testingEnvironment="staging5",country="EU",tags="@eu and @all"` //to run on stage5 testing environment and EU country for all cases
- `npx cypress open --env testingEnvironment="staging6",country="EU",tags="@eu and @all"` //to run on stage6 testing environment and EU country for all cases
- `npx cypress open --env testingEnvironment="staging7",country="EU",tags="@eu and @all"` //to run on stage7 testing environment and EU country for all cases
- `npx cypress open --env testingEnvironment="staging8",country="EU",tags="@eu and @all"` //to run on stage8 testing environment and EU country for all cases
- `npx cypress open --env testingEnvironment="staging9",country="EU",tags="@eu and @all"` //to run on stage9 testing environment and EU country for all cases

- `npx cypress open --env testingEnvironment="production",country="US",tags="@us and @smoke"` //to run on production environment and US country for smoke cases
- `npx cypress open --env testingEnvironment="staging",country="US",tags="@us and @smoke"` //to run on stage testing environment and US country for smoke cases
- `npx cypress open --env testingEnvironment="staging2",country="US",tags="@us and @smoke"` //to run on stage2 testing environment and US country for smoke cases
- `npx cypress open --env testingEnvironment="staging3",country="US",tags="@us and @smoke"` //to run on stage3 testing environment and US country for smoke cases
- `npx cypress open --env testingEnvironment="staging4",country="US",tags="@us and @smoke"` //to run on stage4 testing environment and US country for smoke cases
- `npx cypress open --env testingEnvironment="staging5",country="US",tags="@us and @smoke"` //to run on stage5 testing environment and US country for smoke cases
- `npx cypress open --env testingEnvironment="staging6",country="US",tags="@us and @smoke"` //to run on stage6 testing environment and US country for smoke cases
- `npx cypress open --env testingEnvironment="staging7",country="US",tags="@us and @smoke"` //to run on stage7 testing environment and US country for smoke cases
- `npx cypress open --env testingEnvironment="staging8",country="US",tags="@us and @smoke"` //to run on stage8 testing environment and US country for smoke cases
- `npx cypress open --env testingEnvironment="staging9",country="US",tags="@us and @smoke"` //to run on stage9 testing environment and US country for smoke cases

- `npx cypress open --env testingEnvironment="production",country="UK",tags="@uk and @smoke"` //to run on production environment and UK country for smoke cases
- `npx cypress open --env testingEnvironment="staging",country="UK",tags="@uk and @smoke"` //to run on stage testing environment and UK country for smoke cases
- `npx cypress open --env testingEnvironment="staging2",country="UK",tags="@uk and @smoke"` //to run on stage2 testing environment and UK country for smoke cases
- `npx cypress open --env testingEnvironment="staging3",country="UK",tags="@uk and @smoke"` //to run on stage3 testing environment and UK country for smoke cases
- `npx cypress open --env testingEnvironment="staging4",country="UK",tags="@uk and @smoke"` //to run on stage4 testing environment and UK country for smoke cases
- `npx cypress open --env testingEnvironment="staging5",country="UK",tags="@uk and @smoke"` //to run on stage5 testing environment and UK country for smoke cases
- `npx cypress open --env testingEnvironment="staging6",country="UK",tags="@uk and @smoke"` //to run on stage6 testing environment and UK country for smoke cases
- `npx cypress open --env testingEnvironment="staging7",country="UK",tags="@uk and @smoke"` //to run on stage7 testing environment and UK country for smoke cases
- `npx cypress open --env testingEnvironment="staging8",country="UK",tags="@uk and @smoke"` //to run on stage8 testing environment and UK country for smoke cases
- `npx cypress open --env testingEnvironment="staging9",country="UK",tags="@uk and @smoke"` //to run on stage9 testing environment and UK country for smoke cases

- `npx cypress open --env testingEnvironment="production",country="EU",tags="@eu and @smoke"` //to run on production environment and EU country for smoke cases
- `npx cypress open --env testingEnvironment="staging",country="EU",tags="@eu and @smoke"` //to run on stage testing environment and EU country for smoke cases
- `npx cypress open --env testingEnvironment="staging2",country="EU",tags="@eu and @smoke"` //to run on stage2 testing environment and EU country for smoke cases
- `npx cypress open --env testingEnvironment="staging3",country="EU",tags="@eu and @smoke"` //to run on stage3 testing environment and EU country for smoke cases
- `npx cypress open --env testingEnvironment="staging4",country="EU",tags="@eu and @smoke"` //to run on stage4 testing environment and EU country for smoke cases
- `npx cypress open --env testingEnvironment="staging5",country="EU",tags="@eu and @smoke"` //to run on stage5 testing environment and EU country for smoke cases
- `npx cypress open --env testingEnvironment="staging6",country="EU",tags="@eu and @smoke"` //to run on stage6 testing environment and EU country for smoke cases
- `npx cypress open --env testingEnvironment="staging7",country="EU",tags="@eu and @smoke"` //to run on stage7 testing environment and EU country for smoke cases
- `npx cypress open --env testingEnvironment="staging8",country="EU",tags="@eu and @smoke"` //to run on stage8 testing environment and EU country for smoke cases
- `npx cypress open --env testingEnvironment="staging9",country="EU",tags="@eu and @smoke"` //to run on stage9 testing environment and EU country for smoke cases
