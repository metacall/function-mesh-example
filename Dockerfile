#
# MetaCall Function Mesh Example by Parra Studios
# Copyright (C) 2016 - 2019 Vicente Eduardo Ferrer Garcia <vic798@gmail.com>
#

# Builder Python image
FROM python:3.5-slim-stretch AS python_builder

# Copy Python dependencies spec
COPY frontend/requirements.txt /

# Run pip installer
RUN pip install --user -r /requirements.txt

# Builder Ruby image
FROM ruby:2.3.8-slim-stretch AS ruby_builder

# Copy Ruby dependencies spec
COPY cache/Gemfile cache/Gemfile.lock /

# Run gem installer
RUN gem install bundler \
	&& bundler install --gemfile=/Gemfile

# # Builder CSharp image
# FROM microsoft/dotnet:1.1.10-sdk-1.1.11-stretch AS csharp_builder

# # Copy dependencies
# COPY pdf/ /

# Builder NodeJS image
FROM node:10.15.3-stretch-slim AS nodejs_builder

# Copy NodeJS dependencies spec
COPY react/package.json react/package-lock.json /

# Run npm installer
RUN npm ci

# Copy NodeJS source
COPY react/.babelrc react/react.jsx /

# Generate NodeJS source output
RUN npm run build

# MetaCall CLI image
FROM metacall/core:cli AS testing

# Image descriptor
LABEL copyright.name="Vicente Eduardo Ferrer Garcia" \
	copyright.address="vic798@gmail.com" \
	maintainer.name="Vicente Eduardo Ferrer Garcia" \
	maintainer.address="vic798@gmail.com" \
	vendor="MetaCall Inc." \
	version="0.1"

# Copy scripts
COPY . $LOADER_SCRIPT_PATH/

# Copy Python dependencies
COPY --from=python_builder /root/.local /root/.local

# Copy Ruby dependencies
COPY --from=ruby_builder /root/.gem /root/.gem
COPY --from=ruby_builder /usr/local/bundle/ /usr/local/bundle/

# # Copy CSharp dependencies
# COPY --from=csharp_builder /root/.nuget /root/.nuget

# Copy NodeJS dependencies
COPY --from=nodejs_builder /root/.npm /root/.npm
COPY --from=nodejs_builder /node_modules $LOADER_SCRIPT_PATH/react/node_modules
COPY --from=nodejs_builder /react.js $LOADER_SCRIPT_PATH/react/react.js
