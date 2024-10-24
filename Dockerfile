FROM gcc AS builder
WORKDIR /src
COPY *.c .
RUN gcc main.c -o calc

FROM ubuntu:24.04
COPY --from=builder /src/calc /usr/bin/calc
ENTRYPOINT ["calc"]