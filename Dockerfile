# Building
FROM alpine:latest as builder
WORKDIR /app
RUN echo "Some Text here" > file 
RUN echo "this is build"; cat .file


# Test
FROM  alpine:latest as test
COPY --from=builder ./app ./
RUN echo "This is Test stage"
RUN ls


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



