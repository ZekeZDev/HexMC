default:
	@echo "No Default make command configured"
	@echo "Please use either"
	@echo "   - make curseforge"
	@echo "   - make multimc"
	@echo "   - make technic"
	@echo "   - make all"
	@echo ""
	@echo "Curseforge will make a curseforge compatible zip"
	@echo "Multimc will make a multimc zip file which contains"
	@echo "   the packwiz updater"
	@echo ""
	@echo "Technic will make a technic pack zip"
	@echo ""
	@echo "All will make all packs it can"
	@echo ""
	
curseforge:
	@echo "Making Curseforge pack"
	mkdir -p build
	packwiz curseforge export --pack-file ./src/.minecraft/pack.toml -o ./build/modpack-curseforge.zip
	7z d ./build/modpack-curseforge.zip overrides/packwiz-installer-bootstrap.jar overrides/pack.toml  overrides/index.toml	

modrinth:
	@echo "Making Modrinth pack"
	mkdir -p build
	packwiz modrinth export --pack-file ./src/.minecraft/pack.toml -o ./build/modpack-modrinth.mrpack
	7z d ./build/modpack-modrinth.mrpack overrides/packwiz-installer-bootstrap.jar overrides/pack.toml  overrides/index.toml	

polymc:
	@echo "Making PolyMC pack"
	7z d ./build/modpack-polymc.zip ./src/* -r
	7z d ./build/modpack-polymc.zip ./src/.minecraft -r
	7z a ./build/modpack-polymc.zip ./src/* -r
	7z a ./build/modpack-polymc.zip ./src/.minecraft -r
	7z d ./build/modpack-polymc.zip ./src/.minecraft/mods ./src/.minecraft/pack.toml ./src/.minecraft/index.toml -r

technic:
	@echo "Making Technic pack"
	-rm -rf ./build/.technic
	-cp -r ./src/.minecraft ./build/.technic
	-cp ./src/icon.png ./build/.technic/
	cd ./build/.technic && java -jar packwiz-installer-bootstrap.jar https://raw.githubusercontent.com/ZekeSmith/HexMC/main/.minecraft/pack.toml -g && cd ..
	-rm -rf ./build/.technic/packwiz*
	7z d ./build/modpack-technic.zip ./* -r
	7z a ./build/modpack-technic.zip ./build/.technic/* -r

clean:
	-rm -rf ./build/.technic
	-git gc --aggressive --prune

all: curseforge modrinth polymc technic clean
