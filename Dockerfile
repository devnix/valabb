FROM valum/valum:0.3

RUN pip3 install --upgrade meson

WORKDIR /app
ADD . .

RUN meson build && cd build && ninja

EXPOSE 62481

ENTRYPOINT ["/app/build/valabb", "--address", "0.0.0.0:62481", "--ipv4-only"]
