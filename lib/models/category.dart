import 'dart:convert';
import 'package:flutter/foundation.dart';

class CategoryModel {
  String name;
  List<QuizModel> quizList;
  CategoryModel({
    this.name,
    this.quizList,
  });

  CategoryModel copyWith({
    String name,
    List<QuizModel> quizList,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      quizList: quizList ?? this.quizList,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'quizList': quizList.map((x) => x.toMap()).toList(),
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'] ?? '',
      quizList: List<QuizModel>.from(
          map['quizList']?.map((x) => QuizModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) =>
      CategoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'CategoryModel(name: $name, quizList: $quizList)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CategoryModel &&
        other.name == name &&
        listEquals(other.quizList, quizList);
  }

  @override
  int get hashCode => name.hashCode ^ quizList.hashCode;
}

class QuizModel {
  String name;
  String imgUrl;
  String correct;
  List<String> incorrect;
  QuizModel({
    this.name,
    this.imgUrl,
    this.correct,
    this.incorrect,
  });

  QuizModel copyWith({
    String name,
    String imgUrl,
    String correct,
    List<String> incorrect,
  }) {
    return QuizModel(
      name: name ?? this.name,
      imgUrl: imgUrl ?? this.imgUrl,
      correct: correct ?? this.correct,
      incorrect: incorrect ?? this.incorrect,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imgUrl': imgUrl,
      'correct': correct,
      'incorrect': incorrect,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      name: map['name'] ?? '',
      imgUrl: map['imgUrl'] ?? '',
      correct: map['correct'] ?? '',
      incorrect: List<String>.from(map['incorrect']),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'QuizModel(name: $name, imgUrl: $imgUrl, correct: $correct, incorrect: $incorrect)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is QuizModel &&
        other.name == name &&
        other.imgUrl == imgUrl &&
        other.correct == correct &&
        listEquals(other.incorrect, incorrect);
  }

  @override
  int get hashCode {
    return name.hashCode ^
        imgUrl.hashCode ^
        correct.hashCode ^
        incorrect.hashCode;
  }
}

List<CategoryModel> categories = [
  CategoryModel(
    name: "Basic",
    quizList: [
      QuizModel(
        imgUrl: "",
        name: "What is flutter?",
        correct: "Framework",
        incorrect: [
          "Editor",
          "Module",
          "Library",
        ],
      ),
    ],
  ),
];
