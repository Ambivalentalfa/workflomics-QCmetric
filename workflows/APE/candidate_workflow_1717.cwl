# WorkflowNo_1716
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1716
doc: A workflow including the tool(s) BioLCCC, PeptideProphet, OpenMS, RelEx, LimmaRP.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3253" # Manchester OWL Syntax
  input_2:
    type: File
    format: "http://edamontology.org/format_3651" # MGF
  input_3:
    type: File
    format: "http://edamontology.org/format_3311" # RNAML
steps:
  BioLCCC_01:
    run: add-path-to-the-implementation/BioLCCC.cwl 
    in:
      BioLCCC_in_1: input_1
    out: [BioLCCC_out_1]
  PeptideProphet_02:
    run: add-path-to-the-implementation/PeptideProphet.cwl 
    in:
      PeptideProphet_in_1: BioLCCC_01/BioLCCC_out_1
    out: [PeptideProphet_out_1]
  OpenMS_03:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_3
      OpenMS_in_2: input_2
      OpenMS_in_3: PeptideProphet_02/PeptideProphet_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  RelEx_04:
    run: add-path-to-the-implementation/RelEx.cwl 
    in:
      RelEx_in_1: OpenMS_03/OpenMS_out_1
    out: [RelEx_out_1]
  LimmaRP_05:
    run: add-path-to-the-implementation/LimmaRP.cwl 
    in:
      LimmaRP_in_1: RelEx_04/RelEx_out_1
      LimmaRP_in_2: RelEx_04/RelEx_out_1
    out: [LimmaRP_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3508" # PDF
    outputSource: LimmaRP_05/LimmaRP_out_1
