TARGETS=imp1 imp2h

all: $(TARGETS)

configuration.tab.c configuration.tab.h: configuration.y
	bison -d configuration.y

lex.yy.c: configuration.f configuration.tab.h
	flex configuration.f

imp1: lex.yy.c configuration.tab.c configuration.tab.h
	g++ configuration.tab.c lex.yy.c -lfl -o imp1

imp2h: imp2.hs
	ghc -o imp2h imp2.hs

clean:
	rm a.out test.cfg configuration.tab.c configuration.tab.h lex.yy.c imp2.hi imp2.o imp2h $(TARGETS)
