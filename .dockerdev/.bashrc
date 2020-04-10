alias be="bundle exec"
alias ber="bundle exec rails"
alias bek="bundle exec rake"
alias gs="git status"

create_new_rails_app() {
  gem install rails -v "$1"
  rails new . --skip --skip-bundle --skip-webpack-install --database=postgresql 
  bundle install
  bundle exec rails webpacker:install
  # todo : add "host" property in config/database.yml
}
