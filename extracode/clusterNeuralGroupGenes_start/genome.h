#ifndef GENOME_H
#define GENOME_H

#define DesignerGenes 0

#if DesignerGenes
	#define DesignerGenesOnly 1
#endif

// System
#include <iostream>

// Local
#include "graybin.h"

extern float OneOver255;

//===========================================================================
// genome
//===========================================================================
class genome
{

public:
	static void genomeinit();
	static void genomedestruct();
    static void PrintGeneIndexes( FILE* f );

    genome();    
    ~genome();
    
    void Init(bool randomized = false);
	void Dump(std::ostream& out);
	void Load(std::istream& in);
	void SeedGenes();
    void Randomize();
    void Randomize(float bitonprob);
    void Mutate();
    void Crossover(genome* g1, genome* g2, bool mutate);
    void CopyGenes(genome* sgenome);
    float CalcSeparation(genome* g);
    float MateProbability(genome* g);
    
	// The following four blocks of methods index into the genome
	// and calculate the value of each of the individual genes
	
	// This first block of genes is the "physiological" genes
    float MutationRate();
    long CrossoverPoints();
    long Lifespan();
    float ID();
    float Strength();
    float Size(float minSize, float maxSize);
    float MaxSpeed();
    float MateEnergy();
	
	// The following three blocks of methods correspond to
	// the genes that control the neural architecture
	
	// One gene says how many neural groups there are
    short NumNeuronGroups();
	
	// These genes are a function of group index, and specify how many
	// excitatory and inhibitory neurons there are in each neural group
	// (numneurons() is just the sum of numeneur() and numineur())
    short numeneur(short i);
    short numineur(short i);
    short numneurons(short i);
    float Bias(short i);
    float BiasLearningRate(short i);
    
	// These genes are a function of the from-group index (j) and the to-group index (i)
	// The short ee*, ei*, ii*, and ie* methods return the actual gene values
	// The num* methods combine those gene values with neuron counts in the corresponding
	// groups to calculate actual numbers of connections
	float eecd(short i, short j);
    float eicd(short i, short j);
    float iicd(short i, short j);
    float iecd(short i, short j);
    float eetd(short i, short j);
    float eitd(short i, short j);
    float iitd(short i, short j);
    float ietd(short i, short j);
    float eelr(short i, short j);
    float eilr(short i, short j);
    float iilr(short i, short j);
    float ielr(short i, short j);
    long numeesynapses(short i, short j);
    long numeisynapses(short i, short j);
    long numiisynapses(short i, short j);
    long numiesynapses(short i, short j);
    long numsynapses(short i, short j);
	
	void Print();
    void Print(long lobit, long hibit);
    void SetOne(long lobit, long hibit);
    void SetOne();
    void SetZero(long lobit, long hibit);
    void SetZero();
    double GeneValue( long byte );
	unsigned int GeneUIntValue( long byte );
    
    // External globals
    static long gNumBytes;
    static float gMinStrength;
    static float gMaxStrength;
	static float gMinMutationRate;
//	static float genome::gMaxMutationRate;
	static float gMaxMutationRate;
	static long gMinNumCpts;
	static long gMaxNumCpts;
	static long gMinLifeSpan;
	static long gMaxLifeSpan;
	static float gMiscBias;
	static float gMiscInvisSlope;
	static float gMinBitProb;
	static float gMaxBitProb;
	static bool gGrayCoding;	
	static short gMinvispixels;
	static short gMaxvispixels;
	static float gMinmateenergy;
	static float gMaxmateenergy;
	static float gMinmaxspeed;
	static float gMaxmaxspeed;
	static float gMinlrate;
	static float gMaxlrate;

protected:    
    static bool classinited;
    static long numphysbytes;
    static long mrategene;
    static long ncptsgene;
    static long lifespangene;
    static long idgene;
    static long strengthgene;
    static long sizegene;
    static long maxspeedgene;
    static long mateenergygene;
    static long numrneurgene;
    static long numgneurgene;
    static long numbneurgene;
    static long numneurgroupsgene;
    static long numeneurgene;
    static long numineurgene;
    static long biasgene;
    static long biaslrategene;
    static long eecdgene;
    static long eicdgene;
    static long iicdgene;
    static long iecdgene;
    static long eelrgene;
    static long eilrgene;
    static long iilrgene;
    static long ielrgene;
    static long eetdgene;
    static long eitdgene;
    static long iitdgene;
    static long ietdgene;
    static long* gCrossoverPoints;
    
    unsigned char* fGenes;
};


//---------------------------------------------------------------------------
// genome::GeneValue
//
// use of GeneValue(byte) permits use of simple binary encoding
// or Gray coding.
//---------------------------------------------------------------------------
inline double genome::GeneValue(long byte)
{
#if DesignerGenes
	return( float(fGenes[byte]) * OneOver255 );
#else
	if (gGrayCoding)
		return( float(binofgray[fGenes[byte]]) * OneOver255 );
	else
		return( float(fGenes[byte]) * OneOver255 );
#endif
}

//---------------------------------------------------------------------------
// genome::GeneUIntValue
//
// use of GeneIntValue(byte) permits use of simple binary encoding
// or Gray coding.
//---------------------------------------------------------------------------
inline unsigned int genome::GeneUIntValue(long byte)
{
#if DesignerGenes
	return( (unsigned int) fGenes[byte] );
#else
	if (gGrayCoding)
		return( (unsigned int) binofgray[fGenes[byte]] );
	else
		return( (unsigned int) fGenes[byte] );
#endif
}


#endif

