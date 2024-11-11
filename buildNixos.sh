echo "Setting up files"
cd ./nixos/dm-wms/i3/
rm -rf config
touch config
cp config_template config
cd ..
wallpaper="$PWD/wallpaper.jpg"
sed -i -e "s|WALLPAPER|${wallpaper}|g" $PWD/i3/config


cd ./i3/
rm -rf i3statusconfig
touch i3statusconfig
cp i3statusconfig_template i3statusconfig
i3StatArgs="-c $PWD/i3statusconfig"
sed -i -e "s|I3_STATUS_ARGS|${i3StatArgs}|g" $PWD/config

cd ..
cd ..
cd ..

echo $PWD
echo "Building Nixos"
sudo nixos-rebuild switch --flake .#
home-manager switch --flake .#nixy


