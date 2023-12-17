import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

/* Created:       13.12.2023
   Last modified  16.12.2023
   jajoutzs@jyu.fi
*/

class StatisticsNotifier extends StateNotifier<Map<String, dynamic>> {
  final SharedPreferences prefs;
  StatisticsNotifier(this.prefs) : super({});

  initialize() async {
    final keys = prefs.getKeys();
    final prefsMap = <String, dynamic>{};
    for (String key in keys) {
      prefsMap[key] = prefs.get(key);
    }
    state = prefsMap;
  }

  incrementCorrectlyAnswered(int topicId) async {
  
    int specificCount = prefs.getInt('$topicId') ?? 0;
    state['$topicId'] = specificCount++;
    prefs.setInt('$topicId', specificCount++);
    int totalCount = prefs.getInt('total') ?? 0;
    state['total'] = totalCount++;
    prefs.setInt('total', totalCount++);
  }
}
