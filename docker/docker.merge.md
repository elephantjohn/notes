```dockerfile
FROM tfs-nima.0525:latest AS builder

FROM flask.0525

COPY --from=builder . .  

ADD start.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]
```

```dockerfile

FROM flask-swagger.tfs-nima.0525:latest AS builder

FROM szface.0525:latest

COPY --from=builder /  /  

ADD start.sh /
RUN chmod +x /start.sh
CMD ["/start.sh"]

```

