program Semi;

type
  TVector = array of Real;
  TMatrix = array of TVector;
  TSprite = record
    Kind: String;
    Pos: TVector;
  end;

var
  sprite: TSprite = (Kind: 'robot'; Pos: (1, 1));
  viewPos: TVector;

function MatVecMul(mat: TMatrix; vec: TVector): TVector;
var i, j: Integer;
begin
  MatVecMul := nil;
  SetLength(MatVecMul, Length(mat));
  for i := 0 to Length(mat) - 1 do begin
    for j := 0 to Length(vec) - 1 do begin
      MatVecMul[i] := MatVecMul[i] + mat[i][j] * vec[j];
    end
  end
  // WriteLn('result length ', Length(MatVecMul))
end;

function Rot(turn: real): TMatrix;
var rad: Real;
begin
  rad := 2 * Pi * turn;
  Rot := TMatrix.Create(
    TVector.Create(Cos(rad), -Sin(rad)),
    TVector.Create(Sin(rad), Cos(rad))
  )
end;

begin
  viewPos := MatVecMul(Rot(1 / 4), sprite.Pos);
  WriteLn(sprite.Kind, ' rotated to ', viewPos[0], viewPos[1])
end.
