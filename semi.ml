type vector = float array

type matrix = vector array

type sprite = { kind : string; pos : vector }

let mat_vec_mul mat vec =
  Array.map
    (fun row -> Array.fold_left ( +. ) 0.0 (Array.map2 ( *. ) row vec))
    mat

(* Format.printf "result length %d\n" (Array.length result); *)

let rot turns : matrix =
  let rad = 2.0 *. Float.pi *. turns in
  [|
    [| Float.cos rad; ~-.(Float.sin rad) |]; [| Float.sin rad; Float.cos rad |];
  |]

let string_of_vec vec =
  String.concat " " (Array.to_list (Array.map string_of_float vec))

let main () =
  let sprite = { kind = "robot"; pos = [| 1.0; 1.0 |] } in
  let view_pos = mat_vec_mul (rot (1.0 /. 4.0)) sprite.pos in
  Format.printf "%s rotated to %s\n" sprite.kind (string_of_vec view_pos)

(* let () = *)

;;
main ()
