# Mittsu: 3MF

![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/manyfold3d/mittsu-3mf/build-workflow.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/5034e99af93f7cc58e71/maintainability)](https://codeclimate.com/github/manyfold3d/mittsu-3mf/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/5034e99af93f7cc58e71/test_coverage)](https://codeclimate.com/github/manyfold3d/mittsu-3mf/test_coverage)
![Libraries.io dependency status for latest release](https://img.shields.io/librariesio/release/rubygems/mittsu-3mf)


![GitHub Release](https://img.shields.io/github/v/release/manyfold3d/mittsu-3mf)
![Gem Downloads (for latest version)](https://img.shields.io/gem/dtv/mittsu-3mf)
![Dependent repos (via libraries.io)](https://img.shields.io/librariesio/dependent-repos/rubygems/mittsu-3mf)

3MF support for [Mittsu](https://github.com/danini-the-panini/mittsu).

## Installation

Just install:

`bundle add mittsu-3mf`

Then require in your code:

`require 'mittsu/3mf'`

## Usage

Currently this gem just includes an exporter. Loading 3MF files is "coming soon".

```
exporter = Mittsu::ThreeMFExporter.new
exporter.export(object, "output.3mf")
```

## About

This code was originally written for [Manyfold](https://manyfold.app), supported by funding from [NLNet](https://nlnet.nl) and [NGI Zero](https://ngi.eu/ngi-projects/ngi-zero/).
