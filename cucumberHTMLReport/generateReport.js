/* This file contains the code to convert Cucumber JSON output into the HTML 
*/
const report = require ("multiple-cucumber-html-reporter");

report.generate({
  jsonDir: "cucumberHTMLReport",
  reportPath: "cucumberHTMLReport/HTMLReport",
  openReportInBrowser: true,
  pageTitle: "HTML Report",
  reportName: "Visual Comfort Test Automation Report",
  pageFooter: "<div><p><center>Visual Comfort Test Automation Report</center></p></div>",
  displayDuration: false,
  durationInMS: false,
  displayReportTime: false,
  metadata: {
    browser: {
      name: "chrome",
      version: "60",
    },
    device: "Local test machine",
    platform: {
      name: "windows",
      version: "22H2",
    },
  },
});