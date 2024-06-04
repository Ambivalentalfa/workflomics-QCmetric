from cwl_utils.parser import load_document_by_uri, save # for workflow parsing 
from ruamel import yaml

# General packages
import pandas as pd         
import os
from tqdm import tqdm       
import pickle
import numpy as np
from datetime import datetime, timedelta
import glob
import sys
import matplotlib.pyplot as plt
import json

def parse_workflows(cwl_file,cvsfile):
    # Import CWL Object
    cwl_obj = load_document_by_uri(cwl_file)

    # Extract edges from CWL object
    edges = []
    for step in cwl_obj.steps:
        step_id = step.id.split("#")[-1]
        for input_param in step.in_:
            if input_param.source:
                source_step_id = input_param.source.split('/')[-1].split("#")[-1]
                edges.append((source_step_id, step_id))
        for output_param in step.out:
            edges.append((step_id, output_param.split("/")[-1]))

    # Extract pairwise connections between tools
    pairwise_connections = set()
    for source, target in edges:
        if "_out_" in source:
            tool_id = target.split("_")[0]
            for next_target, next_source in edges:
                if next_source == source:
                    pairwise_connections.add((tool_id, next_target.split("_")[0]))

    # Read CSV file containing tool information
    csv_filename = cvsfile 
    f = pd.read_csv(csv_filename)

    # Retrieve PMID values for pairwise connections, this should be bio.tools ids instead? 
    new_edges = []
    for edge in pairwise_connections:
        source_pmid = f.loc[f['name'] == edge[0], 'pmid'].values[0] if len(f.loc[f['name'] == edge[0], 'pmid']) > 0 else None # neme in small letters too? 
        target_pmid = f.loc[f['name'] == edge[1], 'pmid'].values[0] if len(f.loc[f['name'] == edge[1], 'pmid']) > 0 else None
        if source_pmid is not None and target_pmid is not None:
            new_edges.append((str(source_pmid), str(target_pmid)))

    # Print new edges
    workflow_tools = np.unique([element for tuple in new_edges for element in tuple])

    return new_edges, list(workflow_tools)

    # # Construct graphs
    # G1 = igraph.Graph.TupleList(edges, directed=True)
    # G2 = igraph.Graph.TupleList([(target, source) for source, target in edges], directed=True) # rotated
    # G3 = igraph.Graph.TupleList(pairwise_connections, directed=True)
    # G4 = igraph.Graph.TupleList(new_edges, directed=True)

# TODO: download workflows

# TODO: improve randomisation to have sequential networks

# number of edges in the workflow

def radnomise_workflows(included_tools, num_pairs = 3):
    workflow_pairs = []
    while len(workflow_pairs) < num_pairs:
        article1 = np.random.choice(included_tools)
        article2 = np.random.choice(included_tools)
        if article1 != article2:  # Ensure article1 and article2 are different
            workflow_pairs.append((article1, article2))

    workflow_tools = np.unique([element for tuple in workflow_pairs for element in tuple])
    return workflow_pairs, workflow_tools
    # print( "Tools in pseudo WF:", workflow_tools)
    # # Print the generated pairs
    # print("Generated workflow pairs (WF edges):")
    # for pair in workflow_pairs:
    #     print(pair)




def load_undoc_tool(cwl_file):
    with open(cwl_file, "r") as f:
        cwl_string = f.read()
    steps_string = cwl_string.split("steps:\n")[1].split("outputs")[0]
    steps_list = steps_string.split('\n')
    steps_list  = [row for row in steps_list if not row.startswith('    ')]
    edge_list = []

    for i in range(len(steps_list)):
        if i+1 > len(steps_list)-1:
            continue
        
        if steps_list[i+1] != "":
            step_string = cwl_string.split(steps_list[i])[1].split(steps_list[i+1])[0]
        else:
            step_string = cwl_string.split(steps_list[i])[1].split("outputs:")[0]
        step_in_out = step_string.split("in:\n")[1].split("out:")

        step_in = step_in_out[0].split('\n')
        step_in = [s.split(':')[1].strip() for s in step_in if ':' in s]

        step_out = step_in_out[1].replace('[', '').replace(']', '').replace('\n', '').split(',')
        step_out = [s.strip() for s in step_out]
        
        for si in step_in:
            if "/" in si:
                si = si.split('/')[1]
            edge = (si, steps_list[i].split('_')[0])
            edge_list.append(edge)
        for so in step_out:
            
            edge = (steps_list[i].split('_')[0], so)
            edge_list.append(edge)
    
    return edge_list

def extract_tool_connections(edges):
    pairwise_connections = set()
    for source, target in edges:
        if "_out_" in target:
            for next_source, next_target in edges:
                if next_source == target:
                    pairwise_connections.add((source.lstrip(), next_target.lstrip()))
    return pairwise_connections


def parse_undocumented_workflows(cwl_file, cvsfile, undocumented=True):
    
    edges = load_undoc_tool(cwl_file)
    
    tool_edges = extract_tool_connections(edges)

    csv_filename = cvsfile 
    f = pd.read_csv(csv_filename)

    new_edges = []
    for edge in tool_edges:
        source_pmid = f.loc[f['name'] == edge[0], 'pmid'].values[0] if len(f.loc[f['name'] == edge[0], 'pmid']) > 0 else None
        target_pmid = f.loc[f['name'] == edge[1], 'pmid'].values[0] if len(f.loc[f['name'] == edge[1], 'pmid']) > 0 else None
        if source_pmid is not None and target_pmid is not None:
            new_edges.append((str(source_pmid), str(target_pmid)))

    workflow_tools = np.unique([element for tuple in new_edges for element in tuple])

    return new_edges, list(workflow_tools)

