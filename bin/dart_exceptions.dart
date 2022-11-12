import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void main() {
  //Função criada pra testar NullSafety
  //testingNullSafety();

  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: false));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 500);

    // Observando resultado
    if (result) {
      print("Transação realizada com sucesso!");
    }
  } on SenderIdInvalidException catch (e) {
    print(e);
    print("O ID ${e.idSender} do remente não é um ID válido.");
  } on ReceiverIdInvalidException catch (e) {
    print(e);
    print("O ID ${e.idReceiver} do destinatário não é um ID válido.");
  } on SenderNotAuthenticatedException catch (e) {
    print(e);
    print("O ID ${e.idSender} não está autenticado!");
  } on SenderBalanceLowerThanAmountException catch (e) {
    print(e);
    print(
        "O saldo do ID ${e.idSender} é insuficiente, saldo atual R ${e.balanceSender}");
  } on ReceiverNotAuthenticatedException catch (e) {
    print(e);
    print("O ID ${e.idReceiver} não está autenticado!");
  } on Exception {
    print("Algo deu errado!");
  }
}

void testingNullSafety() {
  Account? myAccount =
      Account(name: "Jefferson", balance: 5000, isAuthenticated: true);

  Random randomNumber = Random();

  if (randomNumber.nextInt(10) % 2 == 0) {
    myAccount.createdAt = DateTime.now();
  }

  if (myAccount != null) {
    print(myAccount.balance);
    if (myAccount.createdAt != null) {
      print(myAccount.createdAt!.day);
    }
  } else {
    print("Conta nula");
  }

  // print(myAccount != null ? myAccount.balance : "Conta Nula");
  //print(myAccount?.balance);
}
