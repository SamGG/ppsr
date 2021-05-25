engine_rpart = function(type) {
  return(parsnip::set_engine(parsnip::decision_tree(tree_depth = 5, min_n = 7), "rpart"))
}

engine_tree = function(type) {
  return(parsnip::set_engine(parsnip::decision_tree(), "rpart"))
}

engine_glm = function(type) {
  if (type == 'regression') {
    return(parsnip::set_engine(parsnip::linear_reg(), "lm"))
  } else if (type == 'classification') {
    return(parsnip::set_engine(parsnip::logistic_reg(), "glm"))
  }
}

#' Lists all algorithms currently supported
#'
#' @return a list of all available parsnip engines
#' @export
#'
#' @examples
#' available_algorithms()
available_algorithms = function() {
  return(list(
    'tree' = engine_tree,
    'glm' = engine_glm
  ))
}
