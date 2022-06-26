import 'book.dart';

class EBook implements Book {
  // electronic book
  @override
  String? id;

  @override
  String? title;

  @override
  double? price;

  @override
  String? author;
  EBook({this.id, this.title, this.price, this.author});

  @override
  sell() {
    // we dont have limit or quantity for ebook so we will download the book for the user if he buy it
    print('download eBook');
    return price;
  }

  bookInfo() {
    print(
        'ID: ${this.id}  Title: ${this.title}   Price: ${this.price}    Author: ${this.author}    Type:${this.runtimeType.toString()}');
  }
}
