#load mieml_httrpl functions
source("./ML_functions_HTTr.R")

ml_job(refchemdb_path = "../data/refchemdb/NIHMS1537541-supplement-Supplement1.xlsx",
       expanded_grid_path = "../data/expanded_grid/expanded_grid.rds",
       metadata_path = c("../data/mongo_dump/httr_metadata.rds"),
       support_level = 3,
       allowParallel_training = TRUE,
       target_workers = 1,
       null_workers = 13,
       n_nulls = 200,
       min_chemicals = 5, 
       min_profiles = 25,
       profile_limit =  20, 
       model_names = c("svmLinear", "svmRadial", "svmPoly", "knn", "rf", "mlpML"), 
       seed = 123,
       cutree_h = 0.7,
       cluster_method = "complete",
       save_model = TRUE,
       output_dir = "../data/model_files/analysis_3_8_2025",
       gene_expression_data_path = "../data/gene_expression/normalized_gene_expression_data.rds",
       tpod_estimate_path = "../data/tpod_estimates/tpod_estimates.rds",
       critical_perm_metrics = c("internal_accuracy", "holdout_accuracy"),
       critical_perm_thresholds = c(0.1, 0.1))