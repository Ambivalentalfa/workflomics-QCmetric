# WorkflowNo_163
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_163
doc: A workflow including the tool(s) msmsEDA, Graph Extract, GenePattern, Percolator, OpenMS.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input_2:
    type: File
    format: "http://edamontology.org/format_3650" # netCDF
  input_3:
    type: File
    format: "http://edamontology.org/format_3764" # idXML
steps:
  msmsEDA_01:
    run: add-path-to-the-implementation/msmsEDA.cwl 
    in:
      msmsEDA_in_1: input_2
    out: [msmsEDA_out_1, msmsEDA_out_2, msmsEDA_out_3]
  Graph Extract_02:
    run: add-path-to-the-implementation/Graph Extract.cwl 
    in:
      Graph Extract_in_1: msmsEDA_01/msmsEDA_out_3
    out: [Graph Extract_out_1]
  GenePattern_03:
    run: add-path-to-the-implementation/GenePattern.cwl 
    in:
      GenePattern_in_1: Graph Extract_02/Graph Extract_out_1
    out: [GenePattern_out_1]
  Percolator_04:
    run: add-path-to-the-implementation/Percolator.cwl 
    in:
      Percolator_in_1: input_3
    out: [Percolator_out_1]
  OpenMS_05:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: GenePattern_03/GenePattern_out_1
      OpenMS_in_2: input_1
      OpenMS_in_3: Percolator_04/Percolator_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3651" # MGF
    outputSource: OpenMS_05/OpenMS_out_1