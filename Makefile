SOURCE="https://downloads.vivaldi.com/stable/vivaldi-stable_2.9.1705.41-1_amd64.deb"
DESTINATION="build.deb"
OUTPUT="Vivaldi.AppImage"


all:
	echo "Building: $(OUTPUT)"
	wget -O $(DESTINATION) -c $(SOURCE)
	
	dpkg -x $(DESTINATION) build
	rm -rf AppDir/opt
	
	mkdir --parents AppDir/opt/application
	mv build/opt/vivaldi/* AppDir/opt/application

	chmod +x AppDir/AppRun

	appimagetool AppDir $(OUTPUT)

	chmod +x $(OUTPUT)

	rm -f $(DESTINATION)
	rm -rf AppDir/opt
	rm -rf build
