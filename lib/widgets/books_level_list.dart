import 'package:estaqim_school/bindings/course_binding.dart';
import 'package:estaqim_school/views/courses_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../models/book.dart';


class BooksList extends StatelessWidget {
  final List<Book> books;

  BooksList({required this.books});

  List<Color> listColor = [
    Color(0xff003459),
    Color(0xff007ea7 ),

    Color(0xff161b33),
    Color(0xff355070),


    Color(0xff28666e),
    Color(0xff218380),



    Color(0xffdb3a34),
    Color(0xff00b4d8),
  ];

  @override
  Widget build(BuildContext context) {


    return Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.only( right: 15, left: 15, bottom: 55),

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.white60,
                  border: Border.all(color: Theme.of(context).primaryColor, width: 5 )

              ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: GridView.builder(
                  itemCount: books.length,

                  itemBuilder: (BuildContext context, int position) {
                    return MaterialButton(
                        child: Container(

                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                color: Theme.of(context).primaryColor,
                                borderRadius: BorderRadius.circular(15)),
                            alignment: Alignment.center,
                            child: Column(
                             
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text(
                                    textAlign: TextAlign.center,
                                    books[position].title!,
                                    style: TextStyle(
                                      color: Color(0xfffedc97),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                                Text(
                                  books[position].authorName!,
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    color: Color(0xfffedc97),
                                    fontWeight: FontWeight.w300,
                                    fontSize: 10,
                                  ),
                                ),

                              ],
                            )),

                        onPressed: () {
                          Get.to(
                              () => CoursesPage(

                                  bookId: books[position].id!,
                                  bookName: books[position].title!),
                              binding: CourseBinding());
                        });
                  },
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.1,
                           crossAxisSpacing: 0,

                      ),
                ),
              ),
            ),
          );


  }
}
