FROM python:3.10.4-slim-buster

RUN apt-get update && \
    apt-get install -y --no-install-recommends python3-pip git && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip

COPY requirements.txt /mistral/requirements.txt

COPY mistral.py /mistral/mistral.py

COPY data.jsonl /mistral/data.jsonl

RUN pip install --no-cache-dir --upgrade --ignore-installed -r /mistral/requirements.txt

WORKDIR /mistral

CMD ["python", "mistral.py"]