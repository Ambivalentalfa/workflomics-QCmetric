# WorkflowNo_604
# This workflow is generated by APE (https://github.com/sanctuuary/APE).
cwlVersion: v1.2
class: Workflow

label: WorkflowNo_604
doc: A workflow including the tool(s) PIA - Protein Inference Algorithms, PeptideShaker, MSiReader, ComPIL, isobar.

inputs:
  input_1:
    type: File
    format: "http://edamontology.org/format_1929" # FASTA
  input_2:
    type: File
    format: "http://edamontology.org/format_3651" # MGF
  input_3:
    type: File
    format: "http://edamontology.org/format_3162" # MAGE-TAB
steps:
  PIA - Protein Inference Algorithms_01:
    run: add-path-to-the-implementation/PIA - Protein Inference Algorithms.cwl 
    in:
      PIA - Protein Inference Algorithms_in_1: input_3
    out: [PIA - Protein Inference Algorithms_out_1, PIA - Protein Inference Algorithms_out_2]
  PeptideShaker_02:
    run: add-path-to-the-implementation/PeptideShaker.cwl 
    in:
      PeptideShaker_in_1: input_1
      PeptideShaker_in_2: PIA - Protein Inference Algorithms_01/PIA - Protein Inference Algorithms_out_1
      PeptideShaker_in_3: input_2
    out: [PeptideShaker_out_1, PeptideShaker_out_2, PeptideShaker_out_3, PeptideShaker_out_4]
  MSiReader_03:
    run: add-path-to-the-implementation/MSiReader.cwl 
    in:
      MSiReader_in_1: input_3
      MSiReader_in_2: PeptideShaker_02/PeptideShaker_out_3
    out: [MSiReader_out_1, MSiReader_out_2]
  ComPIL_04:
    run: add-path-to-the-implementation/ComPIL.cwl 
    in:
      ComPIL_in_1: MSiReader_03/MSiReader_out_2
    out: [ComPIL_out_1]
  isobar_05:
    run: add-path-to-the-implementation/isobar.cwl 
    in:
      isobar_in_1: input_2
      isobar_in_2: ComPIL_04/ComPIL_out_1
    out: [isobar_out_1]
outputs:
  output_1:
    type: File
    format: "http://edamontology.org/format_3508" # PDF
    outputSource: isobar_05/isobar_out_1