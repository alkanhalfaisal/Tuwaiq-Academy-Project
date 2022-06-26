import 'book.dart';

class PhysicalBook implements Book {
  @override
  String? id;

  @override
  String? title;

  @override
  double? price;

  @override
  String? author;
  int quantity = 0; // how much do we have for this books in our inventory

  PhysicalBook(this.id, this.title, this.quantity, this.price, this.author);

  double getPrice() {
    return price!;
  }

  void setPrice(double price) {
    this.price = price;
  }

  @override
  sell() {
    if (quantity > 0) {
      // if we have the book in our inventory
      quantity = quantity - 1;
      return price;
    } else {
      print('Sorry, the book is not available at the moment');
    }
  }

  @override
  bookInfo() {
    print(
        'ID: ${this.id}  Title: ${this.title}   Price: ${this.price}    Author: ${this.author}    Quantity: ${this.quantity}    Type:${this.runtimeType.toString()}');
  }
}
