(** Module [Tasks] contains the functions that need to be implemented.

    This file, [task.mli] contains the signature and description of the
    functions. It should not be modiled. Write your code in the [task.ml] file.

    Write your functions in the file [task.ml]. Replace the dummy content
    [failwith "Not yet implemented"] by your code.

    The [[@warning "-27"]] pragma can be removed once a function is implemented.

{b Tips}:

1. Code samples from the tutorials can be executed in the provided environment.
   Find the terminal tab, launch [utop] command. In the tutorials, copy
   expressions between [#] and [;;]. In Terminal-Utop, paste the expression and
   press enter. The output in the Utop should be the same as in the tutorial.
   You can also enter your expressions, try [2 + 2] for instance (always finish
   your input by [;;] and enter).

2. You may have to delete more than the pragma and the [failwith].

3. To implement the functions `split_words` and `split_lines` you can the module
   {{:https://v2.ocaml.org/releases/5.1/api/Str.html}[Str]} with the following
   regular expressions: ["\r?\n"] and ["\\(\\(\r?\n\\)\\| \\|\t\\)+"]

4. To implement the function `discuss_wc` you need to use the function
   {{:https://ocaml.org/p/curly/latest/doc/Curly/index.html#val-get}[Curly.get]}
   from package {{:https://github.com/rgrinberg/curly}curly}. If you are using
   Codespace, you'll need to install it using Opam. If you are using Replit,
   it's already installed.

*)

val ignore : 'a -> unit
(** Discards the value passed as argument and returns the unit value [()]. For
    instance, [ignore (f x)] discards the result of the function [f]. Side
    effects triggered by the evaluation of the argument are unchanged. *)

val map : ('a -> 'b) -> 'a list -> 'b list
(** [map f [a1; ...; an]] applies function [f] to [[a1, ..., an]], and builds
  the list [[f a1; ...; f an]] with the results returned by [f].
 *)

val range : int -> int -> int list
(** [range lo hi] returns a list of integers [[lo; lo + 1; ...; hi]]. It
  returns an empty list if [hi < lo]. *)

val split_lines : string -> string list
(** [split_lines s] returns a list of strings where each string is line in
    the string [s]. Lines are delimited either by carriage return (CR, 0x0d)
    followed by line feed (LF, 0x0a) or line feed alone. *)

val split_words : string -> string list
(** [split_words s] returns a list of strings where each string is a word in
    [s]. Words are separated by any group of carriage return (CR, 0x0d), line
    feed (LF, 0x0a), space or tab characters. *)

val discuss_wc : int -> (int * int * int) option
(** [discuss_wc id] fetches the thread [id] from https://dicuss.ocaml.org/ and
    returns its line, word and character counts. The thread is queried as raw
    markdown from url https://dicuss.ocaml.org/raw/id. *)
