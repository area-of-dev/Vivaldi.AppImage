# Copyright 2020 Alex Woroschilow (alex.woroschilow@gmail.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
PWD:=$(shell pwd)

.PHONY: all

all: clean init
	mkdir --parents $(PWD)/build/Boilerplate.AppDir/vivaldi	
	$(PWD)/bin/Apprepo.AppImage --destination=$(PWD)/build appdir boilerplate libatk1.0-0 libatk-bridge2.0-0 libgtk-3-0 libwayland-cursor0

	wget --output-document="$(PWD)/build/build.deb" https://downloads.vivaldi.com/stable/vivaldi-stable_5.1.2567.66-1_amd64.deb
	dpkg -x $(PWD)/build/build.deb $(PWD)/build

	echo '' >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo '' >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'LD_LIBRARY_PATH=$${LD_LIBRARY_PATH}:$${APPDIR}/vivaldi'   >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'export LD_LIBRARY_PATH=$${LD_LIBRARY_PATH}'               >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo ''                                                         >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo ''                                                         >> $(PWD)/build/Boilerplate.AppDir/AppRun
	echo 'exec $${APPDIR}/vivaldi/vivaldi "$${@}"'                  >> $(PWD)/build/Boilerplate.AppDir/AppRun

	cp --force --recursive $(PWD)/build/usr/share/* 	$(PWD)/build/Boilerplate.AppDir/share
	cp --force --recursive $(PWD)/build/opt/vivaldi/* 	$(PWD)/build/Boilerplate.AppDir/vivaldi
	
	rm --force $(PWD)/build/Boilerplate.AppDir/*.desktop 		|| true
	rm --force $(PWD)/build/Boilerplate.AppDir/*.png 		  	|| true
	rm --force $(PWD)/build/Boilerplate.AppDir/*.svg 		  	|| true

	cp --force $(PWD)/AppDir/*.desktop $(PWD)/build/Boilerplate.AppDir/ || true
	cp --force $(PWD)/AppDir/*.png $(PWD)/build/Boilerplate.AppDir/ 	|| true
	cp --force $(PWD)/AppDir/*.svg $(PWD)/build/Boilerplate.AppDir/ 	|| true

	export ARCH=x86_64 && $(PWD)/bin/appimagetool.AppImage $(PWD)/build/Boilerplate.AppDir $(PWD)/Vivaldi.AppImage
	chmod +x $(PWD)/Vivaldi.AppImage

init:
	mkdir --parents $(PWD)/bin

	wget https://apprepo.de/appimage/download/apprepo \
		--output-document=$(PWD)/bin/Apprepo.AppImage
	chmod +x $(PWD)/bin/Apprepo.AppImage

	wget https://github.com/AppImage/AppImageKit/releases/download/13/appimagetool-x86_64.AppImage \
		--output-document=$(PWD)/bin/appimagetool.AppImage
	chmod +x $(PWD)/bin/appimagetool.AppImage

clean:
	rm -rf $(PWD)/*.AppImage
	rm -rf $(PWD)/bin/*
	rm -rf $(PWD)/build
