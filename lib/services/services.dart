import 'dart:convert';
import 'package:http/http.dart' as http;

import '../data-classes/topic.dart';
import '../data-classes/question.dart';

/* Created:       14.12.2023
   Last modified  17.12.2023
   jajoutzs@jyu.fi
*/

class Services {

  Future<Question> retrieveQuestion(int topicId) async {
    var response = await http.get(Uri.parse('https://dad-quiz-api.deno.dev/topics/$topicId/questions'));
    var data = jsonDecode(response.body);
    return Question.fromJson(data);
  }

  Future<bool> correctOrNot(int topicId, int questionId, String answer) async {
    var response = await http.post(
        Uri.parse('https://dad-quiz-api.deno.dev/topics/$topicId/questions/$questionId/answers'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({"answer": answer}));
    var data = jsonDecode(response.body);
    return data['correct'];
  }

  Future<List<Topic>> retrieveTopics() async {
    var response = await http.get(Uri.parse('https://dad-quiz-api.deno.dev/topics'));
    List<dynamic> items = jsonDecode(response.body);
    return List<Topic>.from(
        items.map((jsonData) => Topic.fromJson(jsonData)));
  }
  
}
