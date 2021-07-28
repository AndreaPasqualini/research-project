# Name of Research Project

This research project answers new and interesting questions using novel, super-robust and one-click reproducible methodologies.

It argues that the marginal cost of creating a software infrastructure, as software developers would have, is dwarfed by the marginal benefit, which consists of continuously-reproducible results with traceable and documented changes.


## Dependencies

- OS tools
  - git
  - make
- TeXlive 2021
  - article, beamer
  - fontenc, inputenc
  - amsmath, amssymb, amsfonts
  - geometry, setspace, graphicx, xcolor

Command-line versions of the programs above are strongly recommended.
GUI-only programs, such as MATLAB on Windows, prevent you from taking advantage of the full automation coded in this repository (although replicability is still possible).


### Tested environments

The code in this repository has been tested on the following Operating Systems:

- Ubuntu 20.04
- Windows 10, version 21H1

For either OS, ensure that the programs in the dependencies are in your PATH environment variable.
Otherwise, the automated replication workflow will fail and you will have to operate each program manually.


## Replication instructions

1. Open this repository in a terminal.
1. Type `make` and press <kbd>Enter</kbd> to run all the code in the sequence established in the `Makefile`.
1. Type `make check` and press <kbd>Enter</kbd> to verify that the results obtained in the previous step are consistent with the test suite. The terminal will print lines at this stage only for tests that fail. No lines printed in the terminal is good news.


## Other notes

Nothing else to note.
