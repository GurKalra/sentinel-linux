.PHONY:	install uninstall

install:
		@echo "Linking Sentinel to system PATH..."
		@if [ ! -f "$(PWD)/.venv/bin/sentinel" ]; then \
				echo "!!Error: Virtual environment binary not found. Run install.sh first."; \
				exit 1; \
		fi
		@sudo ln -sf $(PWD)/.venv/bin/sentinel /usr/local/bin/sentinel
		@echo "System link created successfully!!"

uninstall:
		@echo "Removing Sentinel global link..."
		@sudo rm -f /usr/local/bin/sentinel
		@echo "Uninstalled cleanly."