Freelancer Robot Framework Test Suites
======================================

This repository contains our entire Robot Framework Test Suite which covers
the following products / domains:

  - Freelancer.com
  - Freelancer Mobile
  - Freelancer Desktop App
  - Escrow

Directory Structure
-------------------
`common` contains custom Robot Framework libraries and keywords that will be
used by the test suites.

`externals` contains extensions for external libraries by for the development /
deployment workflow but not by Robot Framework itself.

`src` contains the actual Robot Framework test suites.

`test_runner` contains helper scripts for running the test suites.

For more information on the directory structure, especially how tests are
organized within the `src` directory, see the
[Repository Directory Structure Docs](https://confluence.flnltd.com/x/1JtwAQ)
in Confluence.

Setup
-----

Detailed information on how to setup your workstation can be found in our
[Setup and Installation](https://confluence.flnltd.com/x/9ABK) guide in
Confluence.

Depending on your product group, you may or may not need to setup everything in
the document (e.g. you only need the
[SikuliX Robot Library](https://confluence.flnltd.com/x/bAdCAQ) if you are
going to work on the Freelancer Desktop App).

Running Tests
-------------

Tests must be invoked to include the `argument_file.txt` found at the
top-level directory. To run a particular test suite:

```bash
pybot --argumentfile argument_file.txt --suite ContestInfoAvailabilityTest src/
```

Tests may also be filtered using tags defined in a test suite's `Default Tags`
setting table:

```bash
pybot --argumentfile argument_file.txt --include CONTEST src/
```

A couple of helpers could be found in the `test_runner` directory. Check out
the [Confluence Guide](https://confluence.flnltd.com/x/fYMoAQ) on running
Robot scripts for more examples.

Docker Usage
-----
First of all, you're going to need to install docker.

Steps can be found here: https://docs.docker.com/engine/installation/


Then build the image:

```bash
docker build -t robots .
```

Then execute the tests:
```bash
docker run robots
```

If you don't want to run headless, you will need to mount your x11 port inside the container by executing the tests like this:
```bash
docker run -ti --rm -e DISPLAY=$DISPLAY -v /tmp/.X11-unix:/tmp/.X11-unix robots
```
