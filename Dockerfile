from inwt/r-shiny:4.2.2

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
    nimble \
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
    Rfast \
    rgdal \
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
    webshot \
    #&& Rscript -e "webshot::install_phantomjs()"

# We need orca or rather AppImage from https://github.com/plotly/orca
# - First install conda
# - then install plotly-orca
# - make conda available on PATH
# ENV PATH="/opt/conda/bin:${PATH}"
# RUN wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
#    && bash Miniconda3-latest-Linux-x86_64.sh -b -p /opt/conda \
#    && rm -f Miniconda3-latest-Linux-x86_64.sh \
#    && conda install -y -c plotly plotly-orca
