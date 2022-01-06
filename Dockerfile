FROM islasgeci/base:0.7.0
COPY . .
RUN apt update && apt install --yes \
    gnuplot

RUN Rscript -e "install.packages(c('comprehenr'), repos='http://cran.rstudio.com')"
RUN Rscript -e "install.packages(c('covr', 'devtools', 'lintr', 'roxygen2', 'styler', 'testthat', 'vdiffr'), repos='http://cran.rstudio.com')"

RUN pip install \
    sklearn \
    tensorflow
