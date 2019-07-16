FROM ubuntu:19.10

RUN apt-get update && apt-get install -y \
        git \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
        python-dev  \
        build-essential \
        libssl-dev \
        libffi-dev \
        libxml2-dev \
        libxslt1-dev \
        zlib1g-dev \
        python-pip \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y \
        python3.7-dev \
        python3-pip \
        python3-setuptools \
        python3-virtualenv \
        python3-wheel \
        && apt-get clean \
        && rm -rf /var/lib/apt/lists/*

RUN update-alternatives --install /usr/bin/python python /usr/bin/python3.7 1

RUN pip install -U --no-cache-dir \
        apache-airflow \
        flask==1.0.4 \
        werkzeug==0.14.1 \
        jinja2==2.10.0

RUN pip install -U --no-cache-dir \
        tensorflow \
        tfx \
        httplib2==0.12.0 \
        mock==2.0.0 \
        setuptools==41.0.1

RUN pip install -U --no-cache-dir \
        docker-py \
        docker-compose \
        papermill \
        networkx \
        requests==2.20.1

# For workshop
RUN pip install -U --no-cache-dir \
        grpcio-tools

RUN mkdir /root/tfx
RUN git clone -b r0.13 https://github.com/tensorflow/tfx.git /root/tfx/tfx
WORKDIR /root/tfx/tfx/tfx/examples/workshop/setup
RUN ./setup_demo.sh

WORKDIR /root
ADD run_workers.sh /root

CMD ["/root/run_workers.sh"]
