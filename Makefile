OUTPUT="ScreenCloud.AppImage"
SOURCE:=$(shell curl -s https://api.github.com/repos/olav-st/screencloud/releases/latest \
             | grep -Po 'https://github.com/olav-st/screencloud/releases/download/[^}]*\.AppImage' \
             | uniq)




all: clean
	echo "Building: $(OUTPUT) $(TEST)"
	wget --output-document=$(OUTPUT) --continue ${SOURCE}
	chmod +x $(OUTPUT)

clean:
	rm -f $(OUTPUT)