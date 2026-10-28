package_list <- read.csv("installed_packages.csv")$x

# Identify which packages are not already installed on this machine
new_packages <- package_list[!(package_list %in% installed.packages()[,"Package"])]

# Install the missing packages
if(length(new_packages) > 0) {
  install.packages(new_packages)
} else {
  print("All packages are already installed!")
}