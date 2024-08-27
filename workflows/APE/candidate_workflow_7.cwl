# WorkflowNo_6
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_6
doc: A workflow including the tool(s) MyriMatch, OpenMS, protk, DeconMSn, PeptideShaker.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input_2:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
  input_3:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
steps:
  MyriMatch_01:
    run: add-path-to-the-implementation/MyriMatch.cwl 
    in:
      MyriMatch_in_1: input_2
      MyriMatch_in_2: input_3
    out: [MyriMatch_out_1]
  OpenMS_02:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_2
      OpenMS_in_2: input_1
      OpenMS_in_3: MyriMatch_01/MyriMatch_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  protk_03:
    run: add-path-to-the-implementation/protk.cwl 
    in:
      protk_in_1: input_3
      protk_in_2: OpenMS_02/OpenMS_out_1
    out: [protk_out_1, protk_out_2]
  DeconMSn_04:
    run: add-path-to-the-implementation/DeconMSn.cwl 
    in:
      DeconMSn_in_1: input_2
      DeconMSn_in_2: input_2
    out: [DeconMSn_out_1, DeconMSn_out_2, DeconMSn_out_3]
  PeptideShaker_05:
    run: add-path-to-the-implementation/PeptideShaker.cwl 
    in:
      PeptideShaker_in_1: input_1
      PeptideShaker_in_2: protk_03/protk_out_1
      PeptideShaker_in_3: DeconMSn_04/DeconMSn_out_2
    out: [PeptideShaker_out_1, PeptideShaker_out_2, PeptideShaker_out_3, PeptideShaker_out_4]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3827" # proBED
    outputSource: PeptideShaker_05/PeptideShaker_out_1