support_dir ?= $(CURDIR)/.support
tidy ?= $(shell which tidy 2>/dev/null)
ifeq (,$(tidy))
tidy := $(support_dir)/bin/tidy
endif
cmake ?= cmake

.PHONY: install_tidy
install_tidy: $(tidy)
$(tidy):
	if [ ! -d tidy-html5 ]; then \
	  mkdir -p tidy-html5; \
	  git clone -q --depth 10 https://github.com/htacg/tidy-html5.git tidy-html5; \
	fi
	cd tidy-html5/build/cmake && \
	  $(cmake) ../.. -DCMAKE_INSTALL_PREFIX=$(support_dir) -DCMAKE_BUILD_TYPE=Release && \
	  make && make install

.PHONY: check
check: install_tidy
	$(tidy) -quiet -config tidyconf.txt -errors index.html

.PHONY: tidy
tidy: install_tidy
	-$(tidy) -quiet -config tidyconf.txt -modify index.html
