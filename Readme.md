# Sim Fan DATA550 final report-4



------------------------------------------------------------------------

## Initial code description

`code/00_clean_data.R`

  - do data cleaning
  - saves cleaned data as a `.rds` object in `derived_data` folder

`code/01_make_scatter.R`

  - generates a scatter plot
  - saves a plot as a `.png` object in `figures` folder


`code/02_models.R`

  - do regression
  - saves a model data as a `.rds` object in `derived_data` folder
  - saves a table data as a `.rds` object in `tables` folder

`code/03_render_report.R`

  - renders `project.Rmd`

`report.Rmd`

  - reads all `.rds` data
  - makes 1 plot and 1 table
  
`makefile`
  - contains the make commands for run the assignment
------------------------------------------------------------------------

please type `make data_cleaning` in terminal to proceed data cleaning and create cleaned data

please type `make scatter` in terminal to create a scatterplot

please type `make model` to create model

please type `make render_report` to render report

please type `make clean` to clean all the report, .rds files, and plots.
