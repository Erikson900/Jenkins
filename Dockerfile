# Building
FROM alpine:latest as builder
WORKDIR /app
#COPY springMusic demo/ ./music demo
RUN echo "Some Text here" > file 
RUN echo "this is build"; cat .file


# Test
FROM  alpine:latest as test
WORKDIR /app
COPY --from=builder /usr/src/app ./app
RUN echo "This is Test stage"
RUN cat .file


# Security
FROM alpine:latest as security
WORKDIR /code
COPY --from=builder /usr/src/app ./
RUN echo "This is Security stage"
RUN cat .file

# Back-end
FROM alpine:latest as backend
WORKDIR /code
COPY --from=builder /usr/src/app ./
RUN echo "backend is Up"
RUN cat .file

# Front-end
FROM alpine:latest as frontend
WORKDIR /code
COPY --from=builder /usr/src/app ./
RUN echo "Front-End is up and Running"
RUN cat .file

# 
FROM alpine:latest as deploy
WORKDIR /code
COPY --from=builder /usr/src/app ./
RUN echo "Starship engine hot and ready for deployment in 3...."
RUN cat .file



