import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../notifiers/question_notifier.dart';
import '../data-classes/question_state.dart';
import '../notifiers/statistics_notifier.dart';
import '../notifiers/topics_notifier.dart';
import '../data-classes/topic.dart';

/* Created:       16.12.2023
   Last modified  17.12.2023
   jajoutzs@jyu.fi
*/

final sharedPreferencesProvider =
    Provider<SharedPreferences>((ref) => throw UnimplementedError());

final topicsProvider =
    StateNotifierProvider<TopicsNotifier, List<Topic>>((ref) {
  final topicsNotifier = TopicsNotifier();
  topicsNotifier.initialize();
  return topicsNotifier;
});

final questionProvider =
    StateNotifierProvider<QuestionNotifier, QuestionState>((ref) {
  final questionNotifier = QuestionNotifier();
  return questionNotifier;
});

final statisticsProvider =
    StateNotifierProvider<StatisticsNotifier, Map<String, dynamic>>((ref) {
  final statisticsNotifier = StatisticsNotifier(ref.watch(sharedPreferencesProvider));
  statisticsNotifier.initialize();
  return statisticsNotifier;
});
