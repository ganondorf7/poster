# Variables
SRC_CSS := src/css/styles.css
OUTPUT_CSS := docs/css/styles.css
BUILD_DIR := docs
HTTP_SERVER := http-server

# Commands
build: ## Build TailwindCSS for production
	npx tailwindcss -i $(SRC_CSS) -o $(OUTPUT_CSS) --minify

serve: ## Serve the project locally using http-server
	$(HTTP_SERVER) $(BUILD_DIR)

watch: ## Watch for changes and recompile TailwindCSS
	npx tailwindcss -i $(SRC_CSS) -o $(OUTPUT_CSS) --watch

clean: ## Clean up build artifacts
	rm -rf $(OUTPUT_CSS)

help: ## Display this help message
	@echo "Available targets:"
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help
