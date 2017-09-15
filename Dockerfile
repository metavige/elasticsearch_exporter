FROM quay.io/prometheus/golang-builder as builder

ADD .   /go/src/github.com/justwatchcom/elasticsearch_exporter
WORKDIR /go/src/github.com/justwatchcom/elasticsearch_exporter

RUN make

FROM alpine

COPY --from=builder /go/src/github.com/justwatchcom/elasticsearch_exporter/elasticsearch_exporter  /bin/elasticsearch_exporter

EXPOSE      9108
ENTRYPOINT  [ "/bin/elasticsearch_exporter" ]
