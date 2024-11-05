// class Employee {
//   // Private properties
//   int? _id;
//   String? _name;
//
//   // Getter method to access private property _id
//   int getId() {
//     return _id!;
//   }
//   // Getter method to access private property _name
//   String getName() {
//     return _name!;
//   }
//   // Setter method to update private property _id
//   void setId(int id) {
//     this._id = id;
//   }
//   // Setter method to update private property _name
//   void setName(String name) {
//     this._name = name;
//   }
// }
class BankAccount{
  double calculateInterest(double balance){
    return balance * 0.02;
  }
}

class SavingAccount extends BankAccount{
  @override
  double calculateInterest(double balance){
    return balance * 0.05;
  }
}

void main(){
  BankAccount ba = BankAccount();
  print(ba.calculateInterest(2000));

  SavingAccount sa = SavingAccount();
  print(sa.calculateInterest(2000));

}