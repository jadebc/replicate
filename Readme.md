This repository includes R scripts for a Shiny app that compares analysis objects created by two analysts for the purpose of internal replication. The three scripts in this repository can be used to launch the Shiny R app within RStudio, which can also be published as a website. 

**How to run the Shiny app**: Open either ui.R or server.R in RStudio. Click the green arrow button that says "Run App" in the upper right hand corner of the code console. 

**Description of scripts**
* **simulate.R**: This script creates an example dataset that could be analyzed by two hypothetical analysts (A and B). It saves two sets of objects and intentionally includes an "error" in Analyst B's data cleaning process so that the analyses are not fully replicated. 
* **global.R**: This script is read into the Shiny app every time it is run, so all preamble code can be included here. In this example, it the script reads in the objects created by both analysts, creates variables that describe features of the objects (e.g., variables denoting outcome and whether the analysis was adjusted or not), takes the difference of the objects, and saves a data frame with a row for each object and columns for each object's features in a format ready to read into the Shiny app. 
* **server.R**: This script defines the data read into the Shiny app and maps it to the display. Rows 10-21 need to be modified if additional filtering variables are added. Replicator names can be added in rows 40, 50, and 60-61. The number of digits to display can also be modified here. 
* **ui.R**: This script defines the user interface for the Shiny app. Rows 5-28 need to be modified if additional filtering variables are added. Replicator names can be added in rows 56 and 58.

**Required object features**
* Objects replicated must have the same root name (e.g., "prop.y") with a suffix for each analyst (e.g., "prop.y_A" for Analyst A and "prop.y_B" for Analyst B)
* Objects must be the same dimensions and class. 
* Objects must not include character strings. 
* Objects must be available for both analysts. 
