# WorkflowNo_347
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_347
doc: A workflow including the tool(s) PIA - Protein Inference Algorithms, msaccess, XTandemPipeline, OpenMS, PeptideShaker.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input_2:
    type: File
    format: "http://edamontology.org/format_3702" # MSF
  input_3:
    type: File
    format: "http://edamontology.org/format_3651" # MGF
steps:
  PIA - Protein Inference Algorithms_01:
    run: add-path-to-the-implementation/PIA - Protein Inference Algorithms.cwl 
    in:
      PIA - Protein Inference Algorithms_in_1: input_2
    out: [PIA - Protein Inference Algorithms_out_1, PIA - Protein Inference Algorithms_out_2]
  msaccess_02:
    run: add-path-to-the-implementation/msaccess.cwl 
    in:
      msaccess_in_1: input_3
      msaccess_in_2: PIA - Protein Inference Algorithms_01/PIA - Protein Inference Algorithms_out_1
    out: [msaccess_out_1, msaccess_out_2, msaccess_out_3]
  XTandemPipeline_03:
    run: add-path-to-the-implementation/XTandemPipeline.cwl 
    in:
      XTandemPipeline_in_1: msaccess_02/msaccess_out_2
    out: [XTandemPipeline_out_1, XTandemPipeline_out_2]
  OpenMS_04:
    run: add-path-to-the-implementation/OpenMS.cwl 
    in:
      OpenMS_in_1: input_3
      OpenMS_in_2: input_1
      OpenMS_in_3: XTandemPipeline_03/XTandemPipeline_out_1
    out: [OpenMS_out_1, OpenMS_out_2]
  PeptideShaker_05:
    run: add-path-to-the-implementation/PeptideShaker.cwl 
    in:
      PeptideShaker_in_1: input_1
      PeptideShaker_in_2: OpenMS_04/OpenMS_out_1
      PeptideShaker_in_3: input_3
    out: [PeptideShaker_out_1, PeptideShaker_out_2, PeptideShaker_out_3, PeptideShaker_out_4]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3579" # JPG
    outputSource: PeptideShaker_05/PeptideShaker_out_1