#  Pre Build
FROM alpine:latest as pre-build
WORKDIR /code
COPY ./someFile.txt ./code/someFile.txt
RUN cat ./code/someFile.txt
RUN echo "PRE-BUILD"

# Building
FROM alpine:latest as builder
COPY --from=pre-build /code/someFile.txt ./someFile.txt
RUN echo "building .."

# Test
FROM  alpine:latest as test
RUN echo "This is Test stage"

# Security
FROM alpine:latest as security
RUN echo "This is Security stage"

# Back-end
FROM alpine:latest as backend
RUN echo "backend is Up"

# Front-end
FROM alpine:latest as frontend
RUN echo "Front-End is up and Running"

# Deploy
FROM alpine:latest as deploy
RUN echo "Starship engine hot and ready for deployment in 3...."

# Post
FROM alpine:latest as post
RUN echo "clear environment"
