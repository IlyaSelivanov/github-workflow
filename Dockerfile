FROM rust:latest AS build
COPY . .
RUN rustup target add x86_64-unknown-linux-musl
RUN cargo install --path . --target x86_64-unknown-linux-musl

FROM alpine:latest AS runtime
COPY --from=build /usr/local/cargo/bin/github-workflow /usr/local/bin/github-workflow

FROM runtime as action
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT [ /entrypoint.sh ]
