# Predicting Molecular Initiating Events with Machine Learning (MIEML)

## Overview

This repo contains code to reproduce the molecular initiating even prediction analysis described in [Bundy et al. 2025](url.to.final.publication)

## Setup

### System Requirements

This analysis project is written entirely in the [R statistical framework](https://www.r-project.org/). 

All code developed for this current was written and deployed in the Linux environment. The parallelization approach implemented within this package is not currently compatible with Windows OS.  

### R Packages

All code in this package has been tested on R version 4.4.1
Package versions may have an impact due to changes in functionality.  
The following R libraries are also required to use mieml_httrpl functions:

+ [caret](https://cran.r-project.org/web/packages/caret/index.html) - Required for training binary classifiers. Code has been tested with v6.0-94
+ [data.table](https://cran.r-project.org/web/packages/data.table/index.html) - Required for internal data handling. Code has been tested with v1.16.2
+ [dplyr](https://cran.r-project.org/web/packages/dplyr/index.html) - Required for internal data handling. Code has been tested with v1.1.4.
+ [rlist](https://cran.r-project.org/web/packages/rlist/index.html) - Required for internal data handling. Code has been tested with v0.4.6.2.
+ [parallel](https://cran.r-project.org/web/packages/parallel/index.html) - Required for parallelizing model training. Code has been tested with v4.4.1.
+ [doParallel](https://cran.r-project.org/web/packages/doParallel/index.html) - Required for parallelizing model training. Code has been tested with v1.0.17.
+ [foreach](https://cran.r-project.org/web/packages/foreach/index.html) - Required for parallelizing model training. Code has been tested with v1.5.2.
+ [readxl](https://cran.r-project.org/web/packages/readxl/index.html) - Required for importing original refchemdb file. Code has been tested with v1.4.3


### Required Datasets

Classifier training relies on several publicly available data sets:

+ [RefChemDB Supplemental Information](https://pmc.ncbi.nlm.nih.gov/articles/instance/6784312/bin/NIHMS1537541-supplement-Supplement1.xlsx)
  + This .xlsx file is supplemental table 12 from [Judson et al. 2019](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC6784312/).
  + Chemical-target annotations in RefChemDB are used to link molecular targets to chemical treatments in HTTr screens
  + This file is already part of the current repo under `./data`. It does not need to be downloaded.

+ [MCF-7 High Throughput Transcriptomics Data](https://doi.org/10.23645/epacomptox.28669163.v1)
  + This Figshare repo contains many files - some are core files required to run MIEML, others are intermediate files generated by data pre-processing and classifier interpretation notebooks.
  + To run the analysis described in [Bundy et al. 2025](url.to.final.publication) from start to finish, only the files located in `mongo_dump`, `gene_cr_data`, and  `invitrodb` are required. For ease of use, it is recommended that these folders are downloaded from Figshare and placed under `./data` so that the relative paths in analysis notebooks need not be altered. Note, other intermediate files that are generated by analysis notebooks are also written to `./data`
  + For comprehensive description of these source files, please consult the manuscript text referenced above.

### Installing the MIEML package

Currently, it is recommended to clone the entire repo to a user or analysis directory by running:
```bash
git clone https://github.com/USEPA/CompTox-MIEML_HTTr.git (/path/to/analysis)
```

## Running MIEML

+ Before running any code, users should download files associated with the MCF-7 screen from [figshare](link.to.figshare.url) as described in the previous section. If these files are deposited in the `./data` folder of this repo, scripts and notebooks that use local paths should function as-is. 

+ This repo contains both R notebooks and R scripts.  Note, MIEML notebooks intermittently read and write files using the `./data` local path. Files written by some notebooks are required as inputs to others, so it is advisable to execute notebooks in order. 
  + [R Notebooks](./notebooks)
    + [Notebooks 1&2](./notebooks): These notebooks preprocess data for MIEML and should be executed after downloading the required folders from [figshare]().  The execution of these preprocessing notebooks is required before running the MIEML vignette.
    + [MIEML Vignette](./notebooks/0_mieml_vignette.nb.html): Contains examples and explanations of MIEML functions and their use
    + [Notebooks 3:7](./notebooks): These notebooks reproduce the model evaluation and interpretation steps described in [Bundy et al. 2025](url.to.final.publication).  These notebooks can only be run after downloading the `./model_files` folder from figshare or successfully running MIEML to independently generate model files.
  + [R Scripts](./scripts)
    + [MIEML functions](./scripts/ML_functions_HTTr.R) are sourced in analysis notebooks and scripts. 
    + The [Analysis script](./scripts/MIEML_analysis_script_3_8_2025.R) that was used to perform the analysis described in [Bundy et al. 2025](url.to.final.publication) is provided to facilitate replication of that analysis.
    
## Version History

**(12/20/21)**

+ Created new (current) branch for public release of MIEML version used to generate code in initial project-associated publication.

**(2/17/22)**

+ Revised vignette and primary MIEML functions for ease of use

**(3/2/22)**

+ Revised README and vignette for public repo

**(5/17/22)** 

+ Updated README

**(2/19/25)** 

+ Updated vignette

**(3/17/25**)

+ Refactored MIEML functions
+ Added analysis notebooks
+ Expanded README

## Contributors

+ **[Logan J. Everett](mailto:everett.logan@epa.gov)**
+ **[Joseph L. Bundy](mailto:josephlbundy@gmail.com)**
