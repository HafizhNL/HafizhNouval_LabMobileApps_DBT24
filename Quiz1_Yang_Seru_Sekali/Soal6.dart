class Account {
  int balance = 0;

  void deposit(int amountMoney) {
    balance += amountMoney;
  }

  void withdraw(int amountMoney) {
    if (balance >= amountMoney) {
      balance -= amountMoney;
    } else {
      print('minus balance');
    }
  }
}

void main() {
  Account bank = Account();

  bank.deposit(10000);
  print("Final balance after deposit: ${bank.balance}");

  bank.withdraw(500);
  print("Final balance after withdraw: ${bank.balance}");

  bank.withdraw(10000);
  print("Final balance after withdraw: ${bank.balance}");


}