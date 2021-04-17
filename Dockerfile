#building stage
FROM golang:1.16 AS building
WORKDIR /go/src/app
COPY main.go .
RUN go build main.go

#--optimizing o/
FROM scratch
COPY --from=building /go/src/app/main .
CMD [ "./main" ]

