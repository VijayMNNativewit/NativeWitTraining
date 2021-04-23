void main() {}

dynamic func1() {
  print('Hello Func1');
}

dynamic func2() {
  func1();
}

dynamic func3() =>
    {
      0: func1(),
      0: func2(),
    };
// [] -> List
// {} -> single value -> Set
// {:} -> key:value -> Map

// () {} -> Single/Multi line function
// () => val -> lambda function
// () => {,}

// () { return val; } = () => val;

dynamic funcx () => func1();
