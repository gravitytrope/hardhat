# Standardized helpers for output lists

# ------------------------------------------------------------------------------
# Mold

out_mold <- function(predictors, outcomes, engine, extras) {
  list(
    predictors = predictors,
    outcomes = outcomes,
    engine = engine,
    extras = extras
  )
}

out_mold_clean <- function(engine, data) {
  list(
    engine = engine,
    data = data
  )
}

out_mold_clean_xy <- function(engine, x, y) {
  list(
    engine = engine,
    x = x,
    y = y
  )
}

out_mold_process <- function(engine, predictors, outcomes, info, extras) {
  list(
    engine = engine,
    predictors = predictors,
    outcomes = outcomes,
    info = info,
    extras = extras
  )
}

out_mold_process_terms <- function(engine, terms_lst) {
  list(
    engine = engine,
    terms_lst = terms_lst
  )
}

out_mold_process_terms_lst <- function(data, info, extras = NULL) {
  list(
    data = data,
    info = info,
    extras = extras
  )
}

# ------------------------------------------------------------------------------
# Forge

out_forge <- function(predictors, outcomes, extras) {
  list(
    predictors = predictors,
    outcomes = outcomes,
    extras = extras
  )
}

out_forge_process <- function(engine, predictors, outcomes, extras) {
  list(
    engine = engine,
    predictors = predictors,
    outcomes = outcomes,
    extras = extras
  )
}

out_forge_process_terms <- function(engine, terms_lst) {
  list(
    engine = engine,
    terms_lst = terms_lst
  )
}

# data can be NULL here for outcomes = FALSE
out_forge_process_terms_lst <- function(data = NULL, extras = NULL) {
  list(
    data = data,
    extras = extras
  )
}

out_forge_clean <- function(engine, new_data) {
  list(
    engine = engine,
    new_data = new_data
  )
}

# ------------------------------------------------------------------------------
# Info

out_info_lst <- function(predictors, outcomes) {
  list(
    predictors = predictors,
    outcomes = outcomes
  )
}

# ------------------------------------------------------------------------------
# Extras

# Just c() them together
# Extras aren't predictor or outcome specific
out_extras_lst <- function(predictors_extras, outcomes_extras) {
  c(predictors_extras, outcomes_extras)
}

# ------------------------------------------------------------------------------
# Output list helper

# This must be at the end (after all functions have been defined)
# since it calls the functions from inside a
# list and not inside another function

out <- list(
  mold = list(
    final = out_mold,
    clean = out_mold_clean,
    clean_xy = out_mold_clean_xy,
    process = out_mold_process,
    process_terms = out_mold_process_terms,
    process_terms_lst = out_mold_process_terms_lst
  ),
  forge = list(
    final = out_forge,
    clean = out_forge_clean,
    process = out_forge_process,
    process_terms = out_forge_process_terms,
    process_terms_lst = out_forge_process_terms_lst
  ),
  info = list(
    final = out_info_lst
  ),
  extras = list(
    final = out_extras_lst
  )
)