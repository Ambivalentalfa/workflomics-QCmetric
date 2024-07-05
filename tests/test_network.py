import igraph
import numpy as np
import json
import os
import asyncio
import shutil
### Creating a test network to confirm the functions are working ###
import igraph
from wfqc import network as nw

# Define the nodes 
tools = ['TA', 'TB', 'TC', 'TD', # connected cluster - included in final graph 
        # Separate cluster - included in final graph 
         'TE', 'TF',
        # Single disconnected cited - not included in final graph 
         'TG', 
        # Single disconnected not cited - not included in final graph 
         'TH']

citations = ['CA', 'CB', 'CC', 'CD', 'CE', 'CF', 'CG', 'CH', 'CI', 'CJ', 'CK', 'CL', 'CM', 'CN', 'CO', 'CP', 'CQ']


edges = [

    # Single citations of tools
    ('CA', 'TA'), ('CB', 'TB'), ('CC', 'TC'), ('CD', 'TD'), 
    ('CE', 'TE'), ('CF', 'TF'), ('CG', 'TG'),

    # Citations to multiple tools
    ('CJ', 'TA'), ('CJ', 'TB'),  
    ('CK', 'TA'), ('CK', 'TB'), ('CK', 'TC'),
    ('CL', 'TA'), ('CL', 'TB'), ('CL', 'TC'), ('CL', 'TD'), 
    
    # Duplicate edges
    ('CP', 'TE'), ('CP', 'TE'),

    # Tools citing each other
    ('TB', 'TC'), 

    # Tools citing themselves
    ('TA', 'TA'),

    # Disconnected cluster
    ('CQ', 'TE'), ('CQ', 'TF'), ('CO', 'TE'),
    ('CO', 'TF') 
]

nodes_in_final_network = ['TA', 'TB', 'TC', 'TD', 'TE', 'TF', 'CJ', 'CK', 'CL', 'CO', 'CQ' ]
tools_in_final_network = ['TA', 'TB', 'TC', 'TD', 'TE', 'TF']


Graph = igraph.Graph.TupleList(edges, directed=True)


#### TESTING ###

# TODO: test on  fake data also or instead

def test_testsize_citation_network(): 
    G = nw.create_citation_network(loadData=False, testSize=10) 
    assert len(G.vs['name']) > 0 

def test_load_citation_network(shared_datadir):
    inpath = os.path.join(shared_datadir, "out")
    G = nw.create_citation_network(loadData=True, inpath = inpath) 
    assert len(G.vs['name']) > 0 


def test_cocitation_graph():
    incuded_tools = [tool for tool in Graph.vs['name'] if tool in tools] #could do interrsection    
    G = nw.cocitation_graph(Graph,incuded_tools)
    assert sorted(tools_in_final_network) == sorted(G.vs['name'])

def test_create_graph():
    G, included_tools, node_degree_dict = nw.create_graph(edges, tools, includeCitationNodes=True)
    print(np.sort(nodes_in_final_network), np.sort(G.vs['name']))
    assert sorted(nodes_in_final_network) == sorted(G.vs['name'])


# need to merge with metrics to test download data
# def test_download_data():



