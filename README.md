# FAQ-Server


## Adminpassword
If you set ENV-Variabl **ADMIN_PASSWORD", the Password will bcrypted in users.db.


```
	docker run -ti --rm --name=faqs -e NODE_ENV=production -e ADMIN_PASSWORD=admin123 -p 3000:3000 -v $(SRC_DIR):$(APP_DIR)/data $(DOCKER_IMAGE)
```

