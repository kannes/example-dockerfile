FROM andrewosh/binder-base

MAINTAINER Andrew Osheroff <andrewosh@gmail.com>

USER root

# Add R dependencies
#RUN apt-get update
#RUN apt-get install -y r-base && apt-get clean  # add r-recommended 

# https://github.com/jupyter/docker-stacks/blob/master/r-notebook/Dockerfile
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    fonts-dejavu \
    gfortran \
    gcc && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER main

# no idea how to do these... R is weird
# Install R kernel, https://github.com/IRkernel/IRkernel
#RUN R CMD "install.packages('devtools')"
#RUN R CMD "devtools::install_github('IRkernel/IRkernel')"
#RUN R CMD "IRkernel::installspec()"  # to register the kernel in the current R installation


# https://github.com/jupyter/docker-stacks/blob/master/r-notebook/Dockerfile
# R packages
RUN conda config --add channels r && \
    conda install --quiet --yes \
    'r-base=3.3.2' \
    'r-irkernel=0.7*' \
    'r-plyr=1.8*' \
    'r-devtools=1.12*' \
    'r-tidyverse=1.0*' \
    'r-shiny=0.14*' \
    'r-rmarkdown=1.2*' \
    'r-forecast=7.3*' \
    'r-rsqlite=1.1*' \
    'r-reshape2=1.4*' \
    'r-nycflights13=0.2*' \
    'r-caret=6.0*' \
    'r-rcurl=1.95*' \
    'r-crayon=1.3*' \
'r-randomforest=4.6*' && conda clean -tipsy
