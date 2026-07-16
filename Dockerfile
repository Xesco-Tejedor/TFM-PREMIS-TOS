FROM alpine:3.18
RUN apk add --no-cache xmllint jing schematron
COPY schemes/tos.xsd /app/tos.xsd
COPY schemes/tos.sch /app/tos.sch
COPY examples/ /app/examples
CMD ["jing", "-c", "/app/tos.sch", "/app/tos.xsd"]