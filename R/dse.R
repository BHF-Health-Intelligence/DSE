


#' Parse tablename 
#'
#' Format the tablename in the catalog.schema.table format
#' @param tablename The table name in schema.table or catalog.schema.table format. If catalog name is undefined, it will default to "devcatalog" 
#' @return Correctly formatted table name in catalog.schema.table format for DSE
#' @examples 
#' table <- parse_tablename("myschema.mytable")
#' table2 <- parse_tablename("mycatalog.myschema.mytable")
#' @export
parse_tablename=function(tablename){
  tablename_split <- strsplit(tablename, "\\.")[[1]]
  if (length(tablename_split) == 2) {
    catalog="devcatalog"
    schema <- tablename_split[1]
    table <- tablename_split[2]
  } else if (length(tablename_split) == 3) {
    catalog <- tablename_split[1]
    schema <- tablename_split[2]
    table <- tablename_split[3]
  }
return(paste(catalog,schema,table,sep="."))
}


#' Read data from DSE table
#'
#' @param tablename The table name in schema.table or catalog.schema.table format 
#' @return Spark dataframe of requested table
#' @examples 
#' table <- read_data("myschema.mytable")
#' @export
read_data=function(tablename){
return(SparkR::tableToDF(parse_tablename(tablename)))
}


#' Save data to DSE table
#' 
#' @param df The dataframe to save, of SparkR dataframe or R dataframe format
#' @param tablename The table name in schema.table or catalog.schema.table format 
#' @param mode The save mode. Options include "error" (default, which raises an error if the table already exists), "append" (which appends the data to the existing table), "overwrite" (which overwrites the existing table), and "ignore" (which does nothing if the table already exists).
#' @examples 
#' table <- read_data("myschema.mytable")
#' @export
save_data=function(df,tablename,mode="error"){

  if (class(df) == "SparkDataFrame") {
    SparkR::saveAsTable(df, parse_tablename(tablename), mode = mode)
  } else if (class(df) == "data.frame") {
    SparkR::saveAsTable(SparkR::createDataFrame(df),parse_tablename(tablename), mode = mode)
  }
}
