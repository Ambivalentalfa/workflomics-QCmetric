# WorkflowNo_1571
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1571
doc: A workflow including the tool(s) PChopper, PeptideProphet, OpenMS, PRIDE Toolsuite, PAnnBuilder.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3311" # RNAML
  input_2:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input_3:
    type: File
    format: "http://edamontology.org/format_3311" # RNAML
steps:
  PChopper_01:
    run: add-path-to-the-implementation/PChopper.cwl 
    in:
      PChopper_in_1: input_2
    out: [PChopper_out_1]
  PeptideProphet_02:
    run: add-path-to-the-implementation/PeptideProphet.cwl 
    in:
      PeptideProphet_in_1: PChopper_01/PChopper_out_1
    out: [PeptideProphet_out_1]
  OpenMS_03:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_3
      OpenMS_in_2: input_1
      OpenMS_in_3: PeptideProphet_02/PeptideProphet_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  PRIDE Toolsuite_04:
    run: add-path-to-the-implementation/PRIDE Toolsuite.cwl 
    in:
      PRIDE Toolsuite_in_1: OpenMS_03/OpenMS_out_1
    out: [PRIDE Toolsuite_out_1]
  PAnnBuilder_05:
    run: add-path-to-the-implementation/PAnnBuilder.cwl 
    in:
      PAnnBuilder_in_1: input_2
      PAnnBuilder_in_2: PRIDE Toolsuite_04/PRIDE Toolsuite_out_1
    out: [PAnnBuilder_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3622" # Gemini SQLite format
    outputSource: PAnnBuilder_05/PAnnBuilder_out_1