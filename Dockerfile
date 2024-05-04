FROM rocker/r-ver:4.3.2 as base
RUN mkdir /project

WORKDIR /project

RUN apt-get update
RUN apt-get install -y libcurl4-openssl-dev
RUN apt-get install -y libxml2-dev
RUN apt-get install -y zlib1g-dev
RUN apt-get install -y cmake
RUN apt-get install -y libssl-dev
RUN apt-get install -y libpng-dev
RUN apt-get install -y libfontconfig1-dev
RUN apt-get install -y libharfbuzz-dev libfribidi-dev
RUN apt-get install -y libfreetype6-dev libpng-dev libtiff5-dev libjpeg-dev

RUN mkdir -p renv
COPY renv.lock renv.lock
COPY .Rprofile .Rprofile
COPY renv/activate.R renv/activate.R
COPY renv/settings.json renv/settings.json

RUN mkdir renv/.cache
ENV RENV_PATHS_CACHE renv/.cache

RUN R -e "renv::restore(prompt = FALSE, repos = c(CRAN = 'https://cloud.r-project.org'))"

###### DO NOT EDIT STAGE 1 BUILD LINES ABOVE ######
FROM rocker/r-ubuntu

WORKDIR /project
COPY --from=base /project .

COPY code code
COPY derived_data derived_data
COPY figures figures
COPY raw_data raw_data
COPY reports reports
COPY tables tables
COPY makefile .
COPY project.Rmd .
