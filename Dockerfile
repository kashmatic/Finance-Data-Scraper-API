FROM ubuntu

MAINTAINER Andy Papa

RUN apt-get update && apt-get install -y \
  python3 \
  python3-setuptools \
  python3-pip \
  python3-lxml \
  memcached \
  git \
&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/ajpotato214/Finance-Data-Scraper-API.git

RUN cd Finance-Data-Scraper-API && python3 setup.py install

EXPOSE 8080

CMD cd Finance-Data-Scraper-API && git pull https://github.com/ajpotato214/Finance-Data-Scraper-API.git && python3 finance_data_scraper/webserver.py
