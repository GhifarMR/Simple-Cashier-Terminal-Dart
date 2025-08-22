import 'dart:io';

void main() {
  var totalItems;
  double total = 0, discount;

  stdout.write("Input total items: ");
  totalItems = int.parse(stdin.readLineSync()!);

  if (totalItems < 1) {
    print("Minimum 1 items");
    return;
  }

  List<String?> itemList = [];
  List<double> priceList = [];
  List<int> qtyList = [];
  List<double> subtotalList = [];

  for (int i = 0; i < totalItems; i++) {
    stdout.write("Item name: ");
    var item = stdin.readLineSync();
    itemList.add(item);

    stdout.write("Input quantity: ");
    int qty = int.parse(stdin.readLineSync()!);
    qtyList.add(qty);

    stdout.write("Input price (USD): ");
    double price = double.parse(stdin.readLineSync()!);
    priceList.add(price);

    double subtotal = price * qty;
    subtotalList.add(subtotal);

    total += subtotal;
  }

  print("\n----- RECEIPT -----");
  for (int i = 0; i < totalItems; i++) {
    print(
        "${itemList[i]} (x${qtyList[i]}): \$${priceList[i].toStringAsFixed(2)} "
        "= \$${subtotalList[i].toStringAsFixed(2)}");
  }

  print("\nSubtotal : \$${total.toStringAsFixed(2)}");

  if (total > 1000) {
    discount = 0.20 * total;
    print("Discount : 20%");
  } else if (total > 750) {
    discount = 0.15 * total;
    print("Discount : 15%");
  } else if (total > 500) {
    discount = 0.10 * total;
    print("Discount : 10%");
  } else if (total > 300) {
    discount = 0.05 * total;
    print("Discount : 5%");
  } else {
    discount = 0;
    print("Discount : 0%");
  }

  var amount = total - discount;
  print("Total : \$${amount.toStringAsFixed(2)}");
  print("\n--------------------");
}
