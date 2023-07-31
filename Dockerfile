FROM jupyter/base-notebook:latest
MAINTAINER chapmanbe <brian.chapman@utah.edu>
USER root
# for physionet instructions see
# https://www.physionet.org/physiotools/wfdb-linux-quick-start.shtml
# dependencies for spell nbextensions (including spell check) and other requirements

RUN apt-get update && apt-get upgrade -y && apt-get install -y \
      locales-all \
  && rm -rf /var/lib/apt/lists/*



RUN conda update conda -y && conda install -c conda-forge -y \
    pandas

RUN conda install -c pyviz hvplot


WORKDIR /home/jovyan


# RUN nbstripout --install
CMD ["start-notebook.sh"]
