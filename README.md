# PicoLisp Docker Build

The Dockerfile specifies an image based on `ubuntu:latest` with 32-bit [PicoLisp](https://picolisp.com/wiki/?home) installed. It creates a `pico` user with a `/home/pico` directory and `pil` and `picolisp` commands on the `PATH`.

## Docker Build

``` shell
docker build -t semperos/picolisp .
```

## Docker Run

Ubuntu is used as the base because PicoLisp provides a relatively rich CLI REPL experience, so running the Docker image interactively is useful. PicoLisp also has built-in HTTP server support, so the Dockefile exposes 8080 and you can map it to whatever local port you want. If you mount a local directory, the `pico` user's shell history (including PicoLisp REPL history) will be saved.

``` shell
docker run --rm -t -i -p <local-port>:8080 -v <local-dir>:/home/pico semperos/picolisp
```

Caveat: PicoLisp's "GUI" functionality (which relies entirely on an HTTP server/client combination) exposes ports dynamically. You will not be able to leverage PicoLisp's GUI functionality with this Docker image, since I was not willing to expose and map a 20k+ port range.

In addition to PicoLisp, curl and vim are made available in the image. PicoLisp's REPL uses vim directly for certain advanced editing features.

## License

Copyright © 2018 Daniel Gregoire.

Licensed under either of

 * Apache License, Version 2.0, ([LICENSE-APACHE](LICENSE-APACHE) or http://www.apache.org/licenses/LICENSE-2.0)
 * MIT license ([LICENSE-MIT](LICENSE-MIT) or http://opensource.org/licenses/MIT)

at your option.
