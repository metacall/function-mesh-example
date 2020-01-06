<div align="center">
    <a href="https://metacall.io" target="_blank"><img src="https://raw.githubusercontent.com/metacall/core/master/deploy/images/logo.png" alt="M E T A C A L L" style="max-width:100%;" width="32" height="32">
    <p><b>M E T A C A L L</b></p></a>
    <p>MetaCall complete example with Function Mesh between multiple programming languages.</p>
</div>

## Motivation

This example has been designed in order to illustrate the differences between the **[MetaCall Function Mesh](https://medium.com/@metacall/function-mesh-architecture-c0304ba4bad0)** and a typical Service Mesh such as [Istio](https://istio.io/docs/examples/bookinfo/).

The complexity of State of The Art Service Meshes makes it difficult to develop applications because it requires the developer to have knowledge in multiple areas of expertise. The plumbing becomes difficult and tedious, meanwhile with Function Mesh there is no plumbing, only function calls.

**[MetaCall Core](https://github.com/metacall/core)** allows to do call functions between languages and the plumbing and scalability is automatically done by the **[FaaS](https://metacall.io)**.

## Architecture Overview

![MetaCall Function Mesh Overview](/overview.png)

## Running the example with Docker

It is possible to run and test the **Function Mesh** locally through **MetaCall CLI** in Docker. So there is no need to install all dependencies in your environment.

`Docker`

``` sh
docker build -t metacall/function_mesh_example .
docker run -it metacall/function_mesh_example
```

`Docker Compose`

``` sh
docker-compose build
docker-compose run example
```

## Testing the example

Input commands are the ones after the `>` symbol (type `help` to show all command list).

``` sh
> load py frontend/frontend.py
Script (frontend/frontend.py) loaded correctly
> inspect
runtime node {
    module react {
        function ReactIndexPage(name)
    }
}
runtime py {
    module frontend {
        function convert(html)
        function index()
    }
}
> call index()
...
> call convert("<html><head><title>Example Html</title></head><body>Hello World</body></html>")
...
> exit
```
