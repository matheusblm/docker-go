
FROM golang:alpine AS builder

WORKDIR /app

COPY . .

RUN go mod init hello-fullcycle

RUN go build -o hello-fullcycle


FROM scratch

WORKDIR /app

COPY --from=builder /app/hello-fullcycle .

CMD ["./hello-fullcycle"]