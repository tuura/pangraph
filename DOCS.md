#Pangraph Documentation

##Overview
Pangraph handles multiple file types, both reading and writing. The Source files are in four places.  
- `src/Pangraph.hs` which exports the API.
- `src/Util/` which contains helper modules such as `MyXML` and `MyZip`.
- `src/Parsers/` which contains an entry point for parsing and individual file type parsers.
- `src/Writers/` which contains an entry point for writing and individual file type writers.

A section on each in the order given above follows below.

##src/Pangraph.hs
The intention of this file is to pull all modules together into one outward API so only one include is needed. In previous commits it contained implementations of code.

##src/Util/
The modules contained here do general tasks and/or are needed in multiple places throughout the library.

###src/Util/MyXML.hs
This library allows for the parsing of XML formats. It exports only `parseFile` which must but called using the `Text.Parsec's (parse)` function. The module also imports `Util.Types` to gain access to the Rose Tree xml types. `parseFile` returns a `Root` type.

###src/Util/MyZip.hs
This module provides an implementation that will extract a named file from a named zip archive. **However**, it is not currently used due to compile errors. A workaround currently parses the manually extracted `model.xml` file from `.work` files.

###src/Util/Types.hs
Currently this exports two kinds of types. Those needed in multiple places e.g. `ShortFile` and its children. As well as Types used only internally for writing and reading files. In file comments have more detail on individual types.

##src/Parsers/
The modules contained all pertain to parsing an particular file type. `GmlP.hs` and `Shorten.hs` are the oldest and do not use code in `MyXML.hs`.

###src/Parsers/Discrim.hs
`Discrim.hs` is the entry point to all parsers and is contains the two functions `parseGraph` and `readGraph`. The job of the module is discriminate between different file types to read the file and then parse it correctly into a `ShortFile`.

###src/Parsers/WorkP.hs
This module will handle a Workcraft style parse and extract information into `ShortGraph` it does this by list manipulation on the Rose Tree `Root` type returned from `MyXML.hs`.

##src/Parsers/GmlP.hs
This module will parse a Graphml file. The parsec code contained will return a Root type, which then calls `Shorten.hs` to manipulate it into ShortGraph.

This is different to `WorkP.hs` in that the XML parsing is in contained in `GmlP.hs` instead of `MyXML.hs` and the filtering in `Shorten.hs` instead of `WorkP.hs`. It is intended that all future supported graphs work like `WorkP.hs`.

##src/Writers/
This group of modules contains a module to act as a discriminator to select the correct writer; `Discrim.hs`.
The rest of the modules are for writing in the format of a particular file type. Currently only .graphml in supported.

###src/Writers/Discrim.hs
This module exports one function: `writeGraph` its purpose is to decide which writer to use and call it. It also links all the other writers in the directory.

###src/Writers/GmlW.hs
The module contains `writeGraph'` to create the string from a `ShortFile` and then perform the IO operation to write it.
