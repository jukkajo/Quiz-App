import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:go_router/go_router.dart';

import './util/page_wrapper.dart';
import './data-classes/topic.dart';
import './screens/list_of_topics.dart';
import './screens/question_view.dart';
import './data-classes/question_state.dart';
import './screens/statistics_view.dart';
import './providers/providers.dart';

/* Created:       13.12.2023
   Last modified  17.12.2023
   jajoutzs@jyu.fi
*/

class QuizApp extends StatelessWidget {
  const QuizApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: GoRouter(
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const PageWrapper(
              Center(child: ListOfTopics()),
            ),
          ),
          GoRoute(
            path: '/statistics',
            builder: (context, state) => PageWrapper(
              Center(child: StatisticsView()),
            ),
          ),
          GoRoute(
            path: '/topics/:id',
            builder: (context, state) => QuestionView(int.parse(state.pathParameters['id']!)),
          ),
        ],
      ),
    );
  }
}

main() async {
  final prefs = await SharedPreferences.getInstance();
  runApp(ProviderScope(
    overrides: [
      sharedPreferencesProvider.overrideWithValue(prefs),
    ],
    child: const QuizApp(),
  ));
}

