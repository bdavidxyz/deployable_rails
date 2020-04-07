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

# executable JS is required, specifying explicitly node version 12
RUN apt-get -y install dialog apt-utils curl gnupg  
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get -y install nodejs
RUN nodejs -v

ENTRYPOINT [ "/bin/bash" ]
