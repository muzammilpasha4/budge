
FROM ruby:3.1.2

WORKDIR /usr/src/app  

# Install dependencies 
RUN apt-get update && apt-get install -y \     
build-essential \     
nodejs \     
npm \     
yarn \     
sqlite3 \     
--no-install-recommends && \     
rm -rf /var/lib/apt/lists/*  

# Install Rails version you need 
RUN gem install rails  

# Copy the current directory contents into the container at /usr/src/app 
COPY . .  

# Install gems 
RUN bundle install  

# Expose port 3000 to the outside world 
EXPOSE 3000  

# Start the Rails server 
CMD ["rails", "server", "-b", "0.0.0.0"]

