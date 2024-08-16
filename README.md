**How to auto run Cypress tests pipeline:**
<br>
<br>
We have enabled auto trigger on the pipeline with staging and production branch so whenever code commit into the branch that time the trigger will run
-  All the command run on workingDir tests/cypress/

1. If the code commit or pull request merged in Staging branch then following command execute:
- `npm install --legacy-peer-deps` //Install project dependencies
- `npm run stage` //to run on stage testing environment and US country for all cases
- `npm run chrome-headed`
- `npm run chrome-no-dashboard`
  
2. If the code commit or pull request merged in production branch then following command execute:
- `npm install --legacy-peer-deps` //Install project dependencies  
- `npm run production` //to run on production environment and US country for all cases
 
**How to manual run Cypress tests pipeline:**

You have to open following url for run the pipeline: 
URL: https://dev.azure.com/VisualComfortCo/Visual%20Comfort/_build?definitionId=50
<br>
<br>

1. Click on Run pipeline button

2. Select branch in the drop down, do not select staging and production branch here if you want to scan production or Staging branch code then use other created branch with same code of production or Staging branch instead of staging and production.

3. Once you select branch then select Target Environment into the drop down from stage to production

4. Select Target Region (default region is us)

5. If you go with selected default region which is us then following commands to execute automation scripts according the selection of the different testing environments on cypress dashboard  
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

6. If you select region uk then following commands to execute automation scripts according the selection of the different testing environments on cypress dashboard
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

7. If you select region eu then following commands to execute automation scripts according the selection of the different testing environments on cypress dashboard
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

8. If you go with selected default region which is us and selected checkbox of Sanity then following commands to execute automation scripts according the selection of the different testing environments on cypress dashboard
- `npm run production-sanity` //to run on production environment and US country for sanity cases
- `npm run stage-sanity` //to run on stage testing environment and US country for sanity cases
- `npm run stage2-sanity` //to run on stage2 testing environment and US country for sanity cases
- `npm run stage3-sanity` //to run on stage3 testing environment and US country for sanity cases
- `npm run stage4-sanity` //to run on stage4 testing environment and US country for sanity cases
- `npm run stage5-sanity` //to run on stage5 testing environment and US country for sanity cases
- `npm run stage6-sanity` //to run on stage6 testing environment and US country for sanity cases
- `npm run stage7-sanity` //to run on stage7 testing environment and US country for sanity cases
- `npm run stage8-sanity` //to run on stage8 testing environment and US country for sanity cases
- `npm run stage9-sanity` //to run on stage9 testing environment and US country for sanity cases

9. If you select region uk and selected checkbox of Sanity then following commands to execute automation scripts according the selection of the different testing environments on cypress dashboard
- `npm run production-uk-sanity` //to run on production environment and UK country for sanity cases
- `npm run stage-uk-sanity` //to run on stage testing environment and UK country for sanity cases
- `npm run stage2-uk-sanity` //to run on stage2 testing environment and UK country for sanity cases
- `npm run stage3-uk-sanity` //to run on stage3 testing environment and UK country for sanity cases
- `npm run stage4-uk-sanity` //to run on stage4 testing environment and UK country for sanity cases
- `npm run stage5-uk-sanity` //to run on stage5 testing environment and UK country for sanity cases
- `npm run stage6-uk-sanity` //to run on stage6 testing environment and UK country for sanity cases
- `npm run stage7-uk-sanity` //to run on stage7 testing environment and UK country for sanity cases
- `npm run stage8-uk-sanity` //to run on stage8 testing environment and UK country for sanity cases
- `npm run stage9-uk-sanity` //to run on stage9 testing environment and UK country for sanity cases

10. If you select region eu and selected checkbox of Sanity then following commands to execute automation scripts according the selection of the different testing environments on cypress dashboard
- `npm run production-eu-sanity` //to run on production environment and EU country for sanity cases
- `npm run stage-eu-sanity` //to run on stage testing environment and EU country for sanity cases
- `npm run stage2-eu-sanity` //to run on stage2 testing environment and EU country for sanity cases
- `npm run stage3-eu-sanity` //to run on stage3 testing environment and EU country for sanity cases
- `npm run stage4-eu-sanity` //to run on stage4 testing environment and EU country for sanity cases
- `npm run stage5-eu-sanity` //to run on stage5 testing environment and EU country for sanity cases
- `npm run stage6-eu-sanity` //to run on stage6 testing environment and EU country for sanity cases
- `npm run stage7-eu-sanity` //to run on stage7 testing environment and EU country for sanity cases
- `npm run stage8-eu-sanity` //to run on stage8 testing environment and EU country for sanity cases
- `npm run stage9-eu-sanity` //to run on stage9 testing environment and EU country for sanity cases

11. Click on Run button 
  
12. All the command run in workingDir tests/cypress/

13. Install project dependencies by running the following command:
- `npm install --legacy-peer-deps`

14. Finally, run the commands to execute automation scripts on the different testing environments on cypress dashboard

15. After the test execution, you can see test report by opening the following link:
https://cloud.cypress.io/projects/w6nbcy/runs
