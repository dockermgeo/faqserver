DOCKER_IMAGE=dockermgeo/faq-server
APP_DIR=/app
SRC_DIR=/docker/data/faq

install:
	cd src && npm install && npm run auditfix
build:
	cd src && npm run prepublish
	docker build -t $(DOCKER_IMAGE) -f Dockerfile .

start:
	cd src
	npm start

run:
	mkdir -p /docker/data/faq
	#docker run -ti --rm --name=faqs -e NODE_ENV=development -p 3000:3000 -v $(SRC_DIR):$(APP_DIR)/data $(DOCKER_IMAGE)
	docker run -ti --rm --name=faqs -e ADMIN_PASSWORD=admin123 -p 3000:3000 -v $(SRC_DIR):$(APP_DIR)/data $(DOCKER_IMAGE)

prebuild:
	mkdir -p src
	cd src
	git clone https://github.com/mrvautin/openKB.git
	mv openKB target
	rm -Rf target/.git*
	cp -Rf sources/* target/
	mv target/* .
	mv target/.* .
