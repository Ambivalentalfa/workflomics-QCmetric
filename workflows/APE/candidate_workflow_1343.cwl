# WorkflowNo_1342
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1342
doc: A workflow including the tool(s) PEAKS De Novo, PeptideProphet, OpenMS, RelEx, CCdigest.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3710" # WIFF format
  input_2:
    type: File
    format: "http://edamontology.org/format_3651" # MGF
  input_3:
    type: File
    format: "http://edamontology.org/format_3311" # RNAML
steps:
  PEAKS De Novo_01:
    run: add-path-to-the-implementation/PEAKS De Novo.cwl 
    in:
      PEAKS De Novo_in_1: input_1
    out: [PEAKS De Novo_out_1]
  PeptideProphet_02:
    run: add-path-to-the-implementation/PeptideProphet.cwl 
    in:
      PeptideProphet_in_1: PEAKS De Novo_01/PEAKS De Novo_out_1
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
  CCdigest_05:
    run: add-path-to-the-implementation/CCdigest.cwl 
    in:
      CCdigest_in_1: RelEx_04/RelEx_out_1
    out: [CCdigest_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_2532" # GenBank-HTML
    outputSource: CCdigest_05/CCdigest_out_1
