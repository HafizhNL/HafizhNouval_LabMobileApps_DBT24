class Account {
  int balance = 0;

  void deposit(int amount) {
    balance += amount;
  }

  void withdraw(int amount) {
    if (balance >= amount) {
      balance -= amount;
    } else {
      print('Insufficient balance');
    }
  }
}

void main() {
  Account bank = Account();

  bank.deposit(10000);
  print("Final balance after deposit: ${bank.balance}");

  bank.withdraw(500);
  print("Final balance after withdraw: ${bank.balance}");


}