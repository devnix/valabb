FROM valum/valum:0.3

WORKDIR /app
ADD . .

RUN meson build && cd build && ninja

EXPOSE 3003

ENTRYPOINT /app/build/valabb
