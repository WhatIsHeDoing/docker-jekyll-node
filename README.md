# Docker Jekyll Node.js

[![Docker Pulls](https://img.shields.io/docker/pulls/whatishedoing/jekyll-node?style=for-the-badge)][site]
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/whatishedoing/jekyll-node?style=for-the-badge)][site]

## 👋 Introduction

Designed to be used as a base image for [Jekyll] builds, with [Node.js] augmentation. [Yarn] is also available.

## 🏃‍ Usage

Try using it as as part of your [CI/CD] pipeline:

```dockerfile
# Specify this image.
FROM whatishedoing/jekyll-node

WORKDIR /home

# Copy all files that are not in .dockerignore.
COPY . .

# Install modules and run the build.
RUN yarn install --frozen-lockfile && \
    yarn build

# Let the consumer know that Jekyll will serve from port 4000 on docker run.
EXPOSE 4000

# Run Jekyll serve to test!
CMD [ "jekyll", "serve", "--host", "0.0.0.0" ]
```

[hub]: https://hub.docker.com/u/whatishedoing
[Jekyll]: https://jekyllrb.com/
[Node.js]: https://nodejs.org/
[site]: https://hub.docker.com/r/whatishedoing/jekyll-node
[Yarn]: https://yarnpkg.com/
