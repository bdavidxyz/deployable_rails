# specific version of Ruby
FROM ruby:2.7.1

WORKDIR /home/app

ENV PORT 3000

EXPOSE $PORT

# specific version of bundler
RUN gem install bundler -v 2.1.4

# specific version of Rails
RUN gem install rails -v 6.0.2.2

# updates the package lists
RUN apt-get update -qq

# executable JS is required, specifying explicitly node version 11.5.4
RUN apt-get -y install curl gnupg apt-utils
RUN curl -sL https://deb.nodesource.com/setup_11.5.4  | bash -
RUN apt-get -y install nodejs
RUN npm install

ENTRYPOINT [ "/bin/bash" ]
