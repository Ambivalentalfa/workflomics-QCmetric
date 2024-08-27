# WorkflowNo_266
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_266
doc: A workflow including the tool(s) mzStar, DeconMSn, MassAI, MyriMatch, Multi-Q.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3710" # WIFF format
  input_2:
    type: File
    format: "http://edamontology.org/format_3710" # WIFF format
  input_3:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
steps:
  mzStar_01:
    run: add-path-to-the-implementation/mzStar.cwl 
    in:
      mzStar_in_1: input_2
    out: [mzStar_out_1]
  DeconMSn_02:
    run: add-path-to-the-implementation/DeconMSn.cwl 
    in:
      DeconMSn_in_1: input_3
      DeconMSn_in_2: mzStar_01/mzStar_out_1
    out: [DeconMSn_out_1, DeconMSn_out_2, DeconMSn_out_3]
  MassAI_03:
    run: add-path-to-the-implementation/MassAI.cwl 
    in:
      MassAI_in_1: DeconMSn_02/DeconMSn_out_3
    out: [MassAI_out_1, MassAI_out_2]
  MyriMatch_04:
    run: add-path-to-the-implementation/MyriMatch.cwl 
    in:
      MyriMatch_in_1: input_1
      MyriMatch_in_2: MassAI_03/MassAI_out_2
    out: [MyriMatch_out_1]
  Multi-Q_05:
    run: add-path-to-the-implementation/Multi-Q.cwl 
    in:
      Multi-Q_in_1: input_3
      Multi-Q_in_2: MyriMatch_04/MyriMatch_out_1
    out: [Multi-Q_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3311" # RNAML
    outputSource: Multi-Q_05/Multi-Q_out_1