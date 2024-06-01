FROM ubuntu as build

RUN apt-get update && apt-get install -y gcc build-essential wget
RUN wget https://github.com/ColinIanKing/stress-ng/archive/refs/tags/V0.17.08.tar.gz && \
  tar xavf V0.17.08.tar.gz && \
  cd stress-ng-0.17.08 && \
  make && make install

FROM ubuntu
COPY --from=build /usr/bin/stress-ng /usr/bin/
  
ENTRYPOINT ["/usr/bin/stress-ng"]
CMD ["--help"]

