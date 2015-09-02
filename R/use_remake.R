##' Add a remake file template
##' 
##' This function adds a simple remake file template to a 
##' target directory.
##' 
##' @param dir directory in which to create. Defaults to
##'   current directory.
##' @return This function is primarily useful for its side 
##'   effect, which is to add a template remake.yml file to 
##'   the home directory.
##' @export
use_remake <- function(dir = ".") {
  remake_filename <- "remake"
  path <- file.path(dir, paste0(remake_filename, ".yml"))
  if (file.exists(path)) {
    stop(remake_filename, ".yml already exists", call. = FALSE)
  }
  message("Adding remake.yaml file")
  
  template_path <- system.file("doc/remake.yml", package = "remake")
  file.copy(template_path, path)

  invisible(TRUE)
}