open OUnit2

let sq x = x * x

let ignore = [
  "unit" >:: (fun _ -> assert_equal () (Task.ignore ()));
  "42" >:: (fun _ -> assert_equal () (Task.ignore 42));
  "apply" >:: (fun _ -> assert_equal () (Task.ignore (sq 3)));
  "print" >:: (fun _ -> assert_equal () (Task.ignore (print_newline ())));
]

let map = [
  "nil" >:: (fun _ -> assert_equal [] (Task.map sq []));
  "sq" >:: (fun _ -> assert_equal [1; 4; 9] (Task.map sq [1; 2; 3]));
  "id" >:: (fun _ -> assert_equal [1; 2; 3] (Task.map Fun.id [1; 2; 3]));
  "then" >:: (fun _ -> assert_equal ([1; 2; 3] |> Task.map (( + ) 1) |> Task.map sq) (Task.map (fun x -> x |> ( + ) 1 |> sq) [1; 2; 3]));
]

let span = [
  "nil" >:: (fun _ -> assert_equal [] (Task.span 7 3));
  "cons" >:: (fun _ -> assert_equal [3; 4; 5] (Task.span 3 5));
]

let split_lines = [
  "@0" >:: (fun _ -> assert_equal [] (Task.split_lines ""));
  "@1" >:: (fun _ -> assert_equal [] (Task.split_lines "\n"));
  "@2" >:: (fun _ -> assert_equal [] (Task.split_lines "\r\n"));
  "@3" >:: (fun _ -> assert_equal [""] (Task.split_lines "\n\n"));
  "@4" >:: (fun _ -> assert_equal [""] (Task.split_lines "\r\n\r\n"));
  "@5" >:: (fun _ -> assert_equal ["foo"; "bar"] (Task.split_lines "foo\nbar"));
  "@6" >:: (fun _ -> assert_equal ["foo"; "bar"] (Task.split_lines "\nfoo\nbar"));
  "@7" >:: (fun _ -> assert_equal ["foo"; "bar"] (Task.split_lines "foo\nbar\n"));
  "@8" >:: (fun _ -> assert_equal [""; "foo"; "bar"] (Task.split_lines "\n\nfoo\nbar"));
  "@9" >:: (fun _ -> assert_equal ["foo"; ""; "bar"] (Task.split_lines "foo\n\nbar"));
  "@a" >:: (fun _ -> assert_equal ["foo"; "bar"; ""] (Task.split_lines "foo\nbar\n\n"));
]

let split_words = [
  "@00" >:: (fun _ -> assert_equal [] (Task.split_words ""));
  "@01" >:: (fun _ -> assert_equal [] (Task.split_words " "));
  "@02" >:: (fun _ -> assert_equal [] (Task.split_words "\n"));
  "@03" >:: (fun _ -> assert_equal [] (Task.split_words "\t"));
  "@04" >:: (fun _ -> assert_equal [] (Task.split_words "\r\n"));
  "@05" >:: (fun _ -> assert_equal [] (Task.split_words "  "));
  "@06" >:: (fun _ -> assert_equal [] (Task.split_words "\n\n"));
  "@07" >:: (fun _ -> assert_equal [] (Task.split_words "\t\t"));
  "@08" >:: (fun _ -> assert_equal [] (Task.split_words "\r\n\r\n"));
  "@09" >:: (fun _ -> assert_equal ["foo"; "bar"] (Task.split_words "foo bar"));
  "@0a" >:: (fun _ -> assert_equal ["foo"; "bar"] (Task.split_words "foo\nbar"));
  "@0b" >:: (fun _ -> assert_equal ["foo"; "bar"] (Task.split_words "foo\tbar"));
  "@0c" >:: (fun _ -> assert_equal ["foo"; "bar"] (Task.split_words "foo\r\nbar"));
  "@0d" >:: (fun _ -> assert_equal ["foo"; "bar"] (Task.split_words " foo bar"));
  "@0e" >:: (fun _ -> assert_equal ["foo"; "bar"] (Task.split_words "\nfoo bar"));
  "@0f" >:: (fun _ -> assert_equal ["foo"; "bar"] (Task.split_words "\tfoo bar"));
  "@10" >:: (fun _ -> assert_equal ["foo"; "bar"] (Task.split_words "\r\nfoo bar"));
  "@11" >:: (fun _ -> assert_equal ["foo"; "bar"] (Task.split_words "foo bar "));
  "@12" >:: (fun _ -> assert_equal ["foo"; "bar"] (Task.split_words "foo bar\n"));
  "@13" >:: (fun _ -> assert_equal ["foo"; "bar"] (Task.split_words "foo bar\t"));
  "@14" >:: (fun _ -> assert_equal ["foo"; "bar"] (Task.split_words "foo bar\r\n"));
]

let raw_10958 = In_channel.with_open_text "10958.md" In_channel.input_all

let task_wc str =
  let line_count = str |> Task.split_lines |> List.length in
  let word_count = str |> Task.split_words |> List.length in
  let char_count = str |> String.length in
  (line_count, word_count, char_count)

let wc = [
  "10958" >:: (fun _ -> assert_equal (1294, 14267, 90535) (task_wc raw_10958));
]

let discuss_wc = []

let () = "Task" >::: [
  "ignore" >::: ignore;
  "map" >::: map;
  "span" >::: span;
  "split_lines" >::: split_lines;
  "split_words" >::: split_words;
  "wc" >::: wc;
  "discuss_wc" >::: discuss_wc;
] |> run_test_tt_main
