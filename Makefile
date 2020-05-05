CONTAINER=docker.pkg.github.com/guillaumeparis2000/docker-openvpn
VERSION=`git describe --tags`

docker_dev:
	docker build -t ${CONTAINER}:${VERSION}_dev -t ${CONTAINER}:dev .

push_dev: docker_dev
	docker push ${CONTAINER}:${VERSION}
	docker push ${CONTAINER}:dev

publish_dev: push_dev
	git checkout -- package.json

docker_pre:
	docker build -t ${CONTAINER}:${VERSION}_pre -t ${CONTAINER}:pre .

push_pre: docker_pre
	docker push ${CONTAINER}:${VERSION}
	docker push ${CONTAINER}:pre

publish_pre: push_pre
	git checkout -- package.json

docker_pro:
	docker build -t ${CONTAINER}:${VERSION} -t ${CONTAINER}:latest .

push_pro: docker_pro
	docker push ${CONTAINER}:${VERSION}
	docker push ${CONTAINER}:latest

publish_pro: push_pro
	git checkout -- package.json
