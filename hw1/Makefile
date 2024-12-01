release: hw1

hw1: hw1.o
	gcc -Wall -o hw1 hw1.o
hw1.o: hw1.c
	gcc -Wall -c hw1.c
debug: hw1.c
	gcc -Wall -g -o hw1 hw1.c
clean:
	rm -f hw1.o hw1