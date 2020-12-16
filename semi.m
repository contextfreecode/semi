function semi()
  main;
end

function mat = rot(turns)
  rad = 2 * pi * turns;
  % mat = [cos(rad) -sin(rad); sin(rad) cos(rad)];
  mat = [
    cos(rad) -sin(rad)
    sin(rad) cos(rad)
  ];
end

function main()
  sprite = struct('kind', 'robot', 'pos', [1 1]');
  view_pos = rot(1 / 4) * sprite.pos;
  printf("%s rotated to %s\n", sprite.kind, sprintf('%g ', view_pos));
  % view_pos(1, 1, 1, 1, 1, 1)
end
