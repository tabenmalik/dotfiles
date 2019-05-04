all: install

install:
	cp ./vimrc ~/
	mv ~/vimrc ~/.vimrc
	mkdir -p ~/.vim/
	cp -r ./colors ~/.vim/
	cp -r ./indent ~/.vim/
	cp -r ./syntax ~/.vim/
	cp -r ./ftdetect ~/.vim/
	cp -r ./ftplugin ~/.vim/
	cp -r ./compiler ~/.vim/

update: install
