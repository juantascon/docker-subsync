FROM ubuntu:bionic

RUN apt-get update
RUN apt-get install -y --no-install-recommends build-essential python3 python3-dev python3-pip ffmpeg

RUN pip3 install --upgrade pip setuptools
RUN pip3 install --no-cache-dir -r https://raw.githubusercontent.com/smacke/subsync/master/requirements.txt
RUN pip3 install --no-cache-dir https://github.com/smacke/subsync/zipball/master

RUN rm -r /root/.cache /var/lib/apt/lists/*

ENTRYPOINT ["subsync"]
CMD ["--help"]
