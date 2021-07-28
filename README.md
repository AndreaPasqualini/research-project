# My New Exciting Research Project

This repository is only a template.
It serves two purposes: first, it shows how I organize files for my research projects.
Second, and perhaps more importantly, it allows me to get started right away whenever I have a new research idea.

> :point_right: This file you are reading right now is not a suitable ReadMe file for your actual research project. Instead, this file is a meta-ReadMe (hence the name _README,_ which comes before _ReadMe_ in [ASCIIbetical order](https://en.wikipedia.org/wiki/ASCII#Character_order)) and is the actual ReadMe of the template. Remove this file after using this repository as a template. For an example of the ReadMe for your project (not this template) should have, check out the [ReadMe.md](./ReadMe.md) file.


## Philosphy and suggested tools

Replicability of research in Economics and Finance has been in the spotlight in recent years.
The organization of my research projects is designed to force myself (and hopefully my coauthors) to keep research files in a "always reproducible" state.
The endgame here is only one: allow for a one-command setup that produces all files necessary and reproduces results down to the last decimal figure.

To obtain this level of automation, I use two fundamental tools.
One is `git`, and the other is `make`.
On top of this, typical software packages I use include LaTeX, Python, Stata, MATLAB and R.
At least two of these are hard-dependencies of my work: one always is LaTeX.


### A note on versioning

There are two complementary levels of versioning that I use.
First, and most obviously (you are reading this on GitHub), I use git to keep track of changes to the code in my repositories.
There are lots of good reasons for using a Version Control System (VCS) and I will not explain them here.
It suffices to say that VCS' help tremendously in keeping track of _why_ certain changes to the code occurred.
In particular, commit messages (can) go a long way in explaining the context of the associated changes.

Second, and perhaps most importantly, my research follows the [Semantic Versioning guidelines](https://semver.org/), with a few tweaks to adapt them to a research context.
This means that I use git's _tags_ to flag specific commits in time.
On GitHub, tags are also called "releases", which you can easily download in one click.
You can read about semantic versioning at the link above.
Here I outline only a few elements, plus my additional tweaks.

A version consists of three numbers, separated by a period.
```
[major].[minor].[patch]
```
Examples include 0.1.0, 1.0.0 and 2.4.35.

- **Major:** Change this whenever the research project reaches a fundamental milestone. For example, the first available draft of the paper is marked with major version `1`, while all work prior to the circulation of the first draft will have major version `0`. A complete re-write of the paper, shuffling sections and changing the logical flow of the project, will justify a bump in the major version number. Revision rounds at journals may justify new major versions, but do not need to.
- **Minor:** Change this whenever the research project achieves a new finding, but such that the paper will not be re-written from scratch. For example, adding robustness checks and expanding an existing section with a corroborating result or argument. Revision rounds at journals should grant at least a minor version bump.
- **Patch:** Change this whenever you change economically insignificant details. Bug fixes and typos fall in this category.

The explanation above refers to the draft of the paper.
However, this is only for pedagogical purposes.
A tag points at a commit.
This means that one should find a consistent state of affairs _at that commit_, such that one specific version of your results are reproduced.
For example, the tag `v1.0.0` points to version 1.0.0 of your work.
At the tagged commit, your repository should include all files that allow one to replicate exactly the draft marked with version 1.0.0.
This commit, possibly together with previous ones, should have introduced all changes that make `v1.0.0` possible and reproducible.

I make it a convention that 0.0.0 is the version of an empty repository, while 0.1.0 is the first admissible version number after 0.0.0 (i.e., you would not find 0.0.x, with strictly positive x)

What if there is a mistake that makes version 1.0.0 not reproducible?
What I do is: I leave 1.0.0 alone and I introduce a bugfix or a patch and release `v1.0.1`.
In the comments to this new tag/release, I will specify that `v1.0.0` is not reliable and people should use `v1.0.1`.


## Concrete explanations

This repository is essentially empty.
It contains a few folders, each of which only has one ReadMe file.
The other interesting bit is the `.gitignore` file, which tells us what will be considered by git and what not.

- `data`: this folder contains, well, the data needed in the research project. An important caveat is that this folder should only contain raw data. It should not contain processed data. The data here must match the data you get directly at your sources. This allows a third party to easily verify that the data they use match yours, and to see why if that is not the case. You decide whether you want to commit data to the repository. Sometimes the data is too big. Sometimes it is proprietary. YMMV. However, if you do decide to commit data to the repository, you should prefer using text-based formats, such as CSV. Binary formats, such as Excel's `.xlsx` or Stata's `.dta`, are inadequate in a git repository, because small changes will trigger the upload of the entire new file. The ReadMe file in this folder should describe where and how you get your data. If the data is obtained through point-and-click interfaces, or pay-walled websites, the ReadMe file should explain "click by click" how you get it.
- `src`: this is short for "source", and it refers to the source code of your research project. Whether you only use LaTeX and do theory, or you use a combination of other languages for empirical work, this folder will contain all code. The ReadMe file therein should explain what source file does what from a big-picture point of view.
- `build`: the contents of this folder are entirely excluded from source control, because it should contain a bunch of intermediate files obtained throughout the replication of your research. This may contain PDF versions of your TikZ figures, or binary representations of intermediate data (e.g., `.dta`, `.mat`, `.pickle`, `.feather` files you obtain after cleaning your raw data in the `data` folder). This folder should also contain the single-figure PDF files and single-table TeX files that you will later include in your paper. Note that I used the word "intermediate". This folder should not contain files that are considered "final", such as a draft of the paper or presentation slides.
- `test`: this folder should contain code that tests built files. After a clean build has been run, the folder `build` will be populated with several intermediate files. These files can be checked, or tested, for correctness. For example, you can check that an intermediate dataset contains a certain variable, which should satisfy certain properties. The expected results, or properties, should be hard-coded in the test code contained here.
- `dist`: this is short for "distributables". As the name implies, this folder should contain final objects that you can consider distributing. Obvious examples are the draft of the paper and presentation slides.

Note that `dist` and `build` in open source projects are often interchangeable.
Here I have forked their definitions in order to fit the idea that research produces a lot of intermediate files before obtaining a single distributable PDF file (e.g., your paper).
Furthermore, the `ref` folder is not part of a conventional open source project, because there is no need for it.
However, research heavily relies on references, hence the tweak in my template.
