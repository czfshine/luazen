
# ----------------------------------------------------------------------
# adjust the following to the location of your Lua include files

LUAINC= -I../lua/include

# ----------------------------------------------------------------------

CC= gcc

CFLAGS= -Os -fPIC $(LUAINC) 
LDFLAGS= -fPIC

LUAZEN_O= luazen.o base58.o lzf_c.o lzf_d.o norx.o mono.o \
          md5.o rc4.o randombytes.o

luazen.so:  src/*.c src/*.h
	$(CC) -c $(CFLAGS) src/*.c
	$(CC) -shared $(LDFLAGS) -o luazen.so $(LUAZEN_O)

test:  luazen.so
	lua test/test_luazen.lua
	
clean:
	rm -f *.o *.so *.dll

.PHONY: clean test

