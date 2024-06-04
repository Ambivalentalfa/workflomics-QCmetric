# WorkflowNo_1632
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1632
doc: A workflow including the tool(s) CrosstalkDB, PIA - Protein Inference Algorithms, mspire_mspire-sequest, Percolator, OpenMS.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3702" # MSF
  input_2:
    type: File
    format: "http://edamontology.org/format_3752" # CSV
  input_3:
    type: File
    format: "http://edamontology.org/format_3652" # dta
steps:
  CrosstalkDB_01:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: input_2
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
  PIA - Protein Inference Algorithms_02:
    run: add-path-to-the-implementation/PIA - Protein Inference Algorithms.cwl 
    in:
      PIA - Protein Inference Algorithms_in_1: input_1
    out: [PIA - Protein Inference Algorithms_out_1, PIA - Protein Inference Algorithms_out_2]
  mspire_mspire-sequest_03:
    run: add-path-to-the-implementation/mspire_mspire-sequest.cwl 
    in:
      mspire_mspire-sequest_in_1: CrosstalkDB_01/CrosstalkDB_out_4
    out: [mspire_mspire-sequest_out_1]
  Percolator_04:
    run: add-path-to-the-implementation/Percolator.cwl 
    in:
      Percolator_in_1: PIA - Protein Inference Algorithms_02/PIA - Protein Inference Algorithms_out_1
    out: [Percolator_out_1]
  OpenMS_05:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: mspire_mspire-sequest_03/mspire_mspire-sequest_out_1
      OpenMS_in_2: input_3
      OpenMS_in_3: Percolator_04/Percolator_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
    outputSource: OpenMS_05/OpenMS_out_1
