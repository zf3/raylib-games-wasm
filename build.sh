rm -rf build
mkdir build
cd build
cp -a ../assets assets
emcmake cmake ../src
make || exit
mkdir -p web
for g in arkanoid flappy_bird fps snake space_invaders zombie_animate
do
	mkdir -p web/$g
	cp $g.* web/$g
	mv web/$g/$g.html web/$g/index.html
done
echo && echo Success! Your games are in build/web.
