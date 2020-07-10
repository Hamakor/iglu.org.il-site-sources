
RSYNC = rsync --progress --verbose --rsh=ssh

ALL_DEST_BASE = dest

DOCS_COMMON_DEPS = template.wml lib/MyNavData.pm lib/MyManageNews.pm

WML_FLAGS = -DLATEMP_THEME=better-scm

LATEMP_WML_FLAGS =$(shell latemp-config --wml-flags)

WML_FLAGS += --passoption=2,-X3074 --passoption=3,-I../../lib/ \
	--passoption=3,-w $(LATEMP_WML_FLAGS) -I../../ -DROOT~. \
    -I../../lib/ \
	-I $${HOME}/apps/wml

all: dummy

%.show:
	@echo "$* = $($*)"

define COPY
	cp -f $< $@
endef

LATEMP_COPY = $(COPY)

include include.mak
include rules.mak

# Add news_feeds to this target if you want to generate an RSS feed.
dummy : latemp_targets

RSS_FEED = $(IGLU.ORG.IL_DEST)/rss.xml

news_feeds: $(RSS_FEED)

$(RSS_FEED): gen-feeds.pl lib/MyManageNews.pm
	perl -Ilib gen-feeds.pl --rss2-out="$@"

.PHONY:

REMOTE_UPLOAD_TARGET = shlomif@gnu.hamakor.org.il:/home/www/iglu.org.il/
TEMP_SHLOMIFY__REMOTE_UPLOAD_TARGET = hostgator:public_html/IGLU-Site/

upload_hamakor: all
	cd $(ALL_DEST_BASE)/iglu && \
	$(RSYNC) -a * $(REMOTE_UPLOAD_TARGET)

upload: all
	cd $(ALL_DEST_BASE)/iglu && \
	$(RSYNC) -a * $(TEMP_SHLOMIFY__REMOTE_UPLOAD_TARGET)
