data_cleaning: raw_data/2010-BRFSS-SMART-subset.csv code/00_clean_data.R 
	Rscript code/00_clean_data.R
	
scatter: derived_data/data_clean.rds code/01_make_scatter.R 
	Rscript code/01_make_scatter.R

model: derived_data/data_clean.rds code/02_models.R
	Rscript code/02_models.R

render_report: derived_data/data_clean.rds code/03_render_report.R figures/scatterplot.png project.Rmd tables/regression_table.rds derived_data/model.rds
	Rscript code/03_render_report.R
	
	
.PHONY: install
install:
	Rscript -e "renv::restore(prompt = FALSE)"

.PHONY: clean
clean:
	rm -f tables/*.rds && rm -f project.html && rm -f reports/*.rds && rm -f figures/*.png && rm -f derived_data/*.rds