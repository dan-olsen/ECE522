#include "project.h"
/***************************************************************************************************************************
 Main Function(Serial and Parallel Fault Simulation)
****************************************************************************************************************************/
void main(int argc,char **argv)
{
FILE *fisc,*fvec,*ffau,*fres;             //file pointers used for .isc file, .vec file, .faults file and resultfile
int Max,Opt,Npi,Npo,Tot,Tfs;              //maxnode id,option,tot no of PIs,tot no of Pos,Tot no of input patterns& faults in.vec in.faults
clock_t is,it;                            //execution time clock signals
double iexe;                              //execution time 
NODE graph[Mnod];                         //structure used to store the ckt information in .isc file 
PATTERN vector[Mpt];                      //structure used to store the input vectors information in .vec file 
//FAULT struck[Mft];                        //structure used to store the faults information in .faults file
int a,b,c,d;                              //random variables


//Read the .isc file and store the information in graph structure
is=clock();                                        //starting timer
fisc=fopen(argv[1],"r");                           //file pointer to open .isc file 
Max=0; Max=ReadIsc(fisc,graph);                    //read .isc file and return index of last node in graph formed
fclose(fisc);                                      //close file pointer for .isc file
it=clock();                                        //ending the timer
iexe=((double)(it-is))/CLOCKS_PER_SEC;             //execuetion time calculation  
PrintCircuit(graph,Max);                           //print all members of graph structure
printf("\nTime Taken for ISC File: %f",iexe);      //print execuetion time

//Read the .vec file and store the information in  vector structure
fvec=fopen(argv[2],"r");                           //file pointer to open .vec file
Tot=0; Tot=ReadVec(fvec,vector);                   //read .vec file and store in vector structure and return tot number of patterns  
printf("\nTot No of Pattern: %d",Tot);             //print total number of patterns in .vec file
fclose(fvec);                                      //close file pointer for .vec file 
printf("\nIndex\tInputVector\n");
for(a=0;a<Tot;a++){  printf("%d\t%s",a,vector[a].piv); } //print all members of vector structure

fres=fopen(argv[3],"w");                           //file pointer to open .out file for printing results

//Perform Logic Simulationfor each Input vector and print the Pos .val in output file   

fclose(fres);                                                  //close file pointer for .out file
ClearCircuit(graph,Mnod);                                      //clear memeory for all members of graph
for(a=0;a<Tot;a++){ bzero(vector[a].piv,Mpi); }                //clear memeory for all members of vector
return;
}//end of main
/****************************************************************************************************************************/

