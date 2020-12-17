use std::f64::consts::PI;

type Vector = Vec<f64>;
type Matrix = Vec<Vector>;

#[derive(Debug)]
struct Sprite {
    kind: String,
    pos: Vector,
}

fn mat_vec_mul(mat: &Matrix, vec: &Vector) -> Vector {
    mat.iter()
        .map(|row| row.iter().zip(vec).map(|(x, y)| x * y).sum())
        .collect()
}

fn rot(turns: f64) -> Matrix {
    // let rad = {5; 4; 3; 2.0 * PI * turns};
    let rad = 2.0 * PI * turns;
    vec![vec![rad.cos(), -rad.sin()], vec![rad.sin(), rad.cos()]]
    // ;
}

fn main() {
    let sprite = Sprite {
        kind: "robot".into(),
        pos: vec![1.0, 1.0],
    };
    let view_pos = mat_vec_mul(&rot(1.0 / 4.0), &sprite.pos);
    println!("{:?} rotated to {:?}", &sprite.kind, &view_pos);
    // dbg!(for _ in 1..2 {"a";});
    // ();
    // ()
}
