import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../util/page_wrapper.dart';
import './question_functionality.dart';

/* Created:       15.12.2023
   Last modified  15.12.2023
   jajoutzs@jyu.fi
*/

class QuestionView extends StatelessWidget {
  final int topicId;
  const QuestionView(this.topicId);

  @override
  Widget build(BuildContext context) {
    return PageWrapper(
        Center(child: QuestionFunctionality(topicId)));
  }
}
