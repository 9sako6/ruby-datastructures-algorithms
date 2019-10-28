FROM ruby:latest
RUN apt-get update -qq && apt-get install -y \
    bash \
    git

RUN gem install httpclient
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]