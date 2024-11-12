# Mittsu: 3MF
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
