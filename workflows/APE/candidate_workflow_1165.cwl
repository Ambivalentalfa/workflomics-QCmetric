# WorkflowNo_1164
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1164
doc: A workflow including the tool(s) MSD File Reader, MSiReader, Jtraml, XTandemPipeline, Libra.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3913" # Loom
  input_2:
    type: File
    format: "http://edamontology.org/format_1972" # NCBI format
  input_3:
    type: File
    format: "http://edamontology.org/format_3330" # PO
steps:
  MSD File Reader_01:
    run: add-path-to-the-implementation/MSD File Reader.cwl 
    in: []
    out: [MSD File Reader_out_1]
  MSiReader_02:
    run: add-path-to-the-implementation/MSiReader.cwl 
    in:
      MSiReader_in_1: input_2
      MSiReader_in_2: MSD File Reader_01/MSD File Reader_out_1
    out: [MSiReader_out_1, MSiReader_out_2]
  Jtraml_03:
    run: add-path-to-the-implementation/Jtraml.cwl 
    in:
      Jtraml_in_1: MSiReader_02/MSiReader_out_2
    out: [Jtraml_out_1]
  XTandemPipeline_04:
    run: add-path-to-the-implementation/XTandemPipeline.cwl 
    in:
      XTandemPipeline_in_1: Jtraml_03/Jtraml_out_1
    out: [XTandemPipeline_out_1, XTandemPipeline_out_2]
  Libra_05:
    run: add-path-to-the-implementation/Libra.cwl 
    in:
      Libra_in_1: XTandemPipeline_04/XTandemPipeline_out_1
    out: [Libra_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3747" # protXML
    outputSource: Libra_05/Libra_out_1