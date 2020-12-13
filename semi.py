from typing import List, NamedTuple


Vector = List[float]
Matrix = List[Vector]


class Sprite(NamedTuple):
    kind: str  # ;
    pos: Vector


def mat_vec_mul(mat: Matrix, vec: Vector) -> Vector:
    return [sum(a * b for a, b in zip(row, vec)) for row in mat]
    # result = []
    # for row in mat:
    #     sum_val = 0
    #     for (a, b) in zip(row, vec):
    #         sum_val += a * b
    #     result.append(sum_val)
    # return result


def rot(turn: float) -> Matrix:
    from math import cos, pi, sin

    rad = \
        2 * pi * turn
    # + 1
    return [[cos(rad), -sin(rad)], [sin(rad), cos(rad)]]


def main():
    sprite = Sprite(kind="robot", pos=[1.0, 1.0])
    view_pos = mat_vec_mul(rot(1 / 4), sprite.pos)
    print(f"{sprite.kind} rotated to {view_pos}")


if __name__ == "__main__":
    main()
