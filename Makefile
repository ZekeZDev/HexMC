default:
	@echo "No Default make command configured"
	@echo "Please use either"
	@echo "   - make curseforge"
	@echo "   - make modrinth"
	@echo "   - make polymc"
	@echo "   - make technic"
	@echo "   - make all"
	@echo ""
	@echo "Curseforge will make a curseforge compatible zip"
	@echo ""
	@echo "Modrinth will make a Modrinth compatible mrpack"
	@echo ""
	@echo "PolyMC will make a PolyMC zip file which contains the packwiz updater."
	@echo ""
	@echo "Technic will make a Technic pack zip"
	@echo ""
	@echo "All will make all packs it can"
	@echo ""
	
curseforge:
	@echo "Making Curseforge pack"
	mkdir -p build
	packwiz curseforge export --pack-file ./pack/.minecraft/pack.toml -o ./build/modpack-curseforge.zip
	7z d ./build/modpack-curseforge.zip overrides/packwiz-installer-bootstrap.jar overrides/pack.toml  overrides/index.toml	

modrinth:
	@echo "Making Modrinth pack"
	mkdir -p build
	packwiz modrinth export --pack-file ./pack/.minecraft/pack.toml -o ./build/modpack-modrinth.mrpack
	7z d ./build/modpack-modrinth.mrpack overrides/packwiz-installer-bootstrap.jar overrides/pack.toml  overrides/index.toml	

polymc:
	@echo "Making PolyMC pack"
	7z d ./build/modpack-polymc.zip ./pack/* -r
	7z d ./build/modpack-polymc.zip ./pack/.minecraft -r
	7z a ./build/modpack-polymc.zip ./pack/* -r
	7z a ./build/modpack-polymc.zip ./pack/.minecraft -r
	7z d ./build/modpack-polymc.zip ./pack/.minecraft/mods ./pack/.minecraft/pack.toml ./pack/.minecraft/index.toml -r

technic:
	@echo "Making Technic pack"
	mkdir -p build
	-cp -r ./pack/.minecraft ./build/.technic
	-cp ./pack/icon.png ./build/.technic/
	cd ./build/.technic && java -jar packwiz-installer-bootstrap.jar https://zekesmith.github.io/HexMC/pack/.minecraft/pack.toml -g && cd ..
	-rm -rf ./build/.technic/packwiz*
	7z d ./build/modpack-technic.zip ./build/* -r
	7z a ./build/modpack-technic.zip ./build/.technic/* -r

clean:
	-rm -rf ./build/.technic
	-git gc --aggressive --prune

all: curseforge modrinth polymc technic clean
