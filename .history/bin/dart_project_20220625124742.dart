import 'dart:io';

main() {
  print("------------------------------------");
  print("Wellcome To Our library");
  print("------------------------------------");
  print(
      "Note: You can search for the book using the ways below by Writing The Word inside the brackets");
  print("1- The (Name) For the Book");
  print("2- (ID) for the Book");
  print("3- The (Author) Name ");
  String User = (stdin.readLineSync().toString());

//Class Name
  if (User == "Name") {
    print("------------------------------------");
    print("ID:     Book Name:               Author Name:    ");
    print("1       Sinek Start wi           Simon Sinek     ");
    print("2       But how do it Know       J. Clark Scott");
    print("3       Clean Code               Rpbert Cecil Martin ");
    print("4       Zero to One              Peter Thiel");
    print("------------------------------------");
    print("Please Write The Name For The Book:");

    String Name = (stdin.readLineSync().toString());
    print("You wrote :$Name");
    print("is That Correct ?");
    //Using Siwtch with IF Statment
    String answer = (stdin.readLineSync().toString());
    if (answer == "yes" && Name == "Sinek Start wi") {
      print(
          "You choose : ID:1     Book Name:Sinek Start wi                Author Name:Simon Sinek                 Price:80SAR           Quantity:13 ");
    } else if (answer == "yes" && Name == "But how do it Know") {
      print(
          "You choose : ID:2    Book: Name:But how do it Know            Author Name:J. Clark Scott              Price:59.9SAR         Quantity:22 ");
    } else if (answer == "yes" && Name == "Clean Code") {
      print(
          "You choose : ID:3    Book Name:Clean Code                     Author Name: Rpbert Cecil Martin        Price:50SAR           Quantity:5");
    } else if (answer == "yes" && Name == "Zero to One") {
      print(
          "You choose : ID:4    Book Name:  Zero to One                  Author Name: Peter Thiel                Price:45SAR           Quantity:12");
    }
  } else {
    print("The Problem in Class Name Please Try Again");
  } //put "brake" when you using Switch

//-----------------------------------------------------------------------------------------------------------

//Class ID
  if (User == "ID") {
    print("------------------------------------");
    print("ID:     Book Name:               Author Name:    ");
    print("1       Sinek Start wi           Simon Sinek     ");
    print("2       But how do it Know       J. Clark Scott");
    print("3       Clean Code               Rpbert Cecil Martin ");
    print("4       Zero to One              Peter Thiel");
    print("------------------------------------");
    print("Please Write The ID Number For The Book:");
    String ID = (stdin.readLineSync().toString());
    print("You wrote :$ID");
    print("is That Correct ?");
    //Using Siwtch with IF Statment
    String answer = (stdin.readLineSync().toString());
    if (answer == "yes" && ID == "1") {
      print(
          "You choose : ID:1       Book Name:Sinek Start wi            Author Name:Simon Sinek  ");
    } else if (answer == "yes" && ID == "2") {
      print(
          "You choose : ID:2     Book: Name:But how do it Know            Author Name:J. Clark Scott  ");
    } else if (answer == "yes" && ID == "3") {
      print(
          "You choose : ID:3     Book Name:Clean Code           Author Name: Rpbert Cecil Martin  ");
    } else if (answer == "yes" && ID == "4") {
      print(
          "You choose : ID:4    Book Name:  Zero to One           Author Name: Peter Thiel  ");
    }
  } else {
    print("The Problem in Class ID Please Try Again");
  } //put "brake" when you using Switch

//-----------------------------------------------------------------------------------------------------------

//Class Autour
  if (User == "Author") {
    print("------------------------------------");
    print("ID:     Book Name:               Author Name:    ");
    print("1       Sinek Start wi           Simon Sinek     ");
    print("2       But how do it Know       J. Clark Scott");
    print("3       Clean Code               Rpbert Cecil Martin ");
    print("4       Zero to One              Peter Thiel");
    print("------------------------------------");
    print("Please Write The Author Name For The Book:");
    String Author = (stdin.readLineSync().toString());
    print("You wrote :$Author");
    print("is That Correct ?");
    //Using Siwtch with IF Statment
    String answer = (stdin.readLineSync().toString());
    if (answer == "yes" && Author == "Simon Sinek") {
      print(
          "You choose : ID:1       Book Name:Sinek Start wi            Author Name:Simon Sinek  ");
    } else if (answer == "yes" && Author == "J.Clark Scott") {
      print(
          "You choose : ID:2     Book: Name:But how do it Know            Author Name:J. Clark Scott  ");
    } else if (answer == "yes" && Author == "Rpbert Cecil Martin") {
      print(
          "You choose : ID:3     Book Name:Clean Code           Author Name: Rpbert Cecil Martin  ");
    } else if (answer == "yes" && Author == "Peter Thiel") {
      print(
          "You choose : ID:4    Book Name:  Zero to One           Author Name: Peter Thiel  ");
    }
  } else {
    print("The Problem in Class Author Please Try Again");
  } //put "brake" when you using Switch
}
