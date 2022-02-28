FROM golang:1.17-alpine3.15 as builder
WORKDIR /app
COPY . .
RUN go build -o main main.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .

CMD ["/app/main"]