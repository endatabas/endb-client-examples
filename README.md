# endb-client-examples

This repo contains trivial "clients" (toy REPLs) for trying out
[Endatabas](https://github.com/endatabas/endb).
These are not to be taken seriously.

## Config

See the [HTTP API on docs.endatabas.com](https://docs.endatabas.com/tutorial/http_api.html#accept-headers)
to see which MIME types you can set on your accept headers,

## Running

```sh
git clone https://github.com/endatabas/endb-client-examples.git
cd endb-client-examples
```

### Bash:

```sh
./endb-repl.sh
```

Once you've selected a MIME type for your results, enter a single SQL statement.

### Ruby:

```sh
gem install tty-prompt
vim repl.yaml # to set MIME type, if you want
./endb-repl.rb
```

See [docs.endatabas.com/tutorial](https://docs.endatabas.com/tutorial/sql.html)
for help.

## Copyright and License

Copyright 2023 Steven Deobald and Håkan Råberg.

Licensed under the Apache License Version 2.0.
