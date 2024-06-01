FROM ubuntu:jammy-20240427 as build

RUN apt-get update -y && apt-get install -y --no-install-recommends gcc=4:11.2.0-1ubuntu1 build-essential=12.9ubuntu3 curl=7.81.0-1ubuntu1.16 ca-certificates=20230311ubuntu0.22.04.1 
WORKDIR /app
RUN curl -OL https://github.com/ColinIanKing/stress-ng/archive/refs/tags/V0.17.08.tar.gz 
RUN tar xavf V0.17.08.tar.gz
RUN cd stress-ng-0.17.08 && make && make install


FROM ubuntu:jammy-20240427 
COPY --from=build /usr/bin/stress-ng /usr/bin/ 
ENTRYPOINT ["/usr/bin/stress-ng"]
CMD ["--help"]

