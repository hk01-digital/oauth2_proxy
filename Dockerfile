FROM golang:1.9 AS builder

WORKDIR /go/src/github.com/hk01-digital/oauth2_proxy
COPY . .
RUN go get -d -v \
    && CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo .

FROM nginx:1.15
COPY nginx/. /etc/nginx/.

RUN apt-get update \
    && apt-get -y install \
        ca-certificates \
    && apt-get clean

WORKDIR /root/
COPY --from=builder /go/src/github.com/hk01-digital/oauth2_proxy/oauth2_proxy .

EXPOSE 80

STOPSIGNAL SIGTERM

# CMD ["nginx", "-g", "daemon off;"]

# ENTRYPOINT ["/root/oauth2_proxy"]

COPY ./startup.sh /root/startup.sh
COPY ./email_list /root/email_list

ENV UPSTREAM=http://127.0.0.1:80

CMD /root/startup.sh
