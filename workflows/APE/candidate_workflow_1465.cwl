# WorkflowNo_1464
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_1464
doc: A workflow including the tool(s) XTandemPipeline, Multi-Q, CrosstalkDB, MSiReader, Xtractor.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_3758" # SEQUEST .out file
  input_2:
    type: File
    format: "http://edamontology.org/format_1644" # CHP
  input_3:
    type: File
    format: "http://edamontology.org/format_3654" # mzXML
steps:
  XTandemPipeline_01:
    run: add-path-to-the-implementation/XTandemPipeline.cwl 
    in:
      XTandemPipeline_in_1: input_1
    out: [XTandemPipeline_out_1, XTandemPipeline_out_2]
  Multi-Q_02:
    run: add-path-to-the-implementation/Multi-Q.cwl 
    in:
      Multi-Q_in_1: input_3
      Multi-Q_in_2: XTandemPipeline_01/XTandemPipeline_out_1
    out: [Multi-Q_out_1]
  CrosstalkDB_03:
    run: add-path-to-the-implementation/CrosstalkDB.cwl 
    in:
      CrosstalkDB_in_1: Multi-Q_02/Multi-Q_out_1
    out: [CrosstalkDB_out_1, CrosstalkDB_out_2, CrosstalkDB_out_3, CrosstalkDB_out_4]
  MSiReader_04:
    run: add-path-to-the-implementation/MSiReader.cwl 
    in:
      MSiReader_in_1: input_3
      MSiReader_in_2: CrosstalkDB_03/CrosstalkDB_out_2
    out: [MSiReader_out_1, MSiReader_out_2]
  Xtractor_05:
    run: add-path-to-the-implementation/Xtractor.cwl 
    in:
      Xtractor_in_1: input_2
      Xtractor_in_2: input_2
      Xtractor_in_3: MSiReader_04/MSiReader_out_2
    out: [Xtractor_out_1, Xtractor_out_2, Xtractor_out_3]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_1350" # MEME Dirichlet prior
    outputSource: Xtractor_05/Xtractor_out_1