FROM ubuntu:jammy-20240427 as build

WORKDIR /app
RUN apt-get update && apt-get install -y gcc=4:13.2.0-7ubuntu1 build-essential=12.10ubuntu1 wget=1.21.4-1ubuntu4
RUN wget https://github.com/ColinIanKing/stress-ng/archive/refs/tags/V0.17.08.tar.gz && \
  tar xavf V0.17.08.tar.gz && \
  cd stress-ng-0.17.08 && \
  make && make install


FROM ubuntu:jammy-20240427 

WORKDIR /app
COPY --from=build /usr/bin/stress-ng /usr/bin/
  
ENTRYPOINT ["/usr/bin/stress-ng"]
CMD ["--help"]

