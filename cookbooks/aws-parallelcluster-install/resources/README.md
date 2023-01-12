### Conventions for custom resources
For a custom resource `my_resource`:
- create `my_resource` folder under `resources` folder of the cookbook which the resource belongs to
- under `resources/my_resource` folder, create a file `my_resource_$os.rb` for each of the supported OSes
  - use accepted values for the parameter `Image -> Os` in ParallelCluster config file for `$os` suffix: 
    this would allow us to easily filter out all the files defining the behavior for a specific OS
- in case you have portions of code you want to reuse for multiple OSes
  - create a folder `partial` under `resources/my_resource`
  - under `resources/my_resource/partial` folder, create a file `_$description_$scope`
    - `$description` describes the contents of the partial
    - `$scope` describes the scope, or context (for instance, `debian`, `yum` etc.)
- code common to multiple resources, if it is not a resource itself, should go under `resources/partial`, 
  following the same conventions as for the resource-internal partials described above 
