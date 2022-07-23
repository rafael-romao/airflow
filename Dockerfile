FROM apache/airflow:2.3.0

USER root

COPY requirements.txt .

RUN apt-get update \ 
  && apt-get install -y --no-install-recommends \
         python-dev \
  && apt-get install -y --no-install-recommends \
         python3-dev \
  && apt-get install -y --no-install-recommends \
         build-essential \
  && apt-get install -y --no-install-recommends \
         libxslt-dev libffi-dev libssl-dev \
  && apt-get autoremove -yqq --purge \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

USER airflow

RUN python -m pip install -r requirements.txt --no-cache-dir