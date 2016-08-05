##' Check Feature Engineering Object
##'
##' @param object An S4 object.
##' 
##' @return TRUE if there are no errors, otherwise the error messages.
##' 

checkFeatureEngineering = function(object){
    errors = character()
    if(ncol(object@xTrainRaw) != ncol(object@xTestRaw)){
        msg = "xTrainRaw and xTestRaw must have the same number of columns!"
        errors = c(errors, msg)
    }
    if(any(colnames(object@xTrainRaw) != colnames(object@xTestRaw))){
        msg = "xTrainRaw and xTestRaw must have the same column names!"
        errors = c(errors, msg)
    }
    if(length(errors) == 0)
        TRUE
    else
        errors
}

##' Cross Validation Class
##' 
##' \describe{
##' 
##' \item{\code{xTrainRaw}:} A data.table containing the training features.
##' 
##' \item{\code{xTestRaw}:} A data.table containing the testing features.
##' 
##' @export crossValidation
##'   

featureEngineering = setClass(Class = "featureEngineering",
    representation = representation(xTrainRaw = "data.table",
                                    xTestRaw = "data.table"),
    validity = checkFeatureEngineering
#    package = "featureEngineering"
    )

##' Summary method
##' 
##' Generates a summary of the featureEngineering object.
##' 
##' @param object A featureEngineering object.
##' 

setMethod("summary", "featureEngineering", function(object){
    cat(sprintf("Training rows:              %s\n", nrow(object@xTrainRaw)))
    cat(sprintf("Testing rows:               %s\n", nrow(object@xTestRaw)))
    cat(sprintf("Number of initial features: %s\n", ncol(object@xTrainRaw)))
})

##' Add Time Series Aggregate
##' 
##' Computes the aggregate of some variable or variables at the previous time
##' and assigns those as features at the current time.  For the test set
##' 
##' @param object A featureEngineering object.
##'   

setGeneric("addTSaggregate", function(object, timeCol, aggFunction)
    {standardGeneric("addTSaggregate")})
setMethod("addTSaggregate", "featureEngineering", function(object){
    cat(sprintf("Training rows:              %s\n", nrow(object@xTrainRaw)))
    cat(sprintf("Testing rows:               %s\n", nrow(object@xTestRaw)))
    cat(sprintf("Number of initial features: %s\n", ncol(object@xTrainRaw)))
})
