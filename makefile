OSS        = oss
OSS_OBJ    = oss.o $(SHARED_O)
OSS_H      = $(SHARED_H)

USER_PROG     = userProgram
USER_PROG_OBJ = userProgram.o $(SHARED_O)
USER_PROG_H   = $(SHARED_H)

SHARED_H  = clock.h perrorExit.h randomGen.h sharedMemory.h \
	    constants.h pcb.h shmkey.h
SHARED_O  = clock.o perrorExit.o randomGen.o sharedMemory.o

OUTPUT     = $(OSS) $(USER_PROG)
OUTPUT_OBJ = $(OSS_OBJ) $(USER_PROG_OBJ)
CC         = gcc
FLAGS      = -Wall -g -lm


.SUFFIXES: .c .o

all: $(OSS)

$(OSS): $(OSS_OBJ) $(OSS_H)
	$(CC) $(FLAGS) -o $@ $(OSS_OBJ)

$(USER_PROG): $(USER_PROG_OBJ) $(USER_PROG_H)
	$(CC) $(FLAGS) -o $@ $(USER_PROG_OBJ)

.c.o:
	$(CC) $(FLAGS) -c $<

.PHONY: clean rmfiles cleanall
clean:
	/bin/rm -f $(OUTPUT) $(OUTPUT_OBJ)
rmfiles:
	/bin/rm -f oss_log 
cleanall:
	/bin/rm -f oss_log $(OUTPUT) $(OUTPUT_OBJ)
