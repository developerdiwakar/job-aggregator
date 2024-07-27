
FROM golang:alpine3.20 as builder

WORKDIR /app

COPY . .

RUN go mod tidy && go build -o myapp


FROM alpine:latest

WORKDIR /root/

COPY --from=builder /app/myapp .

EXPOSE 3031

CMD ["./myapp"]
