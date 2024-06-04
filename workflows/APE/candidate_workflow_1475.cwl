# WorkflowNo_1474
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1474
doc: A workflow including the tool(s) make_random, PeptideProphet, OpenMS, RelEx, SWATH2stats.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_1954" # Pearson format
  input_2:
    type: File
    format: "http://edamontology.org/format_2311" # EMBL-HTML
  input_3:
    type: File
    format: "http://edamontology.org/format_3311" # RNAML
steps:
  make_random_01:
    run: add-path-to-the-implementation/make_random.cwl 
    in:
      make_random_in_1: input_1
    out: [make_random_out_1]
  PeptideProphet_02:
    run: add-path-to-the-implementation/PeptideProphet.cwl 
    in:
      PeptideProphet_in_1: input_2
    out: [PeptideProphet_out_1]
  OpenMS_03:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_3
      OpenMS_in_2: make_random_01/make_random_out_1
      OpenMS_in_3: PeptideProphet_02/PeptideProphet_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  RelEx_04:
    run: add-path-to-the-implementation/RelEx.cwl 
    in:
      RelEx_in_1: OpenMS_03/OpenMS_out_1
    out: [RelEx_out_1]
  SWATH2stats_05:
    run: add-path-to-the-implementation/SWATH2stats.cwl 
    in:
      SWATH2stats_in_1: RelEx_04/RelEx_out_1
    out: [SWATH2stats_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_2064" # 3D-1D scoring matrix format
    outputSource: SWATH2stats_05/SWATH2stats_out_1
