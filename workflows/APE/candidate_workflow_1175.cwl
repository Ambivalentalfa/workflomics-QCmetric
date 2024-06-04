# WorkflowNo_1174
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1174
doc: A workflow including the tool(s) XTandemPipeline, OpenMS, ASAPRatio, OpenSWATH, msalign.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3651" # MGF
  input_2:
    type: File
    format: "http://edamontology.org/format_3713" # Mascot .dat file
  input_3:
    type: File
    format: "http://edamontology.org/format_3652" # dta
steps:
  XTandemPipeline_01:
    run: add-path-to-the-implementation/XTandemPipeline.cwl 
    in:
      XTandemPipeline_in_1: input_2
    out: [XTandemPipeline_out_1, XTandemPipeline_out_2]
  OpenMS_02:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_3
      OpenMS_in_2: input_1
      OpenMS_in_3: XTandemPipeline_01/XTandemPipeline_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  ASAPRatio_03:
    run: add-path-to-the-implementation/ASAPRatio.cwl 
    in:
      ASAPRatio_in_1: XTandemPipeline_01/XTandemPipeline_out_1
    out: [ASAPRatio_out_1, ASAPRatio_out_2]
  OpenSWATH_04:
    run: add-path-to-the-implementation/OpenSWATH.cwl 
    in:
      OpenSWATH_in_1: ASAPRatio_03/ASAPRatio_out_2
    out: [OpenSWATH_out_1]
  msalign_05:
    run: add-path-to-the-implementation/msalign.cwl 
    in:
      msalign_in_1: OpenSWATH_04/OpenSWATH_out_1
      msalign_in_2: OpenMS_02/OpenMS_out_1
    out: [msalign_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3330" # PO
    outputSource: msalign_05/msalign_out_1
