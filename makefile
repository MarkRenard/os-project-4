OSS	= oss
OSS_OBJ	= oss.o queue.o multiQueue.o bitVector.o logging.o $(COMMON_O)
OSS_H	= queue.h multiQueue.h bitVector.h logging.h $(COMMON_H)

USER_PROG	= userProgram
USER_PROG_OBJ	= userProgram.o $(COMMON_O)
USER_PROG_H	= $(COMMON_H)

BV_TEST		= bvTest
BV_TEST_OBJ	= bvTest.o bitVector.o perrorExit.o randomGen.o
BV_TEST_H	= bitVector.h constants.h perrorExit.h randomGen.h

CLOCK_TEST	= clockTest
CLOCK_TEST_OBJ	= clockTest.o clock.o randomGen.o
CLOCK_TEST_H	= clock.h randomGen.h

COMMON_O  = clock.o perrorExit.o randomGen.o sharedMemory.o \
	    getSharedMemoryPointers.o pcb.o message.o
COMMON_H  = clock.h perrorExit.h randomGen.h sharedMemory.h \
	    getSharedMemoryPointers.h pcb.h message.h constants.h

OUTPUT     = $(OSS) $(USER_PROG) 
OUTPUT_OBJ = $(OSS_OBJ) $(USER_PROG_OBJ)
CC         = gcc
FLAGS      = -Wall -g -lm $(DEBUG) $(DEF) 
DEBUG	   = -DDEBUG_Q

.SUFFIXES: .c .o

all: $(OUTPUT)

$(OSS): $(OSS_OBJ) $(OSS_H)
	$(CC) $(FLAGS) -o $@ $(OSS_OBJ) 

$(USER_PROG): $(USER_PROG_OBJ) $(USER_PROG_H)
	$(CC) $(FLAGS) -o $@ $(USER_PROG_OBJ) 

$(BV_TEST): $(BV_TEST_OBJ) $(BV_TEST_H)
	$(CC) $(FLAGS) -o $@ $(BV_TEST_OBJ) 

$(CLOCK_TEST): $(CLOCK_TEST_OBJ) $(CLOCK_TEST_H)
	$(CC) $(FLAGS) -o $@ $(CLOCK_TEST_OBJ)

.c.o:
	$(CC) $(FLAGS) -c $<

.PHONY: clean rmfiles cleanall
clean:
	/bin/rm -f $(OUTPUT) $(OUTPUT_OBJ)
cleanbvtest:
	/bin/rm -f $(BV_TEST) $(BV_TEST).o
cleanclocktest:
	/bin/rm -f $(CLOCK_TEST) $(CLOCK_TEST).o
rmfiles:
	/bin/rm -f oss_log 
cleanall:
	/bin/rm -f oss_log $(OUTPUT) $(OUTPUT_OBJ) $(BV_TEST) $(BV_TEST_OBJ) $(CLOCK_TEST) $(CLOCK_TEST_OBJ)


