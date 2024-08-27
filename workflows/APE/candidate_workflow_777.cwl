# WorkflowNo_776
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_776
doc: A workflow including the tool(s) InDigestion, MeroX, MR-MSPOLYGRAPH, MassWiz, PEAKS Q.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input_2:
    type: File
    format: "http://edamontology.org/format_3244" # mzML
  input_3:
    type: File
    format: "http://edamontology.org/format_1198" # mf
steps:
  InDigestion_01:
    run: add-path-to-the-implementation/InDigestion.cwl 
    in:
      InDigestion_in_1: input_3
    out: [InDigestion_out_1, InDigestion_out_2, InDigestion_out_3]
  MeroX_02:
    run: add-path-to-the-implementation/MeroX.cwl 
    in:
      MeroX_in_1: input_2
      MeroX_in_2: input_1
    out: [MeroX_out_1]
  MR-MSPOLYGRAPH_03:
    run: add-path-to-the-implementation/MR-MSPOLYGRAPH.cwl 
    in:
      MR-MSPOLYGRAPH_in_1: MeroX_02/MeroX_out_1
      MR-MSPOLYGRAPH_in_2: InDigestion_01/InDigestion_out_3
    out: [MR-MSPOLYGRAPH_out_1, MR-MSPOLYGRAPH_out_2]
  MassWiz_04:
    run: add-path-to-the-implementation/MassWiz.cwl 
    in:
      MassWiz_in_1: MR-MSPOLYGRAPH_03/MR-MSPOLYGRAPH_out_2
    out: [MassWiz_out_1]
  PEAKS Q_05:
    run: add-path-to-the-implementation/PEAKS Q.cwl 
    in:
      PEAKS Q_in_1: MassWiz_04/MassWiz_out_1
    out: [PEAKS Q_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_2311" # EMBL-HTML
    outputSource: PEAKS Q_05/PEAKS Q_out_1