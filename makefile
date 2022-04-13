lextest: driver.o lex.yy.o errormsg.o util.o y.tab.o
	gcc -g -o lextest driver.o lex.yy.o errormsg.o util.o y.tab.o

driver.o: driver.c y.tab.h errormsg.h util.h
	gcc -g -c driver.c

errormsg.o: errormsg.c errormsg.h util.h
	gcc -g -c errormsg.c

lex.yy.o: lex.yy.c y.tab.h errormsg.h util.h
	gcc -g -c lex.yy.c

lex.yy.c: mlp.l y.tab.h
	flex mlp.l

y.tab.o: y.tab.c y.tab.h
	gcc -g -c y.tab.c
y.tab.h: parser.y
	bison -dvy parser.y

util.o: util.c util.h
	cc -g -c util.c

clean: 
	rm -f a.out lextest util.o driver.o lex.yy.o lex.yy.c errormsg.o