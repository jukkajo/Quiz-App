import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/* Created:       13.12.2023
   Last modified  15.12.2023
   jajoutzs@jyu.fi
*/

class Topic {
  final int id;
  final String name;
  final String questionPath;

  Topic(this.id, this.name, this.questionPath);

  Topic.fromJson(Map<String, dynamic> jsonData)
      : id = jsonData['id'],
        name = jsonData['name'],
        questionPath = jsonData['question_path'];
}
