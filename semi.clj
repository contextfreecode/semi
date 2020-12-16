(defn rot [turns]
  (let [rad (* 2.0 Math/PI turns)]
    [[(Math/cos rad) (- (Math/sin rad))] [(Math/sin rad) (Math/cos rad)]]))

(defn main []
  (let [sprite {:kind "robot", :pos [1.0 1.0]}
        view-pos "hi"]
    (println sprite)
    (println (rot (/ 1 4)))))

(main)

; let mat_vec_mul mat vec =
;   Array.map
;     (fun row -> Array.fold_left ( +. ) 0.0 (Array.map2 ( *. ) row vec))
;     mat

; let main () =
;   let sprite = { kind = "robot"; pos = [| 1.0; 1.0 |] } in
;   let view_pos = mat_vec_mul (rot (1.0 /. 4.0)) sprite.pos in
;   Format.printf "%s rotated to %s\n" sprite.kind (string_of_vec view_pos)
