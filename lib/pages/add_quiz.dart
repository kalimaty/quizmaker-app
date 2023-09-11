import 'package:quiz_app/pages/category_page.dart';
import 'package:slide_to_act/slide_to_act.dart';

import '../temp_service.dart';
import 'quiz_page.dart';
import '../models/category.dart';
import 'package:flutter/material.dart';

class AddQuiz extends StatefulWidget {
  final CategoryModel categoryModel;

  const AddQuiz(
    this.categoryModel, {
    Key key,
  }) : super(key: key);
  @override
  _AddQuizState createState() => _AddQuizState();
}

class _AddQuizState extends State<AddQuiz> {
  GlobalKey<FormState> _formKey = GlobalKey();
  int groupValue = 0;
  TextEditingController titleController = TextEditingController();
  TextEditingController oneController = TextEditingController();
  TextEditingController twoController = TextEditingController();
  TextEditingController threeController = TextEditingController();
  TextEditingController fourController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final GlobalKey<SlideActionState> _key = GlobalKey();
    return WillPopScope(
      // ignore: missing_return
      onWillPop: () {
        TempService.instance.removeCategory(CategoryModel(
          quizList: [],
        ));
        setState(() {});
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (context) => CategoryPage()),
            (route) => false);
      },
      child: Scaffold(
        // appBar: AppBar(

        // ),
        backgroundColor: Colors.amber.shade100,
        body: Form(
          key: _formKey,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text("Add Quize ",
                            style: TextStyle(
                                color: Colors.purple,
                                fontFamily: 'SingleDay',
                                fontSize: 60,
                                backgroundColor: Colors.white)
                            // textAlign: TextAlign.center,
                            ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 10, left: 10, top: 5, bottom: 5),
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(6.0),
                          child: TextFormField(
                            // decoration: InputDecoration(
                            //   filled: true,
                            //   fillColor: Colors.amber.shade50,
                            // ),
                            style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold,
                              // fontFamily: 'SingleDay',
                            ),
                            textAlign: TextAlign.right,
                            controller: titleController,
                            decoration: getDecoration(
                              " اكتب  السؤال هنا ",
                            ),
                            validator: (t) {
                              if (t.isEmpty)
                                return "*Required field";
                              else
                                return null;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RadioListTile(
                          // shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.circular(20),),
                          // activeColor: Colors.green,
                          // subtitle: Container(
                          //   color: Colors.amber,
                          //   height: 10,c
                          // ),
                          // contentPadding:
                          //     EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          shape: Border.all(width: 2, color: Colors.green),

                          tileColor: Colors.amber.shade50,
                          groupValue: groupValue,
                          controlAffinity: ListTileControlAffinity.trailing,
                          value: 0,
                          title: TextFormField(
                            style: TextStyle(fontSize: 30),
                            textAlign: TextAlign.right,
                            controller: oneController,
                            decoration: getDecoration(" "),
                            validator: (t) {
                              if (t.isEmpty)
                                return "*Required field";
                              else
                                return null;
                            },
                          ),
                          onChanged: (t) {
                            setState(() {
                              groupValue = 0;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RadioListTile(
                          shape: Border.all(width: 2, color: Colors.green),
                          tileColor: Colors.amber.shade50,
                          groupValue: groupValue,
                          value: 1,
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: TextFormField(
                            style: TextStyle(fontSize: 30),
                            textAlign: TextAlign.right,
                            controller: twoController,
                            decoration: getDecoration(
                              "",
                            ),
                            validator: (t) {
                              if (t.isEmpty)
                                return "*Required field";
                              // setState(() {
                              //   Navigator.pop(context);
                              // });

                              else
                                return null;
                            },
                          ),
                          onChanged: (t) {
                            setState(() {
                              groupValue = 1;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RadioListTile(
                          groupValue: groupValue,
                          shape: Border.all(width: 2, color: Colors.green),
                          tileColor: Colors.amber.shade50,
                          value: 2,
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: TextFormField(
                            style: TextStyle(fontSize: 30),
                            textAlign: TextAlign.right,
                            controller: threeController,
                            decoration: getDecoration(" "),
                            validator: (t) {
                              if (t.isEmpty)
                                return "*Required field";
                              else
                                return null;
                            },
                          ),
                          onChanged: (t) {
                            setState(() {
                              groupValue = 2;
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        RadioListTile(
                          shape: Border.all(width: 2, color: Colors.green),
                          tileColor: Colors.amber.shade50,
                          groupValue: groupValue,
                          value: 3,
                          controlAffinity: ListTileControlAffinity.trailing,
                          title: TextFormField(
                            style: TextStyle(fontSize: 30),
                            textAlign: TextAlign.right,
                            controller: fourController,
                            decoration: getDecoration(" "),
                            validator: (t) {
                              if (t.isEmpty)
                                return "*Required field";
                              else
                                return null;
                            },
                          ),
                          onChanged: (t) {
                            setState(() {
                              groupValue = 3;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: <Widget>[
                        // MaterialButton(
                        //   height: 40.0,
                        //   padding: EdgeInsets.all(0.0),
                        //   minWidth: MediaQuery.of(context).size.width,
                        //   onPressed: () {
                        //     validate();
                        //   },
                        //   color: Colors.green,
                        //   child: Text(
                        //     "اضف  سؤالا من هنا",
                        //     style: TextStyle(
                        //       fontWeight: FontWeight.bold,
                        //       fontSize: 40,
                        //       color: Colors.white,
                        //       letterSpacing: 2.0,
                        //     ),
                        //   ),
                        // ),

                        // MaterialButton(
                        //   height: 40.0,
                        //   padding: EdgeInsets.all(0.0),
                        //   minWidth: MediaQuery.of(context).size.width,
                        //   onPressed: () {
                        //     Navigator.of(context).push(MaterialPageRoute(
                        //         builder: (context) => QuizPage(
                        //               quizList: widget.categoryModel.quizList,
                        //             )));
                        //   },
                        //   color: Colors.orange,
                        //   child: Text(
                        //     "ابدأ المسابقة",
                        //     style: TextStyle(
                        //       fontSize: 40,
                        //       fontWeight: FontWeight.bold,
                        //       color: Colors.white,
                        //       letterSpacing: 2.0,
                        //     ),
                        //   ),
                        // ),
                        Center(
                          // child: SlideAction(on) ,
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: SlideAction(
                              reversed: true,
                              key: _key,
                              // alignment: Alignment.centerRight,
                              borderRadius: 12,
                              elevation: 0,
                              innerColor: Colors.blue,
                              outerColor: Colors.deepPurple,
                              sliderButtonIcon: Icon(
                                Icons.question_answer,
                                color: Colors.white,
                              ),
                              text: 'اضافة سؤال',
                              textStyle: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                              ),
                              // sliderRotate: false,
                              onSubmit: () {
                                Future.delayed(Duration(seconds: 1), () {
                                  _key.currentState.reset();
                                  validate();
                                });
                              },
                            ),
                          ),
                        ),
                        // SizedBox(
                        //   height: 10,
                        // ),
                        Center(
                          // child: SlideAction(on) ,
                          child: Padding(
                            padding: const EdgeInsets.all(5),
                            child: SlideAction(
                              borderRadius: 12,
                              elevation: 0,
                              innerColor: Colors.blue.shade500,
                              outerColor: Colors.red,
                              sliderButtonIcon: Icon(
                                Icons.lock_open_sharp,
                                color: Colors.white,
                              ),
                              text: 'ابدأ المسابقة',
                              textStyle: TextStyle(
                                fontSize: 32,
                                color: Colors.white,
                              ),
                              // sliderRotate: false,
                              onSubmit: widget.categoryModel.quizList.length < 1
                                  ? null
                                  : () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (context) => QuizPage(
                                            widget.categoryModel.quizList,
                                          ),
                                        ),
                                      );
                                      print(categories.length);
                                    },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _showMessage(String msg) {
    showModalBottomSheet(
      context: context,
      builder: (_) => Container(
        color: Colors.black,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("$msg",
                  style: Theme.of(context)
                      .textTheme
                      .headline6
                      .copyWith(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }

  getDecoration(hint) {
    var outlineInputBorder = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.purple.shade100, width: 2),
    );

    return InputDecoration(
      alignLabelWithHint: true,
      hintText: "$hint",
      contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
      border: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
    );
  }

  validate() {
    if (_formKey.currentState.validate()) if (oneController.text.isNotEmpty &&
        twoController.text.isNotEmpty &&
        threeController.text.isNotEmpty &&
        fourController.text.isNotEmpty) {
      List<String> all = [];
      all.add(oneController.text);
      all.add(twoController.text);
      all.add(threeController.text);
      all.add(fourController.text);
      var correct = all[groupValue];
      all.removeAt(groupValue);
      QuizModel quizModel = QuizModel(
        name: titleController.text,
        correct: correct,
        incorrect: all,
      );
      //
      // Navigator.pop(context);
      setState(() {});
      widget.categoryModel.quizList.add(quizModel);
      oneController.clear();
      twoController.clear();
      threeController.clear();
      fourController.clear();
      titleController.clear();
      _showMessage("Quiz is added");
      // resetConfirmation();
    }
  }

  resetConfirmation() async {
    showDialog(
        barrierColor: Colors.black54,
        barrierDismissible: false,
        context: context,
        builder: (dialogContext) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: AlertDialog(
              buttonPadding: EdgeInsets.all(5),
              backgroundColor: Color.fromARGB(255, 153, 113, 173),
              content: Text(
                "",
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                // ElevatedButton(onPressed: (), child: child)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    borderRadius: 12,
                    elevation: 0,
                    innerColor: Colors.deepPurple,
                    outerColor: Colors.orange,
                    sliderButtonIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    text: 'ابدأ المسابقة',
                    textStyle: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                    // sl
                    //iderRotate: false,

                    onSubmit: () {
                      Future.delayed(Duration(seconds: 1), () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => QuizPage(
                                  widget.categoryModel.quizList,
                                )));
                      });
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SlideAction(
                    borderRadius: 12,
                    elevation: 0,
                    innerColor: Colors.deepPurple,
                    outerColor: Colors.orange,
                    sliderButtonIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                    text: 'سؤال جديد  ',
                    textStyle: TextStyle(
                      fontSize: 32,
                      color: Colors.white,
                    ),
                    // sliderRotate: false,
                    onSubmit: () {
                      Navigator.of(dialogContext).pop();
                      // Navigator.of(context).pushReplacement(
                      //     MaterialPageRoute(builder: (context) => App()));
                    },
                  ),
                ),
                // OutlinedButton(
                //   onPressed: () {
                //     Navigator.of(dialogContext).pop();
                //   },
                //   child: Text("Confirm"),
                // ),
                // OutlinedButton(
                //   onPressed: () {
                //     Future.delayed(Duration(seconds: 1), () {
                //       Navigator.of(context).push(MaterialPageRoute(
                //           builder: (context) => QuizPage(
                //                 widget.categoryModel.quizList,
                //               )));
                //     });
                //   },
                //   child: Text("Cancel"),
                // ),
              ],
            ),
          );
        });
  }

  // @override
  // void initState() {

  //   super.initState();
  // }
}






// import 'quiz_page.dart';
// import '../models/category.dart';
// import 'package:flutter/material.dart';

// class AddQuiz extends StatefulWidget {
//   final CategoryModel categoryModel;

//   const AddQuiz(
//     this.categoryModel, {
//     Key key,
//   }) : super(key: key);
//   @override
//   _AddQuizState createState() => _AddQuizState();
// }

// class _AddQuizState extends State<AddQuiz> {
//   GlobalKey<FormState> _formKey = GlobalKey();
//   int groupValue = 0;
//   TextEditingController titleController = TextEditingController();
//   TextEditingController oneController = TextEditingController();
//   TextEditingController twoController = TextEditingController();
//   TextEditingController threeController = TextEditingController();
//   TextEditingController fourController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Form(
//         key: _formKey,
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               mainAxisSize: MainAxisSize.min,
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: Text(
//                         "Quiz",
//                         style: Theme.of(context).textTheme.displayLarge,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Column(
//                   children: <Widget>[
//                     Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: TextFormField(
//                         controller: titleController,
//                         decoration: getDecoration("Question name"),
//                         validator: (t) {
//                           if (t.isEmpty)
//                             return "*Required field";
//                           else
//                             return null;
//                         },
//                       ),
//                     ),
//                     RadioListTile(
//                       groupValue: groupValue,
//                       value: 0,
//                       title: TextFormField(
//                         controller: oneController,
//                         decoration: getDecoration("Option 1"),
//                         validator: (t) {
//                           if (t.isEmpty)
//                             return "*Required field";
//                           else
//                             return null;
//                         },
//                       ),
//                       onChanged: (t) {
//                         setState(() {
//                           groupValue = 0;
//                         });
//                       },
//                     ),
//                     RadioListTile(
//                       groupValue: groupValue,
//                       value: 1,
//                       title: TextFormField(
//                         controller: twoController,
//                         decoration: getDecoration("Option 2"),
//                         validator: (t) {
//                           if (t.isEmpty)
//                             return "*Required field";
//                           else
//                             return null;
//                         },
//                       ),
//                       onChanged: (t) {
//                         setState(() {
//                           groupValue = 1;
//                         });
//                       },
//                     ),
//                     RadioListTile(
//                       groupValue: groupValue,
//                       value: 2,
//                       title: TextFormField(
//                         controller: threeController,
//                         decoration: getDecoration("Option 3"),
//                         validator: (t) {
//                           if (t.isEmpty)
//                             return "*Required field";
//                           else
//                             return null;
//                         },
//                       ),
//                       onChanged: (t) {
//                         setState(() {
//                           groupValue = 2;
//                         });
//                       },
//                     ),
//                     RadioListTile(
//                       groupValue: groupValue,
//                       value: 3,
//                       title: TextFormField(
//                         controller: fourController,
//                         decoration: getDecoration("Option 4"),
//                         validator: (t) {
//                           if (t.isEmpty)
//                             return "*Required field";
//                           else
//                             return null;
//                         },
//                       ),
//                       onChanged: (t) {
//                         setState(() {
//                           groupValue = 3;
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 15.0),
//                 Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: <Widget>[
//                       MaterialButton(
//                         height: 40.0,
//                         padding: EdgeInsets.all(0.0),
//                         minWidth: MediaQuery.of(context).size.width,
//                         onPressed: () {
//                           validate();
//                         },
//                         color: Colors.green,
//                         child: Text(
//                           "ADD",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             letterSpacing: 2.0,
//                           ),
//                         ),
//                       ),
//                       MaterialButton(
//                         height: 40.0,
//                         padding: EdgeInsets.all(0.0),
//                         minWidth: MediaQuery.of(context).size.width,
//                         onPressed: () {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => QuizPage(
//                                     widget.categoryModel.quizList,
//                                   )));
//                         },
//                         color: Colors.orange,
//                         child: Text(
//                           "START",
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                             letterSpacing: 2.0,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   _showMessage(String msg) {
//     showModalBottomSheet(
//       context: context,
//       builder: (_) => Container(
//         color: Colors.black,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: <Widget>[
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Text("$msg",
//                   style: Theme.of(context)
//                       .textTheme
//                       .titleLarge
//                       .copyWith(color: Colors.white)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   getDecoration(hint) {
//     var outlineInputBorder = OutlineInputBorder(
//       borderSide: BorderSide(color: Color(0xffdfdfdf)),
//     );
//     return InputDecoration(
//       hintText: "$hint",
//       contentPadding: EdgeInsets.symmetric(horizontal: 16.0),
//       border: outlineInputBorder,
//       enabledBorder: outlineInputBorder,
//       focusedBorder: outlineInputBorder,
//     );
//   }

//   validate() {
//     if (_formKey.currentState.validate() &&
//         oneController.text.isNotEmpty &&
//         twoController.text.isNotEmpty &&
//         threeController.text.isNotEmpty &&
//         fourController.text.isNotEmpty) {
//       List<String> all = [];
//       all.add(oneController.text);
//       all.add(twoController.text);
//       all.add(threeController.text);
//       all.add(fourController.text);
//       var correct = all[groupValue];
//       all.removeAt(groupValue);
//       QuizModel quizModel = QuizModel(
//         imgUrl: "",
//         name: titleController.text,
//         correct: correct,
//         incorrect: all,
//       );

//       widget.categoryModel.quizList.add(quizModel);
//       oneController.clear();
//       twoController.clear();
//       threeController.clear();
//       fourController.clear();
//       titleController.clear();
//       _showMessage("Quiz is added");
//     }
//   }
// }
