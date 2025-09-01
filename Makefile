all: clean compile run

compile: test_env.c
	gcc -g -Wall test_env.c -o test_env -lvirt -lm
run:
	./test_env
clean:
	rm -f test_env