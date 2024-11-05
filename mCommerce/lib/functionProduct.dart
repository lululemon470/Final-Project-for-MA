import 'dart:io';
import 'package:intl/intl.dart';

void main(){
  dynamic product = [];
  while (true){
    stdout.write("Input number of Product (0 = quit): ");
    int? tries = int.parse(stdin.readLineSync()!);
    print("=====================================");

    if (tries == 0){
      print("Thank for using our service! Bye...");
      break;
    }

    for(int i=1; i<=tries+1;i++){
      stdout.write("Enter Prouduct Name: ");
      String? name = stdin.readLineSync();
      stdout.write("Enter Prouduct QTY: ");
      int? qty = int.parse(stdin.readLineSync()!);
      stdout.write("Enter Prouduct Price: ");
      double price = double.parse(stdin.readLineSync()!);
      stdout.write("Enter Prouduct Discount(%): ");
      int? discount = int.parse(stdin.readLineSync()!);
      double doubleDiscount = discount.toDouble();
      print("=====================================");

      double tempTotal = price * qty;

      double subtotal = calculateDiscount(disprice: tempTotal, discount: doubleDiscount);

      product.add({"id":"${i++}","name":"$name","qty":qty,
        "price":price,"discount":discount,"subtotal":subtotal});
    }

    double total = 0;
    print("");
    print("                      Receipt                 ");
    print("");
    print("PID\t\tPName\t\tQty\t\tPrice\t\tDiscount(%)\t\tSubtotal");

    for(var item in product){
      print("${item['id']}\t\t${item['name']}\t\t${item['qty']}"
          "\t\t${item['price']}\t\t\t${item['discount']}\t\t\t\t${item['subtotal']} \$");
      total += item['subtotal'];
    }

    double tempRiel = convertToRiel(money: total, exchangeRate: 4100);
    String totalRiel = NumberFormat('#,##0').format(tempRiel);

    print("---------------------------------------------");
    print("Grand Total (\$)   =  $total \$");
    print("Grand Total (KHR) =  $totalRiel Riel");
    print("");
    print("=====================================");
  }
}


double calculateDiscount({required double disprice, required double discount}){
  double tempDiscount = (disprice * discount)/100;
  double subtotal = disprice - tempDiscount;
  return subtotal;
}

double convertToRiel({required double money, double exchangeRate = 4100}){
  double tempRiel = (money * exchangeRate);
  return tempRiel;
}