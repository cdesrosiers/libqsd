# Makefile for QSD code.

QSD_DIR = .

CXX = g++
FLAGS = -g -O -Wno-deprecated

INC = $(QSD_DIR)/include
SRC = $(QSD_DIR)/src

LOADLIBES = -lm
LDFLAGS = 
CXXFLAGS = $(DCC) -I$(INC) $(FLAGS)
CPPFLAGS = 

COMPILE = $(CXX) -c $(CPPFLAGS) $(CXXFLAGS)
LINK = $(CXX) $(CPPFLAGS) $(CXXFLAGS) $(LDFLAGS)

RAN_OBJ =  Random.o Normal.o Uniform.o RNG.o ACG.o MLCG.o CmplxRan.o
RAN_HEAD = $(INC)/Random.h $(INC)/Normal.h $(INC)/Uniform.h $(INC)/RNG.h $(INC)/ACG.h $(INC)/MLCG.h $(INC)/CmplxRan.h

OBJ1 =  Operator.o PrimOp.o State.o Complex.o
HEAD1 = $(INC)/Operator.h $(INC)/PrimOp.h $(INC)/State.h $(INC)/Complex.h
OBJ2 = FieldOp.o SpinOp.o AtomOp.o
OBJ3 = Traject.o $(RAN_OBJ)
OBJ = $(OBJ1) $(OBJ2) $(OBJ3)
#-------------------------------------------------------------------
# Add driver routines here.

ALL = onespin spins simple moving sums testprog template

myprog: myprog.cpp $(OBJ)
	$(LINK) -o myprog myprog.cpp $(OBJ) $(LOADLIBES)

onespin: onespin.cpp $(OBJ)
	$(LINK) -o onespin onespin.cpp $(OBJ) $(LOADLIBES)

spins: spins.cpp $(OBJ)
	$(LINK) -o spins spins.cpp $(OBJ) $(LOADLIBES)

simple: simple.cpp $(OBJ)
	$(LINK) -o simple simple.cpp $(OBJ) $(LOADLIBES)

moving: moving.cpp $(OBJ)
	$(LINK) -o moving moving.cpp $(OBJ) $(LOADLIBES)

sums: sums.cpp $(OBJ)
	$(LINK) -o sums sums.cpp $(OBJ) $(LOADLIBES)

testprog: testprog.cpp $(OBJ)
	$(LINK) -o testprog testprog.cpp $(OBJ) $(LOADLIBES)

template: template.cpp $(OBJ)
	$(LINK) -o template template.cpp $(OBJ) $(LOADLIBES)

#-------------------------------------------------------------------

all: $(ALL)

cleanexe:
	rm $(ALL)

cleanrand:
	rm $(RAN_OBJ)

clean:
	rm *.o

Traject.o: $(SRC)/Traject.cpp $(INC)/Traject.h $(HEAD1) $(RAN_HEAD)
	$(COMPILE) $(SRC)/Traject.cpp

State.o: $(SRC)/State.cpp $(HEAD1)
	$(COMPILE) $(SRC)/State.cpp

Operator.o: $(SRC)/Operator.cpp $(HEAD1)
	$(COMPILE) $(SRC)/Operator.cpp

PrimOp.o: $(SRC)/PrimOp.cpp $(HEAD1)
	$(COMPILE) $(SRC)/PrimOp.cpp

FieldOp.o: $(SRC)/FieldOp.cpp $(INC)/FieldOp.h $(HEAD1)
	$(COMPILE) $(SRC)/FieldOp.cpp

SpinOp.o: $(SRC)/SpinOp.cpp $(INC)/SpinOp.h $(HEAD1)
	$(COMPILE) $(SRC)/SpinOp.cpp

AtomOp.o: $(SRC)/AtomOp.cpp $(INC)/AtomOp.h $(HEAD1)
	$(COMPILE) $(SRC)/AtomOp.cpp

Complex.o: $(SRC)/Complex.cpp $(INC)/Complex.h
	$(COMPILE) $(SRC)/Complex.cpp

Random.o: $(SRC)/Random.cpp $(RAN_HEAD)
	$(COMPILE) $(SRC)/Random.cpp

Normal.o: $(SRC)/Normal.cpp $(RAN_HEAD)
	$(COMPILE) $(SRC)/Normal.cpp

Uniform.o: $(SRC)/Uniform.cpp $(RAN_HEAD)
	$(COMPILE) $(SRC)/Uniform.cpp

RNG.o: $(SRC)/RNG.cpp $(RAN_HEAD)
	$(COMPILE) $(SRC)/RNG.cpp

ACG.o: $(SRC)/ACG.cpp $(RAN_HEAD)
	$(COMPILE) $(SRC)/ACG.cpp

MLCG.o: $(SRC)/MLCG.cpp $(RAN_HEAD)
	$(COMPILE) $(SRC)/MLCG.cpp

CmplxRan.o: $(SRC)/CmplxRan.cpp $(RAN_HEAD) $(INC)/Complex.h
	$(COMPILE) $(SRC)/CmplxRan.cpp
