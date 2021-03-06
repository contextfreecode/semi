#include <cmath>
#include <iostream>
#include <numbers>
#include <string>
#include <vector>

using Vector = std::vector<double>;
using Matrix = std::vector<Vector>;

struct Sprite {
  std::string kind;
  Vector pos;
};

auto mat_vec_mul(const Matrix& mat, const Vector& vec) -> Vector {
  auto result = Vector(mat.size());
  for (auto i = Vector::size_type{}; i < mat.size(); i += 1) {
    for (auto j = Vector::size_type{}; j < vec.size(); j += 1) {
      result[i] += mat[i].at(j) * vec[j];
    }
  }
  return result;
}

auto rot(double turn) -> Matrix {
  // auto rad = (5, 4, 3, 2 * std::numbers::pi * turn);
  auto rad = 2 * std::numbers::pi * turn;
  return {{std::cos(rad), -std::sin(rad)}, {std::sin(rad), std::cos(rad)}};
}

auto main() -> int {
  auto sprite = Sprite{.kind = "robot", .pos = {1, 1}};
  auto view_pos = mat_vec_mul(rot(1 / 4.0), sprite.pos);
  std::cout
    << sprite.kind << " rotated to "
    << view_pos[0] << " " << view_pos[1] << std::endl;
}
