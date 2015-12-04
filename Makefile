all: make_bin_dir grep cat yes sort

make_bin_dir:
	mkdir bin

grep: src/grep.hs
	stack ghc -- src/grep.hs -o bin/grep

cat: src/cat.hs
	stack ghc -- src/cat.hs -o bin/cat

yes: src/yes.hs
	stack ghc -- src/yes.hs -o bin/yes

sort: src/sort.hs
	stack ghc -- src/sort.hs -o bin/sort
