FROM ubuntu

RUN apt-get update \
    && apt-get install -y wget gnupg \
    && wget -q -O - https://packages.cloudfoundry.org/debian/cli.cloudfoundry.org.key | apt-key add - \
    && echo "deb https://packages.cloudfoundry.org/debian stable main" | tee /etc/apt/sources.list.d/cloudfoundry-cli.list \
    && apt-get update \
    && apt-get install -y cf-cli \
    && apt-get -y autoremove \
	  && rm -rf /var/lib/apt/lists/*
