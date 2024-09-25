FROM apache/airflow

COPY ./requirements.txt ./ 

USER root
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y git
    
USER airflow 
RUN pip install -r requirements.txt