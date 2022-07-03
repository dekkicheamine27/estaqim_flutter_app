import 'package:estaqim_school/controllers/student_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';


class SingleCoursePage extends StatefulWidget {
  final int courseId;
  final int nextCourseId;
  final String courseName;
  final String courseUrl;
  final List quizzes;

  const SingleCoursePage(
      {super.key,
      required this.courseId,
      required this.courseName,
      required this.courseUrl,
      required this.quizzes, required this.nextCourseId,});

  @override
  State<SingleCoursePage> createState() =>
      _SingleCoursePageState(courseId, courseName, courseUrl, quizzes, nextCourseId);
}

class _SingleCoursePageState extends State<SingleCoursePage> {
  final int courseId;
  final int nextCourseId;
  final String courseName;
  final String courseUrl;
  final List quizzes;

  late YoutubePlayerController _ytbCountroller;

  _SingleCoursePageState(
      this.courseId, this.courseName, this.courseUrl, this.quizzes, this.nextCourseId);

  @override
  void initState() {
    _ytbCountroller = YoutubePlayerController(
        initialVideoId: courseUrl,
        flags: const YoutubePlayerFlags(
          autoPlay: false,
          isLive: false,
          mute: false,
        ));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    StudentController controller = Get.put(StudentController(), permanent: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(courseName),
        centerTitle: true,
        backgroundColor: Theme.of(context).primaryColor,
        elevation: 0.0,
      ),
      body: YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _ytbCountroller,
        ),
        builder: (context, player) {
          return Container(
            margin: EdgeInsets.only(top: 15, right: 15, left: 15, bottom: 40),

            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white60,
                border: Border.all(color: Theme.of(context).primaryColor, width: 5 )

            ),
            child: Column(

              children: [
                Container(
                  padding: EdgeInsets.all(5),
                  margin: EdgeInsets.only(top: 50, right: 10, left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).primaryColor,
                      border: Border.all(color: Colors.blue.shade900)),
                  child: player,
                ),
                SizedBox(height: 50,),
                Container(
                  margin: EdgeInsets.all(20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Theme.of(context).primaryColor,
                      border: Border.all(color: Theme.of(context).primaryColor,)),
                  child: Center(child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:  [
                      Icon(Icons.quiz_outlined, color: Colors.white,),
                      MaterialButton(
                          onPressed: (){
                           controller.addCourse(nextCourseId);
                           controller.getStudent();
                           print(controller.courses.toString());


                          },
                          child: Text('إمتحان الدرس', style: TextStyle(color: Colors.white),)),

                    ],
                  )),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
