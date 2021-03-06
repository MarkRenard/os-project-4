// queue.h was created by Mark Renard on 2/5/2020
// This file defines function prototypes for a string queue structure

#ifndef QUEUE_H
#define QUEUE_H

#include "pcb.h" // Inlcudes definition of ProcessControlBlock

typedef struct Queue {
	ProcessControlBlock * back;
	ProcessControlBlock * front;
	int count;
} Queue;

void printQueue(FILE *, const Queue *);
void addToFront(Queue * q, ProcessControlBlock * pcb);
void initializeQueue(Queue *);
void enqueue(Queue *, ProcessControlBlock *);
ProcessControlBlock * dequeue(Queue *);

#endif

