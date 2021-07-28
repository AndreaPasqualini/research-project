# Tests

This folder contains code that checks existing results.
Tests should be run after a clean build has been run.
Tests should operate on intermediate files in `build` and check whether results are those that are expected.
Expected results should be hard-coded in the tests.

For example, say that your code in `src` loads raw data in `data` into memory, performs some calculations, creates a new variable called `myVar`, saves this into `build`.
Once you know that your code is right, you can hard-code the name of the variable, its average and standard deviation in a test.
When you will later modify your source code for other reasons, you can run a check to verify that you variable `myVar` was not changed (if that is the expected result).

A test suite should produce a text file that logs all the tests that were run, in which order, and their pass/fail results.
This log file should not be committed to the repository.
