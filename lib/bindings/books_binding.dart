
import 'package:estaqim_school/controllers/books_controller.dart';
import 'package:get/get.dart';

class BooksBinding implements Bindings{
  @override
  void dependencies() {
    Get.put(BooksController());
  }

}