FROM ruby:3.1.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application code
COPY . .

# Precompile assets
RUN bundle exec rake assets:precompile

# Expose port
EXPOSE 3000

# Set environment variables
ENV RAILS_ENV=production

# Start the application
CMD ["bundle", "exec", "puma", "-C", "config/puma.rb"]
