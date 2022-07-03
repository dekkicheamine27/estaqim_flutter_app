import 'package:estaqim_school/models/book.dart';
import 'package:get/get.dart';
import '../services/books_service.dart';

class BooksController extends GetxController with StateMixin {
  BooksService bookService = BooksService();
  RxList<Book> books = RxList<Book>();

  getBooks(int id) {
    if (books.isEmpty) {
      bookService.getAllBooks(id).then((resultbooks) {
        books.addAll(resultbooks);
        change(books, status: RxStatus.success());
      });

    }else{
      books = RxList<Book>();
      bookService.getAllBooks(id).then((resultbooks) {
        books.addAll(resultbooks);
        change(books, status: RxStatus.success());
      });

    }
    update();
  }
}
