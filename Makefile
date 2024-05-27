LIMA_FEDORA_BOOTC_IMAGE=quay.io/fedora/bootc-lima:40
BIB_IMAGE=quay.io/centos-bootc/bootc-image-builder:latest
RAW_IMAGE=output/image/disk.raw
DOCKERFILE=Dockerfile

.PHONY: build-container-image
build-container-image:
	podman build -f ${DOCKERFILE} -t ${LIMA_FEDORA_BOOTC_IMAGE} .

.PHONY: build-raw-image
build-raw-image:
	mkdir -p output
	podman run --rm -it --privileged --pull=newer \
		--security-opt=label=type:unconfined_t \
		-v /var/lib/containers/storage:/var/lib/containers/storage \
		-v $(PWD)/output:/output ${BIB_IMAGE} --type raw --rootfs xfs --local ${LIMA_FEDORA_BOOTC_IMAGE}
