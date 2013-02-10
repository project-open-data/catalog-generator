Catalog Generator
=================

A multi-format tool to generate and maintain agency.gov/data catalog files.

## What Problem This Solves

Creating and updating agency.gov/data catalog files is a non-trivial and potentially time-consuming task.

## How This Solves It

Catalog Generator creates conformant catalog files using simple, list-based input.

## Importing and Exporting

Catalog Generator can import both CSV and JSON files, and can export as JSON, HTML (RDFa), and XML

## Under the Hood

Catalog Generator is build using Jekyll, Backbone and CoffeeScript.

There is a collection of `Dataset` models stored as `Application.datasets`. The schema is parsed via YML and stored at `Applciation.schema` as a colleciton of `Field` models. Each Dataset has multiple Fields.

## Requirements

### Using

Catalog Generator runs entirely in your browser. No installation necessary. Simply visit http://project-open-data.github.com/catalog-generator

### Contributing

* Node
* Ruby (Bundler)
* Jekyll
* Grunt

## Running Catalog Generator Locally

To run catalog generator locally (e.g., to contribute):

### Setup

1. `git clone https://github.com/project-open-data/catalog-generator.git`
2. `cd catalog-generator`
3. `npm install`
4. `bundle install`

### Building

* Use the command `grunt` to compile and compress all templates, coffeescript, and css files.
* Use the command `jekyll` to initiate a server. The site will be available at `http://localhost:4000`.

### Additional Commands

```
Available tasks
        concat  Concatenate files. *                                           
        coffee  Compile CoffeeScript files into JavaScript *                   
        uglify  Minify files with UglifyJS. *                                  
         watch  Run predefined tasks whenever watched files change.            
        mincss  Minify CSS files *                                             
         clean  Clean files and folders. *                                     
    coffeelint  Validate files with CoffeeLint *                               
        jekyll  This triggers the `jekyll` command. *                          
      imagemin  Minify PNG and JPEG images *                                   
       csslint  Lint CSS files with csslint *                                  
        cssmin  Minify CSS files with clean-css. *                             
           jst  Compile underscore templates to JST file *                     
            cs  Alias for "coffeelint", "concat", "coffee" tasks.              
       default  Alias for "cs", "jst", "uglify", "mincss", "clean" tasks.   
```

## Contributing

This project constitutes a collaborative work ("open source"). Federal employees and members of the public are encouraged to improve the project by contributing.

1. Configure git by using this [basic tutorial](https://help.github.com/articles/set-up-git) or by downloading the [GitHub for Mac](http://mac.github.com/)/[GitHub for Windows](http://windows.github.com/).
2. [Fork](https://help.github.com/articles/fork-a-repo) the project.
3. Make changes as you would normally using the tools installed in step #1.
4. Push the changes back to your fork.
5. Submitting a pull request to this repository.
6. You change should appear once approved.

*Note: All contributors retain the original copyright to their contribution, but by contributing to this project, you grant a world-wide, royalty-free, perpetual, irrevocable, non-exclusive, transferable license to all users under the terms of the license(s) under which this project is distributed.*

## License

The project [as originally published](#) constitutes a work of the United States Government and is not subject to domestic copyright protection under 17 USC § 105. Subsequent contributions by members of the public, however, retain their original copyright.

In order to better facilitate collaboration, the content of this project is licensed under the [creative commons 3.0 license](http://creativecommons.org/licenses/by/3.0/us/deed.en_US), and the underlying source code used to format and display that content is licensed under the [MIT license](http://opensource.org/licenses/mit-license.php). 