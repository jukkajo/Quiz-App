import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../services/services.dart';
import '../data-classes/topic.dart';

/* Created:       14.12.2023
   Last modified  17.12.2023
   jajoutzs@jyu.fi
*/

class TopicsNotifier extends StateNotifier<List<Topic>> {
  final service = Services();
  TopicsNotifier() : super([]);

  Future<void> initialize() async {
    state = await service.retrieveTopics();
  }
}
