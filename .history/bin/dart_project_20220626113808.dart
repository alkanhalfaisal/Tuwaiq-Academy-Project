import 'dart:io';
import 'BookStore.dart';
import 'EBook.dart';
import 'PhysicalBook.dart';
import 'book.dart';

main() {
  BookStore ourStore =
      BookStore(); // our Book Store where all books and other information will be saved here
  String User = '0';
  do {
    print("*-----------------------------------*");
    print('|                                   |');
    print("|      Wellcome To Our library      |");
    print('|                                   |');
    print("*-----------------------------------*");
    print('');
    print('> Please choose the service you want');
    print('');
    print("*-----------------------------------*");
    print("|  1- Add PhysicalBook              |");
    print("|  2- Add eBook                     |");
    print("|  3- Remove book from BookStore    |");
    print("|  4- Show all books in BookStore   |");
    print("|  5- search a book in BookStore    |");
    print("|  6- Buy PhysicalBook              |");
    print("|  0- Exit                          |");
    print("*-----------------------------------*");

    User = (stdin.readLineSync().toString());
    switch (User) {
      case '1': //Add PhysicalBook
        {
          print('please enter title of the book');
          String title = (stdin.readLineSync().toString());
          print('please enter Quantity');
          String Quantity = (stdin.readLineSync().toString());
          int Quantity_int = int.parse(Quantity);
          print('please enter price');
          String price = (stdin.readLineSync().toString());
          double price_double = double.parse(price);
          print('please enter author name');
          String author = (stdin.readLineSync().toString());

          PhysicalBook addedBook = PhysicalBook(
              (ourStore.books.length + 1).toString(),
              title,
              Quantity_int,
              price_double,
              author);
          ourStore.addBook(addedBook);
          break;
        }
      case '2': //Add eBook
        {
          print('please enter title of the book');
          String title = (stdin.readLineSync().toString());
          print('please enter price');
          String price = (stdin.readLineSync().toString());
          double price_double = double.parse(price);
          print('please enter author name');
          String author = (stdin.readLineSync().toString());
          EBook addedEbook = EBook(
              id: (ourStore.books.length + 1).toString(),
              title: title,
              price: price_double,
              author: author);
          ourStore.addBook(addedEbook);
          break;
        }
      case '3': //Remove book from BookStore
        {
          print('Do you want to delete by name or by id? ');
          User = (stdin.readLineSync().toString());
          if (User == 'name' || User == 'Name') {
            print('Please Enter name of the book you want to remove');
            User = (stdin.readLineSync().toString());
            ourStore.removeBookByTitle(User);
          } else if (User == 'id' || User == 'Id' || User == 'ID') {
            print('Please Enter ID of the book you want to remove');
            User = (stdin.readLineSync().toString());
            ourStore.removeBookById(User);
          } else {
            print('please enter either id or name');
          }
          break;
        }
      case '4': //Show all books in BookStore
        {
          ourStore.listAllBook();
          break;
        }
      case '5': //search a book in BookStore
        {
          print(
              'Do you want to search by: (Please enter your choice ex:titlt,id etc)');
          print('1-Title');
          print('2-ID');
          print('3-Author');
          User = (stdin.readLineSync().toString());
          if (User == 'Title' || User == 'title') {
            print('Please enter the title you want search about');
            User = (stdin.readLineSync().toString());
            ourStore.searchByTitle(User).bookInfo();
          } else if (User == 'id' || User == 'ID' || User == 'Id') {
            print('Please enter the ID you want search about');
            User = (stdin.readLineSync().toString());
            ourStore.searchById(User).bookInfo();
          } else if (User == 'Author' || User == 'author') {
            print('Please enter the author name you want search about');
            User = (stdin.readLineSync().toString());
            if (ourStore.searchByAuthor(User).length != 0) {
              for (Book book in ourStore.searchByAuthor(User)) {
                book.bookInfo();
              }
            } else {
              print('Author: ${User} dont have any book in our bookstore');
            }
          }
          break;
        }
      case '6': //Buy PhysicalBook
        {
          print('You wants to buy by ID or title');
          User = (stdin.readLineSync().toString());
          if (User == 'ID' || User == 'id' || User == 'Id') {
            print('Please enter the id of the book you want to buy');
            User = (stdin.readLineSync().toString());
            ourStore.buyPhysicalBookByID(User);
          } else if (User == 'title' || User == 'Title') {
            print('Please enter the name of the book you want to buy');
            User = (stdin.readLineSync().toString());
            ourStore.buyPhysicalBookByTitle(User);
          } else {
            print('please enter either id or title');
          }

          break;
        }
    }
  } while (User != '0'); // if the user enter 0 we will close the app
}
