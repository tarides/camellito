(** Module [Tasks] contains the functions that need to be implemented.

    The file [task.mli] contains the signature and description of the functions.
    It should not be modified.

    Write your code in this file. Replace the dummy content [failwith "Not yet
    implemented"] by your code.

    The [[@warning "-27"]] pragma can be removed once a function is implemented.

{b Tips}:

1. Code samples from the tutorials can be executed in the provided environment.
   Find the terminal tab, launch [utop] command. In the tutorials, copy
   expressions after [#], including the [;;]. In Terminal-Utop, paste the
   expression and press [Return]. The output in the Utop should be the same as
   in the tutorial. You can also enter your expressions, try [2 + 2] for
   instance (always finish your input by [;;] and [Return]). Exit [utop] with
   [Ctrl+D] or [#quit;;]

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

(** TASK 1 - 4 test cases *)
let ignore _ = ()
(** Discards the value passed as argument and returns the unit value [()]. For
    instance, [ignore (f x)] discards the result of the function [f]. Side
    effects triggered by the evaluation of the argument are unchanged. *)

(** TASK 2 - 4 test cases *)
let map f u =
  let rec loop acc = function
  | [] -> acc
  | x :: u -> loop (f x :: acc) u in
    List.rev (loop [] u)
(** [map f [a1; ...; an]] applies function [f] to [[a1, ..., an]], and builds
    the list [[f a1; ...; f an]] with the results returned by [f]. *)

(** TASK 3 - 2 test cases *)
let span lo =
  let rec loop u i = if i < lo then u else loop (i :: u) (i - 1) in loop []
(** [span lo hi] returns a list of integers [[lo; lo + 1; ...; hi]]. It
    returns an empty list if [hi < lo]. *)

(** TASK 4 - 11 test cases *)
let split_lines = Str.(split (regexp "\r?\n"))
(** [split_lines s] returns a list of strings where each string is line in
    the string [s]. Lines are delimited either by carriage return (CR, 0x0d)
    followed by line feed (LF, 0x0a) or line feed alone. *)

(** TASK 5 - 21 test cases *)
let split_words = Str.(split (regexp "\\(\\(\r?\n\\)\\| \\|\t\\)+"))
(** [split_words s] returns a list of strings where each string is a word in
    [s]. Words are separated by any group of carriage return (CR, 0x0d), line
    feed (LF, 0x0a), space or tab characters. *)

let wc str =
  let line_count = str |> split_lines |> List.length in
  let word_count = str |> split_words |> List.length in
  let char_count = str |> String.length in
  (line_count, word_count, char_count)

(** TASK 6 - 0 test cases *)
let discuss_wc id =
  match Curly.get ("https://discuss.ocaml.org/raw/" ^ string_of_int id) with
  | Result.Error _ -> None
  | Result.Ok { body; _ } -> Some (wc body)
(** [discuss_wc id] fetches the thread [id] from https://dicuss.ocaml.org/ and
    returns its line, word and character counts. The thread is queried as raw
    markdown from url https://dicuss.ocaml.org/raw/id. *)
