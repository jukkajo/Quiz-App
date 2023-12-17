import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

import '../providers/providers.dart';
import '../util/topic_specific_score_access.dart';
import '../data-classes/topic_score.dart';

/* Created:       16.12.2023
   Last modified  17.12.2023
   jajoutzs@jyu.fi
*/

class StatisticsView extends ConsumerWidget {
  const StatisticsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topics = ref.watch(topicsProvider);
    final statistics = ref.watch(statisticsProvider);

    List<TopicScore> topicSpecificScoreList = topicSpecificScoreAccess(topics, statistics);

    final TextStyle styleForText = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.teal[800]);
    final TextStyle styleForTitle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black);
    final TextStyle styleForCounts = TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.amber[600]);

    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 6.0),
              child: Text('Your answer statistics', style: styleForTitle),
            ),
            Table(
              columnWidths: const <int, TableColumnWidth>{
                0: IntrinsicColumnWidth(),
                1: IntrinsicColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(
                  children: [
                    Text('Topics', style: styleForTitle),
                    Text('Correctly answered:', style: styleForTitle),
                  ],
                ),
                TableRow(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(right: 25.0),
                      child: Text('Total count', style: styleForText),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${statistics['total'] ?? 0}', style: styleForCounts),
                      ],
                    ),
                  ],
                ),
                ...topicSpecificScoreList.map((statistic) => TableRow(children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25.0),
                    child: Text(statistic.name, style: styleForText),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${statistic.score}', style: styleForCounts),
                    ],
                  ),
                ])),
              ],
            )
          ],
        ),
      ),
    );
  }
}

