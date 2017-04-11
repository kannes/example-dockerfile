FROM andrewosh/binder-base

MAINTAINER Andrew Osheroff <andrewosh@gmail.com>

USER root

# Add R dependencies
RUN apt-get update
RUN apt-get install -y r-base && apt-get clean  # add r-recommended 

USER main

# Install R kernel, https://github.com/IRkernel/IRkernel
RUN R CMD "install.packages('devtools')"
RUN R CMD "devtools::install_github('IRkernel/IRkernel')"
RUN R CMD "IRkernel::installspec()"  # to register the kernel in the current R installation

