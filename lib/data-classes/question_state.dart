import './question.dart';

/* Created:       15.12.2023
   Last modified  15.12.2023
   jajoutzs@jyu.fi
*/


class QuestionState {
  int? topicId;
  Question? question;
  String? answer;
  bool? correct;

  QuestionState({this.topicId, this.question, this.answer, this.correct});

  QuestionState questionSetter({int? newTopicId, Question? newQuestion}) {
    return QuestionState(
      topicId: newTopicId ?? topicId,
      question: newQuestion ?? question,
      answer: null,
      correct: null,
    );
  }

  QuestionState answerSetter({String? newAnswer, bool? correctOrNot}) {
    return QuestionState(
      topicId: topicId,
      question: question,
      answer: newAnswer ?? answer,
      correct: correctOrNot ?? correct,
    );
  }
}
