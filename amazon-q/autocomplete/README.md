# Amazon Q CLI Autocomplete

This directory contains my custom completion specs for the Amazon Q CLI's
autocomplete feature.

A completion spec is a _declarative_ schema that specifies the `subcommands`,
`options` and `args` for a CLI tool. Amazon Q uses these schemas to generate
suggestions.

## Steps to Create a Completion Spec

1. Follow the instructions at [withfig/autocomplete](https://github.com/withfig/autocomplete#-contribute-your-first-spec-in--3-minutes)
to create a new spec and build it.

2. Copy the generated spec build file(s) in the forked repo to this directory's
`build` sub-directory.

3. In the Amazon Q GUI > CLI Completions > Developer section, (1) enable "Dev
mode" and (2) set the "Specs folder" to this directory's `build` sub-directory.
