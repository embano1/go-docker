ARG GO_IMG_VERSION
FROM golang:${GO_IMG_VERSION}
RUN apk add --no-cache git
RUN go get golang.org/x/tools/cmd/godoc

FROM golang:${GO_IMG_VERSION}
USER root
# The uid and gid will be set to 901 to avoid conflicts with offical users on the docker host.
RUN addgroup -S godoc && adduser -S -u 901 -g godoc godoc 
WORKDIR /go
COPY --from=0 /go/bin/godoc bin/
ARG GO_IMG_VERSION
ARG PORT=6060
LABEL DESCRIPTION="Container which gives you easy access to the \
documentation of a clean Go Standard Library environment"
LABEL GO_IMG_VERSION=${GO_IMG_VERSION}
EXPOSE ${PORT}
USER godoc
ENV PORT=${PORT}
CMD godoc -http=:${PORT}