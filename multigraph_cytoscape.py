
import aiohttp
import asyncio
import igraph
import requests # maybe use aio for europepmc too? but not multiple pages so maybe not neccessary? 
import py4cytoscape as p4c
import pandas as pd
import os
from tqdm import tqdm
import pickle
import numpy as np



def europepmc(article_id, format='JSON', source='MED', page=1, page_size=25): 
    """ 
    Download pmids for the articles citing article_id, return list of citation pmids

    OBS: to make more efficient we can just call output="idlist" immidiately? then we have no metadata but we dont use that anyways!
    
    """ 
    base_url = f'https://www.ebi.ac.uk/europepmc/webservices/rest/{source}/{article_id}/citations?page={page}&pageSize={page_size}&format={format}'
    result = requests.get(base_url)

    if result.ok:
        return result.json()['citationList']['citation']
    else:
        print('Something went wrong')


pmids=[]
topics= ['topic_3345', 'topic_0121', 'topic_0654', 'topic_3172'] # make it ints just because it feels better, or at least drop the topic_
testSize =300 # e
topic_specific_pmids = []

for topic in topics: 

    with open(f'included_tools_{topic}.pkl', 'rb') as f:
                    np.random.seed(42)
                    topic_pmids = list(np.random.choice(pickle.load(f), testSize)) # pickle load tools is list, right? 
                    topic_specific_pmids.append(topic_pmids)
                    pmids = pmids + topic_pmids



print("Downloading citation data from Europepmc.")

pmids=list(pmids)
edges = []


if os.path.isfile(f'edges_multitopic{testSize}.pkl') and os.path.isfile(f'graph_multitopic{testSize}.pkl') and os.path.isfile(f'included_tools_multitopic{testSize}.pkl'): # should give option to specify these names
            print("Loading data")
            with open(f'edges_multitopic{testSize}.pkl', 'rb') as f:
                edges = pickle.load(f)
            with open(f'graph_multitopic{testSize}.pkl', 'rb') as f:
                G = pickle.load(f) 
            with open(f'included_tools_multitopic{testSize}.pkl', 'rb') as f:
                included_tools = pickle.load(f) 
else:
    included_tools = [] # this is to create a list of the tools that actually had citations, otherwise they are not included in the graph. 
    for pmid in tqdm(pmids, desc="Processing PMIDs"): # tqdm for progress
        pmid = str(pmid) # moved from doing this in te beginning on full list because more efficient, but maybe this just makes it less understandable 

        citations = europepmc(pmid, page_size=1000)
        for citation in citations:
            edges.append((pmid, str(citation['id']))) # make sure evrything is strings
            if pmid not in included_tools:
                included_tools.append(pmid) # this is so inefficient goddamn, please update


    G = igraph.Graph.TupleList(edges, directed=True)

    with open(f'edges_multitopic{testSize}.pkl', 'wb') as f:
        pickle.dump(edges, f)
    with open(f'included_tools_multitopic{testSize}.pkl', 'wb') as f:
        pickle.dump(included_tools, f)
    with open(f'graph_multitopic{testSize}.pkl', 'wb') as f:
        pickle.dump(G, f)


p4c.create_network_from_igraph(G, f"multitopic_citation_graph_{testSize}", collection="multitopic_graphs")


p4c.set_node_shape_default("ELLIPSE")
p4c.set_node_width_default(30)
p4c.set_node_height_default(30)
p4c.set_node_border_color_default("#000000")  # Black color in hexadecimal
p4c.set_node_border_width_default(1)
p4c.set_node_color_bypass(included_tools, "#FF0000")  # Red color in hexadecimal
p4c.set_node_size_bypass(included_tools, 100)  


#now colouring by topic, 
colours = ["#FF0000", "#00FF00", "#0000FF", "#FFFF00"]
included_topic_pmids=[]
for topic_list in topic_specific_pmids:
    included_ids = []
    for pmid in topic_list:
        if pmid in included_tools:
            included_ids.append(pmid)
        else: 
             continue
    #print(topic_list, included_ids)
    included_topic_pmids.append(list(np.unique(topic_list)))



with open(f'included_topic_tools_multitopic{testSize}.pkl', 'wb') as f:
        pickle.dump(included_topic_pmids, f)




print(type(included_tools), type(included_topic_pmids[0]))
for i in range(len(colours)):
    p4c.set_node_color_bypass(included_topic_pmids[i], colours[i])  # Red color in hexadecimal
   

          

