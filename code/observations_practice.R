
#!/usr/bin/env Rscript
# Author: Saga Kjällgren
# Script: observations_practice.R
# Desc: Validates, deduplicates and summarises observation data.
# Date: November 2026

# Read and validate observation data
read_observations <- function(path) {

  observations <- read.csv(
    path,
    colClasses = "character",
    na.strings = "",
    check.names = FALSE
  )

  # Check column names and order
  if (!identical(names(observations), c("site", "date", "count"))) {
    stop("CSV must contain site, date and count columns in order")
  }

  # Check site and date are not missing or empty
  if (any(is.na(observations$site)) || any(is.na(observations$date))) {
    stop("Site and date values cannot be missing")
  }

  if (any(observations$site == "") || any(observations$date == "")) {
    stop("Site and date values cannot be empty")
  }

  # Check counts are non-negative whole numbers
  for (i in 1:nrow(observations)) {
    value <- observations$count[i]

    if (!is.na(value) && (is.na(as.numeric(value)) ||
        as.numeric(value) < 0 ||
        as.numeric(value) != floor(as.numeric(value)))) {
        stop(paste(path, "line", i + 1, "count:", value))    }
  }

  # Remove exact duplicate rows
  observations <- unique(observations)

  return(observations)
}

# Read dataset
observations <- read_observations("data/bootcamp_observations_boundary.csv")
# Print observations
print(observations)

# Create an empty summary table
summary <- data.frame(
  site = character(),
  total_known = numeric(),
  missing_count = numeric()
)

# Get unique site names
sites <- unique(observations$site)

# Print summaries for each site
for (site in sites) {

  site_data <- observations[observations$site == site, ]

  if (any(!is.na(site_data$count))) {
    total_known <- sum(as.numeric(site_data$count), na.rm = TRUE)
  } else {
    total_known <- NA
  }

  # Count missing observations
  missing_count <- sum(is.na(site_data$count))

  # Add results to the summary table
  summary <- rbind(summary, data.frame(
    site = site,
    total_known = total_known,
    missing_count = missing_count
  ))
}

# Print the completed summary table and check
print(summary)
stopifnot(is.na(summary$total_known[summary$site == "C"]))
stopifnot(summary$missing_count[summary$site == "C"] == 2)
stopifnot(summary$total_known[summary$site == "D"] == 0)
stopifnot(summary$missing_count[summary$site == "D"] == 0)

#Plot known totals and site
png("results/observations_summary.png")

barplot(
  summary$total_known,
  names.arg = summary$site,
  main = "Known observation totals by site",
  xlab = "Site",
  ylab = "Total known count"
)

#Show missing counts on plot
missing_sites <- summary$site[is.na(summary$total_known)]

if (length(missing_sites) > 0) {
  mtext(
    paste("All counts missing:", paste(missing_sites, collapse = ", ")),
    side = 3,
    line = 1
  )
}
dev.off()