FROM ubuntu:bionic

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
  build-essential \
  python3 \
  python3-dev \
  python3-pip && \
  rm -rf /var/lib/apt/lists/*
  
RUN pip3 install --upgrade pip setuptools && \
  ln -s -f pip3 /usr/bin/pip && \
  ln -s -f /usr/bin/python3 /usr/bin/python && \
  rm -r /root/.cache

RUN pip install --no-cache-dir -r https://raw.githubusercontent.com/smacke/subsync/master/requirements.txt
RUN pip install --no-cache-dir https://github.com/smacke/subsync/zipball/master

ENTRYPOINT ["subsync"]
CMD ["--help"]
