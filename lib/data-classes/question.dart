/* Created:       13.12.2023
   Last modified  15.12.2023
   jajoutzs@jyu.fi
*/

class Question {
  int id;
  String question;
  List<dynamic> options;
  String answerPostPath;

  Question(this.id, this.question, this.options, this.answerPostPath);

  Question.fromJson(Map<String, dynamic> jsonData)
      : id = jsonData['id'],
        question = jsonData['question'],
        options = jsonData['options'],
        answerPostPath = jsonData['answer_post_path'];
}
