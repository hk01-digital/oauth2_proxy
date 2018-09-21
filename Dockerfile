FROM golang:1.9 AS builder

WORKDIR /go/src/github.com/hk01-digital/oauth2_proxy
COPY . /go/src/github.com/hk01-digital/oauth2_proxy/
RUN go get -d -v
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo .

FROM nginx:1.15
COPY nginx/nginx.conf /etc/nginx/nginx.conf
COPY nginx/proxy_pass_domain.conf /etc/nginx/proxy_pass_domain.conf

RUN apt-get update
RUN apt-get -y install ca-certificates

WORKDIR /root/
COPY --from=builder /go/src/github.com/hk01-digital/oauth2_proxy/oauth2_proxy .

EXPOSE 80

STOPSIGNAL SIGTERM

# CMD ["nginx", "-g", "daemon off;"]

# ENTRYPOINT ["/root/oauth2_proxy"]

COPY ./startup.sh /root/startup.sh
COPY ./email_list /root/email_list

CMD /root/startup.sh
