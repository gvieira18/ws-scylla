setup/current_shell:
	@echo "Updating current shell fs.aio-max-nr";
	@sudo sysctl --write fs.aio-max-nr=1048576 --quiet;
	@echo "New fs.aio-max-nr value for current shell is: $$(sysctl fs.aio-max-nr | awk '{print $$3}')";
	@echo "Finished current shell setup";

setup/permanent:
	@echo "Writing permanent config on '/etc/sysctl.d/41-aio_max_nr.conf'";
	@echo fs.aio-max-nr=1048576 | sudo tee /etc/sysctl.d/41-aio_max_nr.conf > /dev/null;
	@sudo sysctl --load '/etc/sysctl.d/41-aio_max_nr.conf' > /dev/null;
	@echo "New fs.aio-max-nr value for permanent shell is: $$(sysctl fs.aio-max-nr | awk '{print $$3}')";
	@echo "Finished permanent config setup";

.PHONY: setup
setup:
	@echo "Checking current fs.aio-max-nr value..."
	@CURRENT_VALUE=$$(sysctl fs.aio-max-nr | awk '{print $$3}'); \
	if [ $$CURRENT_VALUE -ge 1048576 ]; then \
		echo "Current fs.aio-max-nr value is: $$CURRENT_VALUE"; \
		echo "Setup unnecessary"; \
	else \
		echo "Current fs.aio-max-nr value is: $$CURRENT_VALUE"; \
		$(MAKE) --silent --no-print-directory setup/current_shell; \
		$(MAKE) --silent --no-print-directory setup/permanent; \
		echo "Setup successful"; \
	fi
