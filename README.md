# RjsMinifier
_Copyright (c) 2014 Rawand Fatih_, 
_Licensed under MIT License (MIT)_

Shell script to merge and minify JavaScript file/files.
You can minify a single file, or merge and minify multiple files.

For minifing the JS, this script uses a minifier from [javascript-minifier.com](http://javascript-minifier.com/)

Usage
------------
### Using File Name Sequence
- You can use the command with a sequence of files and it will merge and minifiy all the files in order of the argument sequence.
  - Two files will be created (script.js and script.min.js).
  - Example:
```csharp
    // Ouputs 'script.js' and 'script.min.js'
    sh RjsMinifier.sh test.js test2.js

    // You can also minify a single file
    sh RjsMinifier.sh test.js
```
### Using Option Arguments
- You can specify parameters, once you use parameters the -n and -f arguments are required.
  - Params:
    - [ -n ] To specify the file name.
    - [ -f ] The list of files. It SHOULD be wrapped in double quotes [ " ].
    - [ -r ] To remove the merged (but not minified) filed.
  - Examples:
```csharp
    // This outputs 'king.js' and 'king.min.js'
    sh RjsMinifier.sh -n king -f "test.js test2.js"

    // This outputs only the minified file, 'queen.min.js'
    sh RjsMinifier.sh -r -n queen -f "test.js test2.js"
    
    // You can also use if for single files, outputs 'prince.min.js'
    sh RjsMinifier.sh -r -n prince -f "test.js"
    
    // You can also specify paths along the file names
    // This outputs princess.js and princess.min.js in the home folder.
    sh RjsMinifier.sh -n "~/princess" -f "test.js test2.js"
```
------------

### Good Practices
It's always better and cleaner to create an alias for the shell script so that you can use it easier.
```csharp
    // Use the path of your script instead.
    // It's good to have a folder for all the scripts in one place.
    alias jscomp='~/bashscripts/RjsMinifier.sh'
```
You can also add this alias initialization to your `.bash_profile` on Mac, or `.bashrc` on Linux so that the alias will be created each time you use terminal.
