.PHONY:	install uninstall

install:
		@echo "Linking prescient to system PATH..."
		@if [ ! -f "$(PWD)/.venv/bin/prescient" ]; then \
				echo "!!Error: Virtual environment binary not found. Run install.sh first."; \
				exit 1; \
		fi
		@sudo ln -sf $(PWD)/.venv/bin/prescient /usr/local/bin/prescient
		@echo "System link created successfully!!"

uninstall:
		@echo "To completely remove prescient, run: sudo prescient uninstall"		