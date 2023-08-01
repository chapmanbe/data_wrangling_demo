FROM jupyter/base-notebook:ace427893664468dbb2549cc17f4ed80cefdf3d62a85953f1255387c6efc002f
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
