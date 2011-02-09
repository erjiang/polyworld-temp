#! /usr/bin/python

# NOTE:  This functionality has been incorporated into rename_metrics.py,
# so this file is no longer needed, and has not been checked into cvs.
# It was needed only because I failed to update the names of the metric
# tables embedded in the metric_* files when I renamed those files.
# Having been used on all relevant datasets, this script is no longer of
# value, except as a reference.

# rename_metrics_tables
# Renames the following metrics inside the metric_*.plt files for one or more Polyworld "run" directories:
#	brain
#	   Recent
#		  0 ... #
#			 metric_*.*

import os
import sys
import getopt
from os.path import join
import glob
import datalib

DEFAULT_DIRECTORY = ''

FILES_TO_RENAME = ['metric_*.plt']
METRICS_TO_RENAME = {'CC':'cc_a_bu', 'SP':'nsp_a_bu', 'CP':'cpl_a_bu', 'NM_wd':'nm_a_wd',
					 'SW':'swi_nsp_a_bu', 'SC':'swi_cpl_a_bu', 'HF':'hf'}


test = False


def usage():
	print 'Usage:  rename_metrics.py [-t] <directory>'
	print '  <directory> may be a run directory or a collection of run directories'
	print '  -t will print out the files that would have been affected, but nothing will be changed'


def parse_args():
	global test
	
	try:
		opts, args = getopt.getopt(sys.argv[1:], 't', ['test'] )
	except getopt.GetoptError, err:
		print str(err) # will print something like "option -a not recognized"
		usage()
		exit(2)

	if len(args) == 1:
		directory = args[0].rstrip('/')
	elif len(args) > 1:
		print "Error: too many arguments"
		usage()
		exit(2)
	elif DEFAULT_DIRECTORY:
		directory = DEFAULT_DIRECTORY
	else:
		usage()
		exit(0)
	
	for o, a in opts:
		if o in ('-t', '--test'):
			test = True
		else:
			print 'Unknown option:', o
			usage()
			exit(2)
	
	return directory


def rename_metrics_in_file(file, metric):
	global test
	tables = datalib.parse(file)
	if len(tables) > 1:
		print 'Error: more than one table found in', file, '; exiting'
		exit(1)
	for table in tables.values():
		if test:
			print 'renaming', table.name, 'to', metric, 'in', file
		else:
			table.name = metric
			datalib.write(file, tables)


def rename_metric_file(file):
	global test
	root, name = os.path.split(file)  # get just the filename from the full path
	name = name[:-4]  # remove .plt
	if 'random' in file:
		append = '_random'
		name = name[:-7]  # remove _Random
	else:
		append = ''
	metric = name[7:]  # get just the metric type
	if metric in METRICS_TO_RENAME.values():
		rename_metrics_in_file(file, metric)
	else:
		print '  unknown metric:', metric


def rename_metrics_in_dir(directory):
	print 'renaming metrics in', directory
	recent_dir = join(join(directory, 'brain'), 'Recent')

	# Rename the metric_* files in the epochs (and the metrics therein)
	for root, dirs, files in os.walk(recent_dir):
		break
	for dir in dirs:
		time_dir = join(recent_dir, dir)
		files_to_rename = []
		for expression in FILES_TO_RENAME:
			files_to_rename += glob.glob(join(time_dir, expression))
		for file in files_to_rename:
			rename_metric_file(file)


def main():
	directory = parse_args()
	
	for root, dirs, files in os.walk(directory):
		break
	
	if 'worldfile' not in files and len(dirs) < 1:
		print 'No worldfile and no directories, so nothing to do'
		usage()
		exit(1)
	
	if 'worldfile' in files:
		# this is a single run directory,
		# so just rename the files therein
		rename_metrics_in_dir(directory)
	else:
		# this is a directory of run directories,
		# so recreate the run directories inside it,
		# and copy the desired pieces into each new run directory
		for run_dir in dirs:
			rename_metrics_in_dir(join(directory, run_dir))


main()
