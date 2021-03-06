type Vector = number[];
type Matrix = Vector[];

type Sprite = {
  kind: string; // ,
  pos: Vector; // ,
};

function matVecMul(mat: Matrix, vec: Vector): Vector {
  // return mat.map((row) =>
  //   row.reduce((sum, value, index) => sum + value * vec[index], 0)
  // );
  let result = new Array(mat.length).fill(0) as Vector;
  for (let i = 0; i < mat.length; i += 1) {
    for (let j = 0; j < vec.length; j += 1) {
      result[i] += mat[i][j] * vec[j];
    }
  }
  return result;
}

function rot(turn: number): Matrix {
  let { PI, cos, sin } = Math;
  let rad = 2 * PI * turn;
  // + 1
  return [[cos(rad), -sin(rad)], [sin(rad), cos(rad)]];
}

function main() {
  let sprite = { kind: "robot", pos: [1, 1] } as Sprite;
  let viewPos = matVecMul(rot(1 / 4), sprite.pos);
  console.log(`${sprite.kind} rotated to ${viewPos}`);
}

main();
