# Understanding DocC archive structure

An overview of the files and data structure that exist within a DocC archive.

## Overview

A DocC archive, at its heart, is a directory with files at conventional locations that you can iteratively walk and parse. The core files of DocC—the ones that hold all the detail to be presented—are stored as individual JSON files in the filesystem. Some of these files only exist when you create the archive with explicit command-line flags.

The green check marks indicate that this library includes tests that verify the generated Swift types for the data structures parse from an example.
The following tree is a loose example structure:

```bash
ExampleDocs.doccarchive
├── assets.json (default)
├── data
│   └── documentation ✅ (default - internals are specific to the symbols provided)
│       ├── exampledocs
│       │   └── examplearticle.json ✅
│       └── exampledocs.json ✅
├── diagnostics.json ✅ (deprecated - going away in Swift 6.3)
├── index
│   └── index.json ✅ (default)
├── indexing-records.json ✅ (optional w/ --emit-digest)
├── linkable-entities.json ✅ (optional w/ --enable-experimental-external-link-support)
└── metadata.json ✅ (default)
```

The `index/index.json` file provides the detail of what's included within the archive. In effect, it encodes the manifest of all symbols in the archive. A DocC archive provides a JSON file, and typically an HTML page that hosts a single-page JavaScript app that displays the content, for each symbol.
An archive **can** incorporate more than one module (originally they were only for a single module).
The symbols within the archive are represented by "nodes" found within the index—a list of them.
But each node is actually a tree structure, so the list of nodes is really a list of tree data structures.

The data structures are defined in `Types.swift`, which is generated using the OpenAPI generator from the OpenAPI spec descriptions provided within the DocC project itself.
The types are intentionally _not_ public.

There are some awkward spots where OpenAPI can't directly represent the original type structure (specifically around dictionaries or maps as properties on types), but otherwise maps reasonably well. The upstream OpenAPI declarations don't, however, include any direct documentation of the types. In the sources within this library, references to the upstream modules internal to DocC that these types represent are added.
