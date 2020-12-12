program Semi;

type
  TVector = array of Real;
  TMatrix = array of TVector;
  TSprite = record
    kind: String;
    pos: TVector;
  end;

var
  sprite: TSprite = (kind: 'robot'; pos: (1, 1));
  viewPos: TVector;
  // transform: Array[1..2, 1..2] of Real = ((1, 2), (3, 4));

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

function Rot(frac: real): TMatrix;
var rad: Real;
begin
  rad := Pi * frac;
  Rot := TMatrix.create(
    TVector.create(Cos(rad), -Sin(rad)),
    TVector.create(Sin(rad), Cos(rad))
  )
end;

begin
  viewPos := MatVecMul(Rot(0.5), sprite.pos);
  WriteLn(sprite.kind, ' rotated to ', viewPos[0], viewPos[1])
end.
