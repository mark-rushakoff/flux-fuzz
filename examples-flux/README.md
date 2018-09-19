# examples

This directory is the workdir shared by the different fuzz suites for flux.
The assumption is that any interesting queries discovered are worth testing in any fuzz suite that works against flux.

You can add interesting queries directly to the corpus directory.
The filename of those queries isn't important, but by convention, give it a `.flux` extension,
so that it's clear that it was a handwritten query rather than an automatically generated one.
