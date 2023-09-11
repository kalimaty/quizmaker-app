import 'dart:async';
import 'package:flutter/material.dart';

import '../models/category.dart';
import '../temp_service.dart';
import 'category_page.dart';

class QuizPage extends StatefulWidget {
  final List<QuizModel> quizList;

  const QuizPage(
    this.quizList, {
    Key key,
  }) : super(key: key);
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<String> allAnswers = [];
  int questionNo = 0;
  Timer timer;
  int time = 15;
  int scores = 0;

  startTimer() {
    timer = Timer.periodic(Duration(seconds: 1), (t) {
      setState(() {
        if (time < 1) {
          t.cancel();

          nextQuestion();
        } else {
          time = time - 1;
        }
      });
    });
  }

  nextQuestion([int option]) {
    timer.cancel();
    if (option != null &&
        allAnswers[option] == widget.quizList[questionNo].correct) {
      setState(() {
        scores++;
      });
    }

    if (questionNo < widget.quizList.length - 1) {
      questionNo++;
      allAnswers = [];
      allAnswers.add(widget.quizList[questionNo]
          .correct); // اذا اختار اجابة صحيحة تضاف  للاجابات الصحيحة
      allAnswers.addAll(widget.quizList[questionNo].incorrect);
      allAnswers.shuffle();
      time = 15;

      startTimer();
    } else {
      timer.cancel();
      _scaleDialog();
    }
  }

  Widget _dialog(BuildContext context) {
    return AlertDialog(
      shape: Border.all(width: 4, color: Colors.white),
      backgroundColor: Colors.pink.shade400,
      content: Text("Correct $scores",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 35,
            fontFamily: 'ArchitectsDaughter',
          )),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                child: Text(
                  "Home  ",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'ArchitectsDaughter',
                  ),
                ),
                onPressed: () {
                  // Navigator.pop(context);
                  // Navigator.pop(context);
                  // Navigator.pop(context);

                  // setState(() {
                  //   TempService.instance.removeCategory(CategoryModel(
                  //     quizList: [],
                  //   ));
                  // });
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => CategoryPage()),
                      (route) => false);
                },
              ),
              ElevatedButton(
                child: Text(
                  " Again",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    fontFamily: 'ArchitectsDaughter',
                  ),
                ),
                onPressed: () {
                  widget.quizList.shuffle();

                  // TempService.instance.addCategory(CategoryModel(

                  //   quizList: [],
                  // ));
                  // Navigator.pop(context);
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => QuizPage(
                            widget.quizList,
                          )));
                },
              ),
            ],
          ),
        )
      ],
    );
  }

  void _scaleDialog() {
    showGeneralDialog(
      context: context,
      pageBuilder: (ctx, a1, a2) {
        return Container();
      },
      transitionBuilder: (ctx, a1, a2, child) {
        var curve = Curves.easeInOut.transform(a1.value);
        return Transform.scale(
          scale: curve,
          child: _dialog(ctx),
        );
      },
      transitionDuration: const Duration(milliseconds: 300),
    );
  }

  // showResult() {
  //   showDialog(
  //     // barrierColor: Colors.black,
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (context) => Container(
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(30),
  //         color: Colors.grey.withOpacity(0.6),
  //         border: Border.all(
  //           width: 4,
  //           color: Colors.blueGrey.shade50,
  //           style: BorderStyle.solid,
  //         ),
  //       ),
  //       // child: _dialog(context),
  //     ),
  //   );
  // }

  @override
  void initState() {
    super.initState();
    widget.quizList.shuffle();
    allAnswers.add(widget.quizList[0].correct);
    allAnswers.addAll(widget.quizList[0].incorrect);
    allAnswers.shuffle();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        timer.isActive;
        return Future.value(false);
      },
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 5, 9, 14),
        // backgroundColor: Colors.orange.shade100,
        body: SafeArea(
          child: Column(
            children: <Widget>[
              //par
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.shade50,
                        offset: Offset(4.0, 4.0),
                        blurRadius: 20.0,
                        spreadRadius: 5.0,
                      )
                    ],
                    borderRadius: BorderRadius.circular(30),
                    // color: Colors.orange.withOpacity(0.7),
                    border: Border.all(
                      width: 4,
                      color: Colors.blueGrey.shade50,
                      style: BorderStyle.solid,
                    ),
                  ),
                  // color: Colors.orange.withOpacity(0.7),
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      //questionNo
                      Text(
                        "${questionNo + 1}",
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      //time
                      Text(
                        "$time",
                        style: Theme.of(context).textTheme.headline1.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
              // الاسئلة والاجوبة
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //عرض السؤال quizList
                      Text(widget.quizList[questionNo].name,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            textBaseline: TextBaseline.alphabetic,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.amber.shade50,
                          )),
                      SizedBox(height: 15.0),
                      //option
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            // الاختيارات
                            //options
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange.shade50,
                                    // offset: Offset(4.0, 4.0),
                                    // blurRadius: 20.0,
                                    // spreadRadius: 2.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30),
                                // color: Colors.orange.withOpacity(0.7),
                                border: Border.all(
                                  width: 4,
                                  color: Colors.grey.shade700,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: MaterialButton(
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(30),
                                // ),
                                // color: Colors.amber,
                                // splashColor: Colors.orange.shade400,
                                // textColor: Colors.white,
                                minWidth: MediaQuery.of(context).size.width,
                                height: 50.0,
                                onPressed: () {
                                  nextQuestion(0);
                                },
                                child: Text(
                                  allAnswers[0],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    // color: Colors.pink,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange.shade50,
                                    // offset: Offset(4.0, 4.0),
                                    // blurRadius: 20.0,
                                    // spreadRadius: 2.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30),
                                // color: Colors.orange.withOpacity(0.7),
                                border: Border.all(
                                  width: 4,
                                  color: Colors.grey.shade700,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: MaterialButton(
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(30),
                                // ),
                                // color: Colors.amber,
                                // splashColor: Colors.orange.shade400,
                                // textColor: Colors.white,
                                minWidth: MediaQuery.of(context).size.width,
                                height: 50.0,
                                onPressed: () {
                                  nextQuestion(1);
                                },
                                child: Text(
                                  allAnswers[1],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    // color: Colors.pink,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange.shade50,
                                    // offset: Offset(4.0, 4.0),
                                    // blurRadius: 20.0,
                                    // spreadRadius: 2.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30),
                                // color: Colors.orange.withOpacity(0.7),
                                border: Border.all(
                                  width: 4,
                                  color: Colors.grey.shade700,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: MaterialButton(
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(30),
                                // ),
                                // color: Colors.amber,
                                // splashColor: Colors.orange.shade400,
                                // textColor: Colors.white,
                                minWidth: MediaQuery.of(context).size.width,
                                height: 40.0,
                                onPressed: () {
                                  nextQuestion(2);
                                },
                                child: Text(
                                  allAnswers[2],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    // color: Colors.pink,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Container(
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.orange.shade50,
                                    // offset: Offset(4.0, 4.0),
                                    // blurRadius: 20.0,
                                    // spreadRadius: 2.0,
                                  )
                                ],
                                borderRadius: BorderRadius.circular(30),
                                // color: Colors.orange.withOpacity(0.7),
                                border: Border.all(
                                  width: 4,
                                  color: Colors.grey.shade700,
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: MaterialButton(
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(30),
                                // ),
                                // color: Colors.amber,
                                // splashColor: Colors.orange.shade400,
                                // textColor: Colors.white,
                                minWidth: MediaQuery.of(context).size.width,
                                height: 40.0,
                                onPressed: () {
                                  nextQuestion(3);
                                },
                                child: Text(
                                  allAnswers[3],
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    // color: Colors.pink,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}







// import 'dart:async';
// import 'package:flutter/material.dart';

// import '../models/category.dart';

// class QuizPage extends StatefulWidget {
//   final List<QuizModel> quizList;

//   const QuizPage(
//     this.quizList, {
//     Key key,
//   }) : super(key: key);
//   @override
//   _QuizPageState createState() => _QuizPageState();
// }

// class _QuizPageState extends State<QuizPage> {
//   List<String> allAnswers = [];
//   int questionNo = 0;
//   Timer timer;
//   int time = 15;
//   int scores = 0;

//   startTimer() {
//     timer = Timer.periodic(Duration(seconds: 1), (t) {
//       setState(() {
//         if (time < 1) {
//           t.cancel();

//           nextQuestion();
//         } else {
//           time = time - 1;
//         }
//       });
//     });
//   }

//   nextQuestion([int option]) {
//     timer?.cancel();
//     if (option != null &&
//         allAnswers[option] == widget.quizList[questionNo].correct) {
//       scores++;
//     }

//     if (questionNo < widget.quizList.length - 1) {
//       questionNo++;
//       allAnswers = [];
//       allAnswers.add(widget.quizList[questionNo].correct);
//       allAnswers.addAll(widget.quizList[questionNo].incorrect);
//       allAnswers.shuffle();
//       time = 15;

//       startTimer();
//     } else {
//       timer?.cancel();
//       showResult();
//     }
//   }

//   showResult() {
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (context) => AlertDialog(
//         content: Text(
//           "Correct $scores",
//           style: Theme.of(context).textTheme.displayMedium,
//         ),
//         actions: <Widget>[
//           ElevatedButton(
//             child: Text("CANCEL"),
//             onPressed: () {
//               Navigator.pop(context);
//               Navigator.pop(context);
//               Navigator.pop(context);
//             },
//           ),
//           ElevatedButton(
//             child: Text("RETRY"),
//             onPressed: () {
//               widget.quizList.shuffle();
//               Navigator.pop(context);
//               Navigator.of(context).pushReplacement(MaterialPageRoute(
//                   builder: (context) => QuizPage(
//                         widget.quizList,
//                       )));
//             },
//           )
//         ],
//       ),
//     );
//   }

//   @override
//   void initState() {
//     super.initState();
//     widget.quizList.shuffle();
//     allAnswers.add(widget.quizList[0].correct);
//     allAnswers.addAll(widget.quizList[0].incorrect);
//     allAnswers.shuffle();
//     startTimer();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return WillPopScope(
//       onWillPop: () {
//         timer?.cancel();
//         return Future.value(true);
//       },
//       child: Scaffold(
//         body: SafeArea(
//           child: Column(
//             children: <Widget>[
//               Container(
//                 color: Colors.orange.withOpacity(0.7),
//                 padding: EdgeInsets.all(8.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: <Widget>[
//                     Text(
//                       "${questionNo + 1}",
//                       style: Theme.of(context).textTheme.headline3.copyWith(
//                             fontWeight: FontWeight.bold,
//                           ),
//                     ),
//                     Text(
//                       "$time",
//                       style: Theme.of(context).textTheme.headline3.copyWith(
//                             fontWeight: FontWeight.bold,
//                           ),
//                     ),
//                   ],
//                 ),
//               ),
//               Expanded(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Text(
//                         widget.quizList[questionNo].name,
//                         textAlign: TextAlign.center,
//                         style:
//                             Theme.of(context).textTheme.displayMedium.copyWith(
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                       ),
//                       SizedBox(height: 25.0),
//                       Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[
//                             MaterialButton(
//                               minWidth: MediaQuery.of(context).size.width,
//                               height: 40.0,
//                               onPressed: () {
//                                 nextQuestion(0);
//                               },
//                               child: Text(
//                                 allAnswers[0],
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.pink,
//                                 ),
//                               ),
//                             ),
//                             MaterialButton(
//                               minWidth: MediaQuery.of(context).size.width,
//                               height: 40.0,
//                               onPressed: () {
//                                 nextQuestion(1);
//                               },
//                               child: Text(
//                                 allAnswers[1],
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.pink,
//                                 ),
//                               ),
//                             ),
//                             MaterialButton(
//                               minWidth: MediaQuery.of(context).size.width,
//                               height: 40.0,
//                               onPressed: () {
//                                 nextQuestion(2);
//                               },
//                               child: Text(
//                                 allAnswers[2],
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.pink,
//                                 ),
//                               ),
//                             ),
//                             MaterialButton(
//                               minWidth: MediaQuery.of(context).size.width,
//                               height: 40.0,
//                               onPressed: () {
//                                 nextQuestion(3);
//                               },
//                               child: Text(
//                                 allAnswers[3],
//                                 style: TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.pink,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox.shrink(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
