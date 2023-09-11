// import '../models/category.dart';
// import '../temp_service.dart';
// import 'add_quiz.dart';
// import 'package:flutter/material.dart';

// class CategoryPage extends StatefulWidget {
//   @override
//   _CategoryPageState createState() => _CategoryPageState();
// }

// class _CategoryPageState extends State<CategoryPage> {
//   List<CategoryModel> get categories =>
//       TempService.instance.categoriesListModel.categories;
//   TextEditingController categoryController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemBuilder: (context, index) => Card(
//           elevation: 0.0,

//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Card(
//                 color: Colors.deepPurpleAccent.shade100,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(5)),
//                 child: ListTile(
//                   // shape: RoundedRectangleBorder(
//                   //     borderRadius: BorderRadius.circular(30)),
//                   onTap: () {
//                     Navigator.of(context).pushAndRemoveUntil(
//                         MaterialPageRoute(
//                             builder: (context) => AddQuiz(
//                                   categories[index],
//                                 )),
//                         (route) => false);
//                     // Navigator.of(context).push(MaterialPageRoute(
//                     //     builder: (context) => AddQuiz(
//                     //           categories[index],
//                     //           // categoryModel: categories[index],
//                     //         )));
//                     // print(
//                     //   categories[index],
//                     // );
//                   },
//                   title: Container(
//                     // color: Colors.amber,
//                     alignment: Alignment.bottomRight,
//                     child: Text(
//                       categories[index].name,
//                       // categories[index].quizList.toString(),
//                       style: Theme.of(context).textTheme.headline6.copyWith(
//                           fontWeight: FontWeight.bold,
//                           fontFamily: 'SingleDay',
//                           fontSize: 30,
//                           color: Colors.amber.shade50),
//                     ),
//                   ),
//                   leading: IconButton(
//                       alignment: Alignment.bottomLeft,
//                       color: Colors.white,
//                       onPressed: () async {
//                         categories.removeAt(index);

//                         TempService.instance.removeCategory(CategoryModel(
//                           name: categoryController.text,
//                           quizList: [],
//                         ));
//                         setState(() {});
//                         categoryController.clear();
//                       },
//                       icon: Icon(
//                         Icons.delete_sweep,
//                         size: 40,
//                       )),
//                   trailing: CircleAvatar(
//                     maxRadius: 15,
//                     backgroundColor: Colors.white,
//                     child: Text(
//                       "${categories[index].quizList.length}",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               // Align(
//               //   alignment: Alignment.bottomLeft,
//               //   child: IconButton(
//               //       alignment: Alignment.bottomLeft,
//               //       color: Colors.blue,
//               //       onPressed: () async {
//               //         categories.removeAt(index);

//               //         TempService.instance.removeCategory(CategoryModel(
//               //           name: categoryController.text,
//               //           quizList: [],
//               //         ));
//               //         setState(() {});
//               //         categoryController.clear();
//               //       },
//               //       icon: Icon(Icons.delete_sweep)),
//               // ),
//             ],
//           ),
//           // child: ListTile(
//           //   onTap: () {
//           //     Navigator.of(context).push(MaterialPageRoute(
//           //         builder: (context) => AddQuiz(categories[index]
//           //             // categoryModel: categories[index],
//           //             )));
//           //   },
//           //   title: Text(
//           //     categories[index].name,
//           //     style: Theme.of(context).textTheme.titleMedium.copyWith(
//           //           fontWeight: FontWeight.bold,
//           //         ),
//           //   ),
//           //   trailing: SizedBox(
//           //     width: MediaQuery.of(context).size.width * 0.2,
//           //     child: Row(
//           //       mainAxisSize: MainAxisSize.max,
//           //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //       children: [
//           //         CircleAvatar(
//           //           maxRadius: 15,
//           //           backgroundColor: Colors.red,
//           //           child: Text(
//           //             "${categories[index].quizList.length}",
//           //             style: TextStyle(
//           //               color: Colors.white,
//           //               fontWeight: FontWeight.bold,
//           //             ),
//           //           ),
//           //         ),
//           //         IconButton(
//           //             // onPressed: () async {
//           //             //   // categories.removeAt(index);
//           //             //   // setState(() {});
//           //             //   TempService.instance.removeCategory(CategoryModel(
//           //             //     name: categoryController.text,
//           //             //     quizList: [],
//           //             //   ));
//           //             //   setState(() {});
//           //             //   categoryController.clear();
//           //             //   Navigator.pop(context);
//           //             // },

//           //             onPressed: () async {
//           //               categories.removeAt(index);

//           //               TempService.instance.removeCategory(CategoryModel(
//           //                 name: categoryController.text,
//           //                 quizList: [],
//           //               ));
//           //               setState(() {});
//           //               categoryController.clear();
//           //             },
//           //             icon: Icon(
//           //               Icons.delete,
//           //               color: Colors.red,
//           //             )),
//           //       ],
//           //     ),
//           //   ),
//           // ),
//         ),
//         itemCount: categories.length,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: showCategory,
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   showCategory() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Add Category"),
//         content: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: TextField(
//             controller: categoryController,
//           ),
//         ),
//         actions: <Widget>[
//           ElevatedButton(
//             onPressed: () {
//               categoryController.clear();
//               Navigator.pop(context);
//             },
//             child: Text("CANCEL"),
//           ),
//           ElevatedButton(
//             // onPressed: () {
//             //   categoryController.text.length < 1
//             //       // ignore: unnecessary_statements
//             //       ? null
//             //       : TempService.instance.addCategory(CategoryModel(
//             //           name: categoryController.text,

//             //         ));
//             //   setState(() {});
//             //   categoryController.clear();
//             //   Navigator.pop(context);
//             //   // //  Navigator.of(context, rootNavigator: true).pop();
//             // },

//             onPressed: () {
//               setState(() {
//                 TempService.instance.addCategory(CategoryModel(
//                   name: categoryController.text,
//                   quizList: [],
//                 ));
//               });
//               categoryController.clear();
//               Navigator.pop(context);
//             },
//             child: Text("ADD"),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:animated_text_kit/animated_text_kit.dart';

import '../models/category.dart';
import '../temp_service.dart';
import 'add_quiz.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  List<CategoryModel> get categories =>
      TempService.instance.categoriesListModel.categories;
  TextEditingController categoryController = TextEditingController();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.builder(
//         itemBuilder: (context, index) => Card(
//           elevation: 0.0,
//           child: ListTile(
//               onTap: () {
//                 Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => AddQuiz(categories[index]
//                         // categoryModel: categories[index],
//                         )));
//               },
//               title: Text(
//                 categories[index].name,
//                 style: Theme.of(context).textTheme.titleMedium.copyWith(
//                       fontWeight: FontWeight.bold,
//                     ),
//               ),
//               trailing: SizedBox(
//                 width: MediaQuery.of(context).size.width * 0.2,
//                 child: Row(
//                   mainAxisSize: MainAxisSize.max,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     CircleAvatar(
//                       maxRadius: 15,
//                       backgroundColor: Colors.red,
//                       child: Text(
//                         "${categories[index].quizList.length}",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                     IconButton(
//                         onPressed: () async {
//                           categories.removeAt(index);

//                           TempService.instance.removeCategory(CategoryModel(
//                             name: categoryController.text,
//                             quizList: [],
//                           ));
//                           setState(() {});
//                           categoryController.clear();
//                         },
//                         icon: Icon(
//                           Icons.delete,
//                           color: Colors.red,
//                         )),
//                   ],
//                 ),
//               )),
//         ),
//         itemCount: categories.length,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: showCategory,
//         child: Icon(Icons.add),
//       ),
//     );
//   }

//   showCategory() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text("Add Category"),
//         content: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: TextField(
//             controller: categoryController,
//           ),
//         ),
//         actions: <Widget>[
//           ElevatedButton(
//             onPressed: () {
//               categoryController.clear();
//               Navigator.pop(context);
//             },
//             child: Text("CANCEL"),
//           ),
//           ElevatedButton(
//             onPressed: () {
//               TempService.instance.addCategory(CategoryModel(
//                 name: categoryController.text,
//                 quizList: [],
//               ));
//               setState(() {});
//               categoryController.clear();
//               Navigator.pop(context);
//             },
//             child: Text("ADD"),
//           ),
//         ],
//       ),
//     );
//   }
// }
  @override
  void initState() {
    print(categories.length);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Padding(
              padding: const EdgeInsets.all(25.0),
              child: AnimatedTextKit(
                pause: Duration(milliseconds: 200),
                repeatForever: true,
                // stopPauseOnTap: false,
                animatedTexts: [
                  FlickerAnimatedText('azhar',
                      textStyle: TextStyle(
                          fontFamily: "SingleDay",
                          color: Colors.white,
                          fontSize: 45)),
                  FlickerAnimatedText('Faisal',
                      textStyle: TextStyle(
                          fontFamily: "SingleDay",
                          color: Colors.white,
                          fontSize: 45)),
                  FlickerAnimatedText("Quiz Maker",
                      textStyle: TextStyle(
                          fontFamily: "SingleDay",
                          color: Colors.white,
                          fontSize: 45)),
                ],
                onTap: () {},
              ),
            ),
          ),
          // backgroundColor: Colors.cyanAccent.shade200,

          // backgroundColor: Colors.lightGreen.shade200,
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ListView.builder(
              itemBuilder: (context, index) => Card(
                // elevation: 0.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Card(
                      color: Colors.deepPurpleAccent.shade100,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)),
                      child: ListTile(
                        // shape: RoundedRectangleBorder(
                        //     borderRadius: BorderRadius.circular(30)),
                        // onTap: () {
                        //   Navigator.of(context).push(MaterialPageRoute(
                        //       builder: (context) => AddQuiz(
                        //             categories[index],
                        //           )));
                        //   // print(
                        //   //   categories[index],
                        //   // );

                        // },

                        onTap: () {
                          // setState(() {
                          //   TempService.instance.removeCategory(CategoryModel(
                          //     quizList: [],
                          //   ));
                          // });
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => AddQuiz(
                                    categories[index],
                                    // categoryModel: categories[index],
                                  )));
                          // print(
                          //   categories[index],
                          // );
                        },
                        title: Container(
                          // color: Colors.amber,
                          alignment: Alignment.bottomRight,
                          child: Text(
                            categories[index].name,
                            // categories[index].quizList.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .headline6
                                .copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'SingleDay',
                                    fontSize: 30,
                                    color: Colors.amber.shade50),
                          ),
                        ),
                        leading: IconButton(
                            alignment: Alignment.bottomLeft,
                            color: Colors.white,
                            onPressed: () async {
                              categories.removeAt(index);

                              TempService.instance.removeCategory(CategoryModel(
                                name: categoryController.text,
                                quizList: [],
                              ));
                              setState(() {});
                              categoryController.clear();
                            },
                            icon: Icon(
                              Icons.delete_sweep,
                              size: 40,
                            )),
                        trailing: CircleAvatar(
                          maxRadius: 15,
                          backgroundColor: Colors.white,
                          child: Text(
                            "${categories[index].quizList.length}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Align(
                    //   alignment: Alignment.bottomLeft,
                    //   child: IconButton(
                    //       alignment: Alignment.bottomLeft,
                    //       color: Colors.blue,
                    //       onPressed: () async {
                    //         categories.removeAt(index);

                    //         TempService.instance.removeCategory(CategoryModel(
                    //           name: categoryController.text,
                    //           quizList: [],
                    //         ));
                    //         setState(() {});
                    //         categoryController.clear();
                    //       },
                    //       icon: Icon(Icons.delete_sweep)),
                    // ),
                  ],
                ),
              ),
              itemCount: categories.length,
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: _scaleDialog,
            child: Icon(Icons.add),
          ),
        ),
      ),
    );
  }

  Widget _dialog(BuildContext context) {
    return AlertDialog(
      shape: Border.all(width: 4, color: Colors.deepPurple.shade100),
      // backgroundColor: Colors.lightBlueAccent.shade100,
      backgroundColor: Colors.amber.shade50,
      title: Text(
        " اضف اسم الدرس  من هنا",
        // " Azhar Quiz Maker \n\n Made By \n\n Faisal Abdrahim \n\nاضف اسم الدرس  من هنا",
        style: TextStyle(
          fontFamily: 'SingleDay',
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
      ),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          autofocus: true,
          textDirection: TextDirection.rtl,
          // textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'SingleDay',
            fontWeight: FontWeight.bold,
            color: Colors.purple,
            fontSize: 30,
          ),
          controller: categoryController,
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () {
                  categoryController.clear();
                  Navigator.pop(context);
                  // //  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Text("CANCEL"),
              ),
              ElevatedButton(
                /*
                
                  onPressed: () {
              TempService.instance.addCategory(CategoryModel(
                name: categoryController.text,
                quizList: [],
              ));
              setState(() {});
              categoryController.clear();
              Navigator.pop(context);
            },
                 */
                onPressed: () {
                  /* 
                  onPressed: categoryController.text.length < 1
                    ? (null)
                    : () {
                        TempService.instance.addCategory(CategoryModel(
                          name: categoryController.text,
                          quizList: [],
                        ));
                        setState(() {});
                        categoryController.clear();
                        Navigator.pop(context);
                        // /
                */
                  categoryController.text.length < 1
                      // ignore: unnecessary_statements
                      ? null
                      : TempService.instance.addCategory(CategoryModel(
                          name: categoryController.text,
                          quizList: [],
                        ));
                  setState(() {});
                  categoryController.clear();
                  Navigator.pop(context);
                  // //  Navigator.of(context, rootNavigator: true).pop();
                },
                child: Text("ADD"),
              )
            ],
          ),
        ),
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

//   showCategory() {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         shape: Border.all(width: 6, color: Colors.white70),
//         // backgroundColor: Colors.amber[100],
//         //  shape: Border.all(width: 4, color: Colors.white70),
//         backgroundColor: Colors.lightBlueAccent.shade700,
//         title: Text(
//           " Azhar Quiz Maker \n\n Made By \n\n Faisal Abdrahim \n\nاضف اسم الدرس  من هنا",
//           style: TextStyle(
//             fontFamily: 'SingleDay',
//             fontSize: 20,
//             fontWeight: FontWeight.bold,
//           ),
//           textAlign: TextAlign.center,
//         ),
//         content: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: TextField(
//             textDirection: TextDirection.ltr,
//             // textAlign: TextAlign.center,
//             style: TextStyle(
//               fontFamily: 'ArchitectsDaughter',
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//               fontSize: 30,
//             ),
//             controller: categoryController,
//           ),
//         ),
//         actions: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 ElevatedButton(
//                   onPressed: () {
//                     categoryController.clear();
//                     Navigator.pop(context);
//                   },
//                   child: Text("CANCEL"),
//                 ),
//                 ElevatedButton(
//                   onPressed: () {
//                     setState(() {
//                       categories.add(CategoryModel(
//                         name: categoryController.text,
//                         quizList: [],
//                       ));
//                     });
//                     categoryController.clear();
//                     Navigator.pop(context);
//                   },
//                   child: Text("ADD"),
//                 )
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
}
