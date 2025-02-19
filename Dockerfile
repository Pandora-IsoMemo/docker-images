FROM inwt/r-shiny:4.3.2

# install system dependencies
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    lbzip2 \
    libcairo2-dev \
    libcgal-dev \
    libgconf-2-4 \
    libgtk-3-0 \
    libgdal-dev \
    libglu1-mesa-dev \
    libglpk-dev \
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
    && rm -rf /var/lib/apt/lists/*

# add Pandora Repository
RUN echo "options(repos = c(getOption('repos'), PANDORA = 'https://Pandora-IsoMemo.github.io/drat/'))" >> /usr/local/lib/R/etc/Rprofile.site

# install R Packages
RUN installPackage \
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
    rgl \
    rstan \
    rstantools \
    sgeostat \
    shinyMatrix \
    shinyWidgets \
    sp \
    splancs \
    StanHeaders \
    tripack \
    webshot

RUN Rscript -e "install.packages('https://cran.r-project.org/src/contrib/Archive/nimble/nimble_0.12.2.tar.gz', repos = NULL); \
                webshot::install_phantomjs()"
