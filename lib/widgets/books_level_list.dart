import 'package:estaqim_school/bindings/course_binding.dart';
import 'package:estaqim_school/views/courses_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/book.dart';

class BooksList extends StatelessWidget {
  final List<Book> books;

  BooksList({required this.books});


  @override
  Widget build(BuildContext context) {
    return Center(

      child: GridView.builder(

          itemCount: books.length,
          itemBuilder: (BuildContext context, int position ){
            return MaterialButton(
                child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    decoration: BoxDecoration(
                        color: Colors.teal,
                        borderRadius: BorderRadius.circular(15)),
                    alignment: Alignment.center,
                    child: Text(books[position].title!, style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),)),
                onPressed: (){
                    Get.to(()=>CoursesPage(bookId: books[position].id!, bookName: books[position].title!), binding: CourseBinding());
                }
            );
          }, gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      ),
    );
  }
}
