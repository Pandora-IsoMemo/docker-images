FROM inwt/r-batch:4.0.1

RUN apt-get update && \
  apt-get install -y libv8-dev

RUN echo "options(repos = c(getOption('repos'), MPI = 'https://isomemodb.com/r-repo/'))" >> /usr/local/lib/R/etc/Rprofile.site

RUN Rscript -e "install.packages(c('dplyr', 'ggplot2', 'loo', 'rstan', 'rstantools', 'R.utils', 'StanHeaders', 'BH', 'Rcpp', 'RcppEigen', 'pROC'), repos = 'https://mran.microsoft.com/snapshot/2021-01-01')"
