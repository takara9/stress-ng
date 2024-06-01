FROM ubuntu:jammy-20240427 as build

RUN apt-get update -y && apt-get install -y --no-install-recommends gcc=4:11.2.0-1ubuntu1 build-essential=12.9ubuntu3 wget=1.21.2-2ubuntu1
WORKDIR /app
RUN wget -q https://github.com/ColinIanKing/stress-ng/archive/refs/tags/V0.17.08.tar.gz && \
  tar xavf V0.17.08.tar.gz && \
  cd stress-ng-0.17.08 && \
  make && make install


FROM ubuntu:jammy-20240427 
COPY --from=build /usr/bin/stress-ng /usr/bin/ 
ENTRYPOINT ["/usr/bin/stress-ng"]
CMD ["--help"]

