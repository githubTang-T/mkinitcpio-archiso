all:

install:
	# install to sbin since script only usable by root
	mkdir -p $(DESTDIR)/usr/sbin
	install -m 755 mkarchiso $(DESTDIR)/usr/sbin
	# testiso can be used by anyone
	mkdir -p $(DESTDIR)/usr/bin
	install -m 755 testiso $(DESTDIR)/usr/bin
	# hooks/install are needed by mkinitcpio
	mkdir -p $(DESTDIR)/lib/initcpio/{hooks,install}
	install -m 644 hooks/{archiso,boot-cd,boot-usb} $(DESTDIR)/lib/initcpio/hooks/
	install -m 644 install/{archiso,boot-cd,boot-usb} $(DESTDIR)/lib/initcpio/install/
	# install default config in a sane location
	mkdir -p $(DESTDIR)/usr/share/archiso
	cp -R default-config $(DESTDIR)/usr/share/archiso/
