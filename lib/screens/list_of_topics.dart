import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../data-classes/topic.dart';
import '../notifiers/topics_notifier.dart';
import '../providers/providers.dart';

/* Created:       14.12.2023
   Last modified  17.12.2023
   jajoutzs@jyu.fi
*/

class ListOfTopics extends ConsumerWidget {
  const ListOfTopics({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topics = ref.watch(topicsProvider);

    final double screenWidth = MediaQuery.of(context).size.width;
    final double columnWidth = screenWidth / 2;

    final ButtonStyle optionStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontSize: 20),
      primary: Colors.white,
      onPrimary: Colors.teal[800],
      side: BorderSide(color: Colors.black),
    );

    return Container(
      width: columnWidth,
      child: Column(
        children: [
          if (topics.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              itemCount: topics.length-1, // TODO: remove -1, if building functionality to include image based quiz
              itemBuilder: (context, index) {
                final topic = topics[index];
                return ElevatedButton(
                  onPressed: () => context.go('/topics/${topic.id}'),
                  style: optionStyle,
                  child: Text(topic.name),
                );
              },
            )
          else
            const Text('No topics available'),
        ],
      ),
    );
  }
}

