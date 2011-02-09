import os.path
from brain import BrainAnatomy, BrainFunction
from genome import Genome
from numpy import sum

class Agent:
    ''' Represents a single Polyworld agent, loading in lifespan, lineage,
    neural anatomy, function, genome, and movement. Lazily loads the larger
    files. Differs from version 1 of this file in that the __init__ function no
    longer takes arguments for the specific filenames, but rather a run
    directory and an agent ID, building the filepaths on the fly.'''

    def __init__(self, id, run_dir='../run/'):
        self.id = id

        # Construct file paths:
        self.run_dir = run_dir
        self.genome_filename = "%s/genome/genome_%d.txt" % (run_dir, id)
        self.anat_filename = "%s/brain/anatomy/brainAnatomy_%d_incept.txt"\
                                % (run_dir, id)
        self.func_filename = "%s/brain/function/brainFunction_%d.txt"\
                                % (run_dir, id)
        if not os.path.isfile(self.func_filename):
            self.func_filename = os.path.join(run_dir + "/brain/function/",\
                                    "incomplete_brainFunction_%d.txt" % id)


        # Validate file paths:
        assert os.path.isfile(self.func_filename),\
                "Invalid brain function file: %s" % self.func_filename
        assert os.path.isfile(self.anat_filename),\
                "Invalid brain anatomy file: %s" % self.anat_filename
#        assert os.path.isfile(self.genome_filename),\
#                "Invalid genome file: %s" % self.genome_filename

        # Load anatomy and functionality
        self.anat = BrainAnatomy(self.anat_filename)
        self.func = BrainFunction(self.func_filename)

        #initialize lifespan
        self.birth = self.func.timestep_born
        self.lifespan = self.func.timesteps_lived
        self.death = self.lifespan + self.birth


        # Load Genome
#        self.genome = Genome(self.genome_filename)

    def __repr__(self):
        return "<Agent %d (%d-%d: %d steps)>"\
                % (self.id, self.birth, self.death, self.lifespan)

    def alive_at_timestep(self, step):
        return self.birth <= step <= self.death
    
    def context_network( self, behavior_node, numsteps ):
        '''returns all nodes within numsteps of a given behavior node'''

        assert behavior_node in self.func.neurons['behavior'],\
                "passed node wasn't in behavior nodes!"

        context_nodes = self.anat.trace_back( behavior_node, numsteps )
        print "CN nodes=%s" % context_nodes
        
        context_network = []
        for n in context_nodes:
            this_cn = [ (i,n) for i in context_nodes 
                                    if self.anat.cxnmatrix[n][i] ]
#            print "Found connections", this_cn 
            context_network.extend( this_cn )

        # return all of the unique pairs of the context_network
        return sorted(list(set(context_network)))
    
    def reference_time( self, behavior_node, window_size, start_at ):
        '''returns the time start_at <= t <= numsteps lived that begins the most
        active time of length window_size breaking ties by going to the end. '''
        
        assert window_size >= 1, "window size must be >= 1"
        assert start_at >= 20,\
            "You want start_at to be at least 20 for decent sampling"
        assert behavior_node in self.func.neurons['behavior'],\
            "behavior_node wasn't in the behvior nodes!"
        
        if start_at + window_size > self.lifespan:
            return None
        
#        print self.func.acts.shape
#        print self.func.acts[behavior_node,:]
#        print len(self.func.acts[behavior_node,:])
#        raw_input('...')
        
        sum_acts = {}
        for t in range( start_at, self.func.timesteps_lived - window_size ):
            this_window = self.func.acts[behavior_node,t:t+window_size]
            sum_acts[t] = sum(this_window)
        
#        print "sum_acts=%s" % sum_acts
        
        # which t's had the largest sum_acts ?
        most_active = max( sum_acts.values() )
        most_active_times = [ int(key) for key, value in sum_acts.iteritems()
                                                      if value == most_active ]
        
        # return the latest most_active_time
        return max( most_active_times )






#################################
### Population building tools ###
#################################
def _file_len(fname):
    with open(fname) as f:
        for i, l in enumerate(f):
            pass
    return i + 1

def get_population(start=1, stop=None, run_dir='../run/'):
    if not stop:
        stop = _file_len(os.path.join(run_dir, 'lifespans.txt'))-15
    assert start <= stop, "stop must be greater than the start"
    print start, stop
        
    return [Agent(i) for i in xrange(start,stop)]


