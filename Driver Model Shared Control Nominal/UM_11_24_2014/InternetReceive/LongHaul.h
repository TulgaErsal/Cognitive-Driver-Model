/**********************************************************
* Tulga Ersal (tersal@umich.edu)
* University of Michigan
* 21 Aug 2020
**********************************************************/

/* LongHaul.h , Version 2.0 */

/* This header file defines the interface control document between
* Client and Server for the long-haul integration.
* For data transferred, SI units should be used.
*/

#ifndef _LONG_HAUL_H_
#define _LONG_HAUL_H_

#define LONG_HAUL_ICD_VERSION	"2.1"

#define numberOfCouplingVariablesFromServer 1
#define numberOfCouplingVariablesFromClient 68

// From Client to Server
#pragma pack(push,1)
typedef struct
{ // Header information

  // Coupling Signals
  // double couplingVariablesFromClient[numberOfCouplingVariablesFromClient];
  double couplingVariablesFromClient[numberOfCouplingVariablesFromClient];
} ToServer ;
#pragma pack(pop)

// From Server to Client
#pragma pack(push,1)
typedef struct
{ // Header information
  char icdVersion[8] ;		// Should be set to LONG_HAUL_ICD_VERSION and checked at local site.
  int  packetNumber ;   	// Copied from ToServer packet.
  LARGE_INTEGER sendTimeStamp ;	// Set by Remote, value from QueryPerformanceCounter()
  LARGE_INTEGER echoTimeStamp ;	// Value copied directly from ToServer.sendTimeStamp.

  // Coupling Signals
  float couplingVariablesFromServer[numberOfCouplingVariablesFromServer];

  // Information signals
  float sendSimTime ;		// Simulation time that the sample was sent. [sec]

} ToClient ;
#pragma pack(pop)

#endif
