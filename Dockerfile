from inwt/r-shiny:4.2.1

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    libcairo2-dev \
    libcgal-dev \
    libgconf-2-4 \
    libgtk-3-0 \
    libgdal-dev \
    libglu1-mesa-dev \
    libgsl-dev \
    libfreetype6-dev \
    libftgl2 \
    libmagick++-dev \
    libpng-dev \
    libtk8.6 \
    libudunits2-dev \
    libv8-dev \
    libx11-dev \
    libxss1 \
    pandoc \
    xvfb \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && rm -rf /var/lib/apt/lists/* \
    && echo "options(repos = c(getOption('repos'), PANDORA = 'https://Pandora-IsoMemo.github.io/drat/'))" >> /usr/local/lib/R/etc/Rprofile.site \
    && echo $(cat /usr/local/lib/R/etc/Rprofile.site) \
    && Rscript -e "getOption('repos')" \
    && Rscript -e "create_mirror_url <- function(date) { \
                      paste0("https://packagemanager.posit.co/cran/", format(date, "%Y-%m-%d")) \
                    }; \
                  \
                  check_if_mirror_is_available <- function(date) { \
                    url <- create_mirror_url(date) \ 
                    stat <- system(paste0("curl -s -o /dev/null -w '%{http_code}' ", \
                    url, "/src/contrib/PACKAGES"), intern=TRUE, ignore.stderr=TRUE, wait = TRUE) \
                    ifelse(stat == "200", TRUE, FALSE) \
                    }; \
                  get_mirror_date <- function() { \
                    r_version_date <- as.Date(paste(utils::sessionInfo()[["R.version"]][c("year", "month", "day")], collapse = "-")) \
                    for (date in as.list(seq(r_version_date, by = -1, length.out = 5))) { \
                      if (check_if_mirror_is_available(date)) { \
                        return(date) \
                  }}} ; \
                  mirror_date <- get_mirror_date(); \
                  cat(create_mirror_url(mirror_date));" \
    && installPackage \
    alphahull \
    animation \
    abind \
    Bchron \
    BH \
    BMSC \
    car \
    coda \
    colourpicker \
    covr \
    FNN \
    geometry \
    jsonlite \
    kernlab \
    ks \
    linprog \
    loo \
    lpSolve \
    magic \
    maps \
    mapview \
    MASS \
    miniUI \
    mgcv \
    misc3d \
    multicool \
    mvtnorm \
    openxlsx \
    plot3D \
    pracma \
    pROC \
    raster \
    rcarbon \
    RcppProgress \
    RColorBrewer \
    readODS \
    readr \
    readxl \
    reticulate \
    Rfast \
    rgdal \
    rgl \
    rstan \
    rstantools \
    sgeostat \
    shinyWidgets \
    sp \
    splancs \
    StanHeaders \
    tripack \
    webshot \
    && Rscript -e "install.packages('https://cran.r-project.org/src/contrib/Archive/nimble/nimble_0.12.2.tar.gz', repos = NULL); \
                   remotes::install_github('INWTlab/shiny-matrix'); \
                   webshot::install_phantomjs()"


