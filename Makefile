# ==================== [START] Global Variable Declaration =================== #
SHELL := /bin/bash
BASE_DIR := $(shell pwd)
UNAME_S := $(shell uname -s)
APP_NAME := decker-plugin

export
# ===================== [END] Global Variable Declaration ==================== #

# =========================== [START] Build Scripts ========================== #
build_plugin:
	@cd $(BASE_DIR)/cmd/decker-plugin && \
		echo "Building" $(APP_NAME) && \
		CGO_ENABLED=1 go build -buildmode=plugin -o $(BASE_DIR)/$(APP_NAME).so

docker_build:
	@docker build -f ./build/package/Dockerfile -t stevenaldinger/$(APP_NAME):latest .
# ============================ [END] Build Scripts =========================== #

# ============================ [START] Run Scripts =========================== #
run:
	@decker $(BASE_DIR)/examples/plugin-schema-test.hcl

docker_run:
	@echo "Forwarding port 6060 for godoc usage within the container."
	@docker run -it --rm \
	  -v $(BASE_DIR):/go/src/github.com/stevenaldinger/$(APP_NAME) \
		-v $(HOME)/decker-reports:/tmp/reports \
	  -p 6060:6060 \
	 stevenaldinger/$(APP_NAME):latest bash
# ============================= [END] Run Scripts ============================ #

# ======================= [START] Documentation Scripts ====================== #
godoc:
	@godoc -http=":6060"
# ==============-========= [END] Documentation Scripts =========-============= #
