FROM ruby:latest
LABEL "maintainer" "Darren Hickling"
LABEL "website" "https://darrenhickling.com"

# Update and install HTTPS first.
RUN apt-get update && \
    apt-get install -y apt-transport-https

# Register Yarn repository: https://yarnpkg.com/en/docs/install#debian-stable.
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

# Set the Node version to install later.
# https://github.com/nodesource/distributions/blob/master/README.md#debinstall
RUN curl -sL https://deb.nodesource.com/setup_13.x | bash -

# Update again, install Node and useful packages, and clean up.
RUN apt-get update && \
    apt-get install -y build-essential locales-all nodejs yarn && \
    npm install npm -g && \
    gem install -N jekyll jekyll-relative-links jekyll-sitemap && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    apt-get autoremove -y && \
    apt-get clean

# This is a build-only image, so no CMD.
