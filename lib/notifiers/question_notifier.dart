import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../data-classes/question.dart';
import '../data-classes/question_state.dart';
import '../services/services.dart';

/* Created:       14.12.2023
   Last modified  17.12.2023
   jajoutzs@jyu.fi
*/


class QuestionNotifier extends StateNotifier<QuestionState> {
  final service = Services();
  QuestionNotifier() : super(QuestionState());

  fetchQuestion(int topicId) async {
    Question question = await service.retrieveQuestion(topicId);
    state = state.questionSetter(newTopicId: topicId, newQuestion: question);
  }

  correctOrNot(int topicId, int questioId, String answer) async {
    bool result = await service.correctOrNot(topicId, questioId, answer);
    state = state.answerSetter(newAnswer: answer, correctOrNot: result);
  }
}
