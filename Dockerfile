# Use an official Rust image
FROM rust:latest

# Create a new binary project
WORKDIR /usr/src/github-action
COPY . .

RUN cargo build --release

CMD cargo run
