import common_metric as cm
import common_functions as cf
import algorithms as a
ga, gp, h = cm.read_anatomy('../results/run_b2_driven_0/brain/anatomy/brainAnatomy_10000_death.txt')
gabd = a.wd_to_bd(ga)
cf.print_matrix(gabd, '%g')
