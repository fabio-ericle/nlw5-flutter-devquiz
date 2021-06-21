import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:aplicacao_nlw5/shared/models/question_model.dart';

enum Level { facil, medio, dificil, perito }

extension LevelStringExt on String {
  Level get levelParse => {
        "facil": Level.facil,
        "dicicil": Level.dificil,
        "medio": Level.medio,
        "peirito": Level.perito,
      }[this];
}

class QuizModel {
  final String title;
  final List<QuestionModel> questions;
  final int questionsAnswered;
  final String imagem;
  final Level level;

  QuizModel({
    this.questionsAnswered = 0,
    @required this.imagem,
    @required this.level,
    @required this.title,
    @required this.questions,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'questions': questions.map((x) => x.toMap()).toList(),
      'questionAnswered': questionsAnswered,
      'imagem': imagem,
      'level': level,
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      title: map['title'],
      questions: List<QuestionModel>.from(
          map['questions'].map((x) => QuestionModel.fromMap(x))),
      questionsAnswered: map['questionsAnswered'],
      imagem: map['imagem'],
      level: map['level'].toString().levelParse,
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source));
}
