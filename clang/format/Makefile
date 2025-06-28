FORMAT = clang-format-19
GITFORMAT = clang-format-diff-19 -p1
GITDIFF = git diff -U0 HEAD --relative

SOURCESDIR = rules
BUILDDIR = build

CONFIG = .clang-format
STYLE = --style=file:$(CONFIG)
GITSTYLE = -style file:$(CONFIG)
SOURCES = $(wildcard $(SOURCESDIR)/*.cpp)
CONFIGS = $(SOURCES:$(SOURCESDIR)/%.cpp=$(BUILDDIR)/%.yaml)

AWKVARIABLE = -v COMMENT=1
AWKPROGRAM = \
	COMMENT==NR && /^\/\// { \
		COMMENT++; \
		if ($$1=="//!") { \
			print substr($$0, 5) \
		} \
		else { \
			print "\#" substr($$0, 3) \
		} \
	}

.PHONY: all clean config
.PHONY: format format-apply
.PHONY: git-format git-format-apply

all: git-format

$(BUILDDIR)/%.yaml: $(SOURCESDIR)/%.cpp
	@mkdir -p $(BUILDDIR)
	@awk $(AWKVARIABLE) '$(AWKPROGRAM)' $< | tee $@
config: $(CONFIGS)
	@cat $^ > $(CONFIG)
clean:
	@rm -f $(CONFIG) $(BUILDDIR)/*.yaml

format: config
	@$(FORMAT) $(STYLE) $(SOURCES)
format-apply: config
	@$(FORMAT) $(STYLE) -i $(SOURCES)
git-format: config
	@$(GITDIFF) | $(GITFORMAT) $(GITSTYLE)
git-format-apply: config
	@$(GITDIFF) | $(GITFORMAT) $(GITSTYLE) -i

