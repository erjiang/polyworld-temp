'''
Tests the agent classes.

Usage:
python test.py <GENE_ID>
'''
from agent  import Agent
from agent.genome import *
import sys
a=[Agent(x,'/pwd/b2_driven_vs_passive/run_b2_driven_0') for x in xrange(300,350)]
#gene = int(sys.argv[-1])
#print get_label(gene)
#print [b.genome[gene] for b in a]
#print gene_entropy(gene, [b.genome for b in a])

print [b.anat.num_neurons for b in a]
