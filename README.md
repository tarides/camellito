### Get Started

#### Using GitHub Codespaces

Click the green “Code” button, select the _Codespaces_ tab, and create your own.
Hopefully not too long after, you should be in VS Code inside your browser. Go
to the “TERMINAL” tab, extend it and run `dune test`. Tests should fail; this is
normal. You may need to install a missing dependency using the command `opam
install`.

#### Using [Replit](https://replit.com/)

You need to have a configured account at https://replit.com/

Click into “Create a Repl”, “Import from GitHub”, “From URL” (use
https://github.com/tarides/camellito) and select “Blank Repl” as template. Not
too long after, you should be able to edit the `lib/task.ml`. Pressing the green
“Run” button will launch the test cases.

### Read some Docs

So that you know, you'll be given access to the documentation you need to use to
complete the task. Please do not refer to other documentation.

### Code!

Open the files `lib/task.ml` and `lib/task.mli`.
* [`task.mli`](lib/task.mli) - describes what the functions should do.
* [`task.ml`](lib/task.ml) - write your code here.

**Tips**:

1. Code samples from the tutorials can be executed in the provided environment.
   Find the terminal tab, launch `utop` command. In the tutorials, copy
   expressions after `#`, including the `;;`. In Terminal-Utop, paste the
   expression and press `Return`. The output in the Utop should be the same as
   in the tutorial. You can also enter your expressions, try `2 + 2` for
   instance (always finish your input by `;;` and `Return`). Exit `utop` with
   `Ctrl+D` or `#quit;;`

1. You may have to delete more than the pragma and the `failwith`.

1. To implement the functions `split_words` and `split_lines` you can the module
   [`Str`](https://v2.ocaml.org/releases/5.1/api/Str.html) with the following
   regular expressions: `"\r?\n"` and `"\\(\\(\r?\n\\)\\| \\|\t\\)+"`

1. To implement the function `discuss_wc` you need to use the function
   [`Curly.get`](https://ocaml.org/p/curly/latest/doc/Curly/index.html#val-get)
   from package [`curly`](https://github.com/rgrinberg/curly). If you are using
   Codespace, you'll need to install it using Opam. If you are using Replit,
   it's already installed.

### Build and Test

Here is the command you need to type to build your code:
```shell
$ dune build
```

Here is the command you need to type to test your code:
```shell
$ dune test
```

### Mission Complete

Once all the tests are successfully passed, you've succeeded.
