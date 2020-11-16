FROM ubuntu:18.04
ENV DEBIAN_FRONTEND=noninteractive
RUN echo "APT::Get::Assume-Yes \"true\";" > /etc/apt/apt.conf.d/90assumeyes &&\
	    apt-get update && apt-get install -y --no-install-recommends \
        ca-certificates \
        curl \
        jq \
        git \
        python2.7 \
        python-pip \
        unzip \
        wget \
        openssh-server

RUN wget https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip && unzip ./terraform_0.13.5_linux_amd64.zip -d /usr/local/bin/

RUN wget -q -O /usr/local/bin/terragrunt "https://github.com/gruntwork-io/terragrunt/releases/download/v0.25.1/terragrunt_linux_amd64" && chmod +x /usr/local/bin/terragrunt

RUN curl -O https://bootstrap.pypa.io/get-pip.py && python2.7 get-pip.py && pip install awscli && echo 'export PATH=$HOME/bin:$PATH' >> ~/.bashrc

RUN wget -q -O /usr/local/bin/kubergrunt "https://github.com/gruntwork-io/kubergrunt/releases/download/v0.6.1/kubergrunt_linux_amd64" && chmod +x /usr/local/bin/kubergrunt

WORKDIR /azp
CMD ["terraform" , "--version"]
