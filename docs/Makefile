# Minimal makefile for Sphinx documentation

# Variables that can be set from the command line or environment
SPHINXOPTS    ?=
SPHINXBUILD   ?= sphinx-build
PYTHON				?= python3
SOURCEDIR     = source
BUILDDIR      = build

# Default target: "make" without argument is like "make help"
.PHONY: help
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Install dependencies
.PHONY: install
install:
	pip install -r requirements.txt

.PHONY: preview
preview:
	@$(PYTHON) -m http.server --directory $(BUILDDIR)/dirhtml 3000

.PHONY: build
build:
	@$(SPHINXBUILD) -M dirhtml "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

# Route all unknown targets to Sphinx using the new "make mode" option
.PHONY: Makefile
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
