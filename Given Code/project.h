/***************************************************************************************************************************
Header Files
****************************************************************************************************************************/
#include <stdlib.h>
#include <stdio.h>
#include <ctype.h>
#include <string.h>
#include <strings.h>
#include <math.h>
#include <time.h>
#include <complex.h>
#include <assert.h>
#include <limits.h>
/***************************************************************************************************************************
Constant Declarations 
****************************************************************************************************************************/
// VARIOUS CONSTANTS
#define Mfnam      20			// max size for a file name
#define Mnod    15000 		        // max number of nodes in a graph/node
#define Mlin      200			// max size of characters in a line
#define Mnam       25			// max size of a node name
#define Mtyp       10			// max type of nodes/gates
#define Mout       16		        // max node out degree (nfo)
#define Min         9			// max node in degree (nfi)
#define Mpi       233			// max number of primary inputs
#define Mpo       140			// max number of primary outputs
#define Mpt       10			// max number of input patterns in .vec file
#define Mft       10			// max number of stuck at faults in .faults file
// NODE TYPE CONSTANTS 
#define INPT 1				// Primary Input
#define AND  2				// AND 
#define NAND 3				// NAND 
#define OR   4				// OR 
#define NOR  5				// NOR 
#define XOR  6				// XOR 
#define XNOR 7				// XNOR 
#define BUFF 8				// BUFFER 
#define NOT  9				// INVERTER 
#define FROM 10				// STEM BRANCH
/***************************************************************************************************************************
Structure Declarations 
****************************************************************************************************************************/
//1.Stucture declaration for LIST
typedef struct LIST_type {
   int  id;		   //id for current element		
   struct LIST_type *nxt;  //pointer to next id element( if there is no element, then it will be NULL)		
} LIST;
//2.Stucture declaration for NODE
typedef struct NODE_type
{
  char nam[Mnam];                      //name of the node
  int typ,nfi,nfo,po;                  //type, nooffanins, nooffanouts,primaryo/p
  int mar,val,fval;                    //marker,correctvalue,faultvalue
  LIST *fin,*fot;                      //fanin members, fanout members 
} NODE;
//3.Stucture declaration for PATTERN
typedef struct PATTERN_type
{
 char piv[Mpi];    //primary input vector(size is not declared)
} PATTERN;
//4.Stucture declaration for FAULT
/*typedef struct FAULT_type
{
 int nod,sval;      //stuckatnode,stuckatvalue
} FAULT;*/
/***************************************************************************************************************************
Functions in given.c
****************************************************************************************************************************/
/***************************************************************************************************************************
LIST Structure Functions
****************************************************************************************************************************/
void InsertList(LIST **,int);
void PrintList(LIST *);
void FreeList(LIST **);
/***************************************************************************************************************************
 NODE Structure Functions
****************************************************************************************************************************/
int ReadIsc(FILE *,NODE *);
void InitializeCircuit(NODE *,int);
int AssignType(char *);
void PrintCircuit(NODE *,int);
void ClearCircuit(NODE *,int);
/***************************************************************************************************************************
 PATTERN Structure Functions
****************************************************************************************************************************/
int ReadVec(FILE *,PATTERN *);
/***************************************************************************************************************************
User Defined Functions in user.c
****************************************************************************************************************************/

/****************************************************************************************************************************/
