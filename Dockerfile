FROM microsoft/dotnet:2.0.3-sdk-stretch

RUN apt-get -y clean \
	&& apt-get -y purge \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
	&& curl -sL https://deb.nodesource.com/setup_8.x | bash - \
	&& apt-get install -y nodejs python python-pip \
	&& curl -sSL https://get.docker.com/ | sh \
	&& pip install awscli --upgrade --user \
	&& ln root/.local/bin/aws /bin/aws \
	&& rm -rf /var/lib/apt/lists/*

ADD ./wrapdocker /usr/local/bin/wrapdocker
RUN chmod +x /usr/local/bin/wrapdocker