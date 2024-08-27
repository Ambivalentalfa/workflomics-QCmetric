# WorkflowNo_1576
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1576
doc: A workflow including the tool(s) PIA - Protein Inference Algorithms, Percolator, Multi-Q, CrosstalkDB, CrosstalkDB.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
  input_2:
    type: File
    format: "http://edamontology.org/format_3313" # BLC
  input_3:
    type: File
    format: "http://edamontology.org/format_3702" # MSF
steps:
  PIA - Protein Inference Algorithms_01:
    run: add-path-to-the-implementation/PIA - Protein Inference Algorithms.cwl 
    in:
      PIA - Protein Inference Algorithms_in_1: input_3
    out: [PIA - Protein Inference Algorithms_out_1, PIA - Protein Inference Algorithms_out_2]
  Percolator_02:
    run: add-path-to-the-implementation/Percolator.cwl 
    in:
      Percolator_in_1: PIA - Protein Inference Algorithms_01/PIA - Protein Inference Algorithms_out_1
    out: [Percolator_out_1]
  Multi-Q_03:
    run: add-path-to-the-implementation/Multi-Q.cwl 
    in:
      Multi-Q_in_1: input_1
      Multi-Q_in_2: Percolator_02/Percolator_out_1
    out: [Multi-Q_out_1]
  CrosstalkDB_04:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: Multi-Q_03/Multi-Q_out_1
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
  CrosstalkDB_05:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: CrosstalkDB_04/CrosstalkDB_out_3
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3604" # SVG
    outputSource: CrosstalkDB_05/CrosstalkDB_out_1