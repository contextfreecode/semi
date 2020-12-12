program Semi;

type
  TPerson = record
    name: string;
    age: integer;
  end;

var
  i: integer;
  person: TPerson = (
    name: 'Alice';
    age: 42
  );
  transform: array[1..2, 1..2] of real = ((1, 2), (3, 4));

begin
  person.name := 'Betty';
  for i := 1 to 2 do
  begin
    person.age := person.age + i;
  end;
  writeln(person.name, ' is ', person.age, ' years old.')
end.
