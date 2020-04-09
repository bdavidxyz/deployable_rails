alias be="bundle exec"

create_new_rails_app() {
  printf "source 'https://rubygems.org'\n\ngem 'rails', '$1'\n"> "Gemfile"
  bundle install
  rails new --skip --skip-bundle --skip-webpack-install -—database=postgresql 
  bundle install
  bundle exec rails webpacker:install
}
