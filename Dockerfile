FROM jupyter/base-notebook:@sha256:a2fc20cbc3656d38b3f699fb97fcee165dfd919cbead4fcb2e1f96fd6c658a59
MAINTAINER chapmanbe <brian.chapman@utah.edu>
USER root
# for physionet instructions see
# https://www.physionet.org/physiotools/wfdb-linux-quick-start.shtml
# dependencies for spell nbextensions (including spell check) and other requirements

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
      locales-all \
  && rm -rf /var/lib/apt/lists/*



RUN conda update conda -y && conda install -c conda-forge -c pyviz -y \
    pandas=2.0.3 \
    hvplot=0.8.4

WORKDIR /home/jovyan

COPY Resources/ Resources/
ADD Pandas-DataWrangling.ipynb .


# RUN nbstripout --install
CMD ["start-notebook.sh"]
