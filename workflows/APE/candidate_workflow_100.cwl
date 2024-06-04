# WorkflowNo_77
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_77
doc: A workflow including the tool(s) CPM, esimsa2D, CPM, ComPIL, isobar.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3651" # MGF
  input_2:
    type: File
    format: "http://edamontology.org/format_1737" # CiteXplore-all
  input_3:
    type: File
    format: "http://edamontology.org/format_1316" # est2genome format
steps:
  CPM_01:
    run: add-path-to-the-implementation/CPM.cwl 
    in:
      CPM_in_1: input_2
      CPM_in_2: input_2
    out: [CPM_out_1, CPM_out_2]
  esimsa2D_02:
    run: add-path-to-the-implementation/esimsa2D.cwl 
    in:
      esimsa2D_in_1: input_3
      esimsa2D_in_2: input_2
      esimsa2D_in_3: CPM_01/CPM_out_1
    out: [esimsa2D_out_1, esimsa2D_out_2, esimsa2D_out_3]
  CPM_03:
    run: add-path-to-the-implementation/CPM.cwl 
    in:
      CPM_in_1: esimsa2D_02/esimsa2D_out_2
      CPM_in_2: input_2
    out: [CPM_out_1, CPM_out_2]
  ComPIL_04:
    run: add-path-to-the-implementation/ComPIL.cwl 
    in:
      ComPIL_in_1: CPM_03/CPM_out_1
    out: [ComPIL_out_1]
  isobar_05:
    run: add-path-to-the-implementation/isobar.cwl 
    in:
      isobar_in_1: input_1
      isobar_in_2: ComPIL_04/ComPIL_out_1
    out: [isobar_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3508" # PDF
    outputSource: isobar_05/isobar_out_1
