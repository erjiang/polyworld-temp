import numpy as np
import networkx as nx
import networkx_extensions as nxe
import algorithms as a

print '------------'

# wp = [[0.0, 0.00001, 0.00001],
# 	  [0.00001, 0.0, 0.00001],
# 	  [0.00001, 0.00001, 0.0]]

wp = [[0.0, 0.00001, 0.00001, 0.00001],
	  [0.00001, 0.0, 0.00001, 0.00001],
	  [0.00001, 0.00001, 0.0, 0.00001],
	  [0.00001, 0.00001, 0.00001, 0.0]]

mp = a.w_to_d(wp)
	  
mn = np.matrix(mp)
print mn

g = nx.from_numpy_matrix(mn, nx.DiGraph())

cpl_bd = nxe.characteristic_path_length(g, weighted=False)
npl_bd = nxe.normalized_path_length(g, weighted=False)
cl_bd = nxe.connectivity_length(g, weighted=False)
cpl_wd = nxe.characteristic_path_length(g, weighted=True)
npl_wd = nxe.normalized_path_length(g, weighted=True)
cl_wd = nxe.connectivity_length(g, weighted=True)

print 'cpl bd, wd = %6.4f, %6.4f' % (cpl_bd, cpl_wd)
print 'npl bd, wd = %6.4f, %6.4f' % (npl_bd, npl_wd)
print 'cl  bd, wd = %6.4f, %6.4f' % ( cl_bd,  cl_wd)