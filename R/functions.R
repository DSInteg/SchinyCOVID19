tz_global <- function(tz = NULL) {
  if (!is.null(tz)) return(tz)
  tz <- Sys.getenv("TZ")
  if (tz == "") "UTC" else tz
}