# My New Exciting Research Project

This repository is only a template.
It serves two purposes: first, it shows how I organize files for my research projects.
Second, and perhaps more importantly, it allows me to get started right away whenever I have a new research idea.

> :point_right: This file you are reading right now is not a suitable ReadMe file for your actual research project. Instead, this file is a meta-ReadMe (hence the name _README,_ which comes before _ReadMe_ in [ASCIIbetical order](https://en.wikipedia.org/wiki/ASCII#Character_order)) and is the actual ReadMe of the template. Remove this file after using this repository as a template. For an example of the ReadMe for your project (not this template) should have, check out the [ReadMe.md](./ReadMe.md) file.


## Philosophy

### Replicability

Ideally, any research must be replicable.
In practice, few papers are.
In an effort to improve the state of affairs, journals as the American Economic Review and the Journal of Financial Economics have introduced the role of "Data Editor".
Data editors check whether your work is replicable.
There are caveats and exceptions, but the general idea is that a data editor may hold back your paper from being published for several months, until you provide code and data that allow for exact replication of your results.
Even outside of ideology, we as researchers have the incentive to maintain code in a "always replicable" state.

This repository responds to this need.
It introduces a framework to organize code and data, together with rigid rules for _folder structure,_ _file_ and _semantic versioning_ and an _automated build system_ using [GNU Make](https://www.gnu.org/software/make/).
Arguing why all of this is necessary is a long endeavor, and this is not the place.
I will summarize it with four points.

- Research is messy: we deal with code for numerical and statistical work, code for typesetting, data obtained in various ways from various sources, intermediate files and various figures and tables. An organized _folder structure_ ensures a unique standard (across coauthors, at least), such that everybody knows where stuff is (or isn't) and what can be safely touched (or not).
- Research is messy: we try numbers, we change code, we scrap work. We move fast and we break things. Instead of copy-pasting one single file into a plethora of marginally different files, we can (and should) separate experimentation from decision-making. With _file versioning_ (e.g., with git or any other Version Control System), we introduce a rigid framework that discourages "permanently-experimental" files and encourages incremental changes on top of solid, stable bases. Local experimentation is always possible, but only valid and agreed-upon changes are eventually committed to the (shared) codebase.
- Research is messy: we change something and we go back to older choices to verify whether new things are consistent with old ones. Instead of losing track of what settings generate what results, _semantic versioning_ allows us to "release" consistent packages, or versions, of our work. We submit our work to a journal, it gets rejected with (hopefully) very valuable comments. These comments lead to changes. A new version of the research work is born. Separating versions is important to keep ourselves sane.
- Research is messy: we change things and then we must run 4 different programs under 3 different Operating Systems across 5 coauthors to ensure that everybody is on the same page. An _automated build system_ ensures that everybody can run everything with one click or, better, one command. While there are heterogeneous instructions about how to use such build system across different OS'es, there is nothing else to do once the setup is done: execute one file that runs all the necessary code in just the right order, from cleaning data to compiling the PDF from LaTeX code.

To each of these four points, add the fact that a third party (such as a data editor!) has to pick up your work and figure out how you did things, just to replicate your work.
And I shall not talk about the poor PhD student who's taking your work as a starting point for theirs...

This repository is my effort to deal with each of the four points above.
I make this repository public in the hope that it will help other colleagues.
The dream?
All research in Economics uses standardized conventions for maintaining and storing code and data.


### Versioning

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
Each number must be a non-negative integer.
Each version change must only increase a single number among `major`, `minor` and `patch` by one unit.
Precedence is determined by the first difference in each number.
For example: 1.0.0 < 2.0.0 < 2.1.0 < 2.1.1.

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


### Folder structure

This repository is essentially empty.
It contains a few folders, each of which only has one ReadMe file.
The other interesting bit is the `.gitignore` file, which tells us what will be considered by git and what not.

- `data`: this folder contains, well, the data needed in the research project. An important caveat is that this folder should only contain raw data. It should not contain processed data. The data here must match the data you get directly at your sources. This allows a third party to easily verify that the data they use match yours, and to see why if that is not the case. You decide whether you want to commit data to the repository. Sometimes the data is too big. Sometimes it is proprietary. YMMV. However, if you do decide to commit data to the repository, you should prefer using text-based formats, such as CSV. Binary formats, such as Excel's `.xlsx` or Stata's `.dta`, are inadequate in a git repository, because small changes will trigger the upload of the entire new file. The ReadMe file in this folder should describe where and how you get your data. If the data is obtained through point-and-click interfaces, or pay-walled websites, the ReadMe file should explain "click by click" how you get it.
- `ref`: short for "references". This folder should contain references that are useful for the research project. The most suitable file that should be present is a bibliography file for LaTeX. However, one may want to store other files, such as other papers in PDF format. These may or may not be committed to the repository. For example, I forbid PDF files in this folder in my `.gitignore` file, because I see no value in having them versioned with git. Consider also maintaining a text file with hyperlinks to relevant material (e.g., you are technically not allowed to commit published papers, so that you'd link to the pay-walled webpage on the publisher's website).
- `src`: this is short for "source", and it refers to the source code of your research project. Whether you only use LaTeX and do theory, or you use a combination of other languages for empirical work, this folder will contain all code. The ReadMe file therein should explain what source file does what from a big-picture point of view.
- `build`: the contents of this folder are entirely excluded from source control, because it should contain a bunch of intermediate files obtained throughout the replication of your research. This may contain PDF versions of your TikZ figures, or binary representations of intermediate data (e.g., `.dta`, `.mat`, `.pickle`, `.feather` files you obtain after cleaning your raw data in the `data` folder). This folder should also contain the single-figure PDF files and single-table TeX files that you will later include in your paper. Note that I used the word "intermediate". This folder should not contain files that are considered "final", such as a draft of the paper or presentation slides.
- `test`: this folder should contain code that tests built files. After a clean build has been run, the folder `build` will be populated with several intermediate files. These files can be checked, or tested, for correctness. For example, you can check that an intermediate dataset contains a certain variable, which should satisfy certain properties. The expected results, or properties, should be hard-coded in the test code contained here.
- `dist`: this is short for "distributables". As the name implies, this folder should contain final objects that you can consider distributing. Obvious examples are the draft of the paper and presentation slides.

Note that `dist` and `build` in open source projects are often interchangeable.
Here I have forked their definitions in order to fit the idea that research produces a lot of intermediate files before obtaining a single distributable PDF file (e.g., your paper).
Furthermore, the `ref` folder is not part of a conventional open source project, because there is no need for it.
However, research heavily relies on references, hence the tweak in my template.


## Other remarks

### Licensing

Strictly speaking, [absence of a license implies no license at all](https://choosealicense.com/no-permission/).
This means that nobody other than the author(s) would be legally allowed to even read what is in this repository.
This is why a license is necessary.
Many researchers (at least in Economics) often forego this detail, and most of the times there is no problem.
However, I think we should encourage the use of licenses.
Not only this would allow us to freely redistribute our work (as we should), it also has the potential to avoid some sketchy corner cases.
For example, we may be allowed to commit private data to a repository, with the disclaimer that a license must be had to use it.

The website [choosealicense.com](https://choosealicense.com) has good explanations about choosing a license.
It explains in simple terms what each license allows or disallows.
It highlights certain subtle implications for some choices.
It also gives guidelines over what to do if your work is not (all) software (e.g., use mixed licenses in one repository).

Remember that you are only allowed to license _your own work._
You have no power to choose a license for material that is not your own.
In those cases, you should add a disclaimer where you correctly attribute ownership.


### Feedback

If you have comments, questions or any other feedback about this file and its contents, feel free to reach out to me.
You can either [open an issue](https://github.com/AndreaPasqualini/research-project/issues/new) or shoot me an email at the address you find on [my webpage](https://andrea.pasqualini.io).
