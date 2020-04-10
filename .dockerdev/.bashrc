alias be="bundle exec"
alias ber="bundle exec rails"
alias bek="bundle exec rake"
alias gs="git status"

create_new_rails_app() {
  gem install rails -v "$1"

  # Skip bundle,  since "rails new" will rely on internal ruby bundler
  # instead of the one defined in our Dockerfile, creating bugs and inconsistencies.
  #
  # Use postgresql so that we rely on only one kind of database on all environments.
  #
  # Skip webpack-install since it relies on wrong bundler
  rails new . --skip --skip-bundle --skip-webpack-install --database=postgresql 

  # bundle everything with the correct bundler (defined in Docker)
  bundle install
  # webpacker:install is now possible
  bundle exec rails webpacker:install

  # HACK : replace check_yarn_integrity true to false to avoid weird yarn behaviour
  # Simply adds "check_yarn_integrity: false" to the config/webpacker.yml
  sed -i.bak 's/check_yarn_integrity: true/check_yarn_integrity: false/g' config/webpacker.yml

  # DOCKER : map database host to the one provided by the docker service
  # Simply adds "host: postgres" to the config/database.yml
  awk '/pool:/ { print; print "  host: postgres"; next }1' config/database.yml > config/tmp && mv config/tmp config/database.yml

}
