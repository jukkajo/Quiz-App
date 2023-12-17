import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../notifiers/question_notifier.dart';
import '../data-classes/question_state.dart';
import '../data-classes/topic.dart';
import '../notifiers/statistics_notifier.dart';
import '../data-classes/question.dart';
import '../providers/providers.dart';

/* Created:       13.12.2023
   Last modified  17.12.2023
   jajoutzs@jyu.fi
*/


class QuestionFunctionality extends ConsumerWidget {
  final int topicId;
  const QuestionFunctionality(this.topicId);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final question = ref.watch(questionProvider).question;
    final isCorrect = ref.watch(questionProvider).correct;
    final answer = ref.watch(questionProvider).answer;

    final double screenWidth = MediaQuery.of(context).size.width;
    final double columnWidth = screenWidth / 3;

    final TextStyle styleWrong = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red);
    final TextStyle styleCorrect = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.green);
    
    final ButtonStyle optionStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      primary: Colors.white,
      maximumSize: Size(150, 40),
      onPrimary: Colors.amber[600],
      side: BorderSide(color: Colors.black),
    );
    
    

    if (ref.read(questionProvider).topicId != topicId || question == null) {
      ref.read(questionProvider.notifier).fetchQuestion(topicId);
    }

    if (question == null) {
      return SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              'Something unexpected happened. Try again:',
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(questionProvider.notifier).fetchQuestion(topicId);
              },
              child: const Text('Try to fetch the question again'),
            ),
          ],
        ),
      );
    }

    if (question.question != null &&
        question.options != null &&
        question.options.isNotEmpty) {
      return Container(
        width: columnWidth,
        child: Column(
          children: [
            //-----------------------------------------------------------
            Text(
              question.question,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            //-----------------------------------------------------------
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.options.length,
              itemBuilder: (context, index) {
                final option = question.options[index];

                return ElevatedButton(
                  onPressed: () {
                    ref.read(questionProvider.notifier).correctOrNot(
                          topicId,
                          question.id,
                          option,
                        );
                  },
                  style: optionStyle,
                  child: Text(option),
                );
              },
            ),
            //-----------------------------------------------------------
            if (isCorrect != null)
              (!isCorrect)
              ? Text(
                  'Wrong answer. Try again!',
                  style: styleWrong
                )
              : Column(children: [
                  Text(
                    'Correct one!',
                    style: styleCorrect
                ), 
                  ElevatedButton(
                      onPressed: () {
                        ref.read(statisticsProvider.notifier).incrementCorrectlyAnswered(topicId);
                        ref.read(questionProvider.notifier).fetchQuestion(topicId);
                     },
                     child: const Text('Next'))
                
                ])
            //-----------------------------------------------------------

          ],
        ),
      );
    } else {
      return const Text("Something unexpected happened :/ ");
    }
  }
}

