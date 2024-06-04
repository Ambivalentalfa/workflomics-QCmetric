# WorkflowNo_305
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_305
doc: A workflow including the tool(s) BioLCCC, PeptideProphet, OpenMS, MassChroQ, OpenSWATH.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_2352" # BioXSD (XML)
  input_2:
    type: File
    format: "http://edamontology.org/format_1631" # EXP
  input_3:
    type: File
    format: "http://edamontology.org/format_3155" # SBRML
steps:
  BioLCCC_01:
    run: add-path-to-the-implementation/BioLCCC.cwl 
    in:
      BioLCCC_in_1: input_2
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
      OpenMS_in_2: input_1
      OpenMS_in_3: PeptideProphet_02/PeptideProphet_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  MassChroQ_04:
    run: add-path-to-the-implementation/MassChroQ.cwl 
    in:
      MassChroQ_in_1: OpenMS_03/OpenMS_out_1
    out: [MassChroQ_out_1]
  OpenSWATH_05:
    run: add-path-to-the-implementation/OpenSWATH.cwl 
    in:
      OpenSWATH_in_1: MassChroQ_04/MassChroQ_out_1
    out: [OpenSWATH_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
    outputSource: OpenSWATH_05/OpenSWATH_out_1
