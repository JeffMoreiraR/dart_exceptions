void stackStart() {
  //double amout = double.parse("25,33");

  print("Started Main");
  functionOne();
}

void functionOne() {
  print("Started F01");
  try {
    functionTwo();
    print("TESTE AQUI!");
  } catch (exception, stackTrace){
    print(stackTrace);
    rethrow;
  }finally{
    print("CHEGUEI NO FINALLY");
  }
  print("Finished F01");
}

void functionTwo() {
  print("Started F02");
  for (int i = 1; i <= 5; i++) {
    print(i);
    double amount = double.parse("not a number");
  }
  print("Finished F02");
}
