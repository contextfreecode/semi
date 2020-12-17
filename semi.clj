(defn mat-vec-mul [mat vec]
  (mapv (fn [row] (reduce + (mapv * row vec))) mat))

(defn rot [turns]
  (let [rad (* 2.0 Math/PI turns)]
    [[(Math/cos rad) (- (Math/sin rad))] [(Math/sin rad) (Math/cos rad)]]))

(defn main []
  (let [sprite {:kind "robot", :pos [1.0 1.0]}
        view-pos (mat-vec-mul (rot (/ 1 4)) (sprite :pos))]
    (println (sprite :kind) "rotated to" view-pos)))  ; ,,,,,,

(main)
