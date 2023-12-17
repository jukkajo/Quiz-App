import 'dart:math';
import '../data-classes/topic.dart';
import '../data-classes/topic_score.dart';
/* Created:       17.12.2023
   Last modified  17.12.2023
   jajoutzs@jyu.fi
*/
List<TopicScore> topicSpecificScoreAccess(List<Topic> topics, Map<String, dynamic> statistics) {
  List<TopicScore> topicsScore = [];

  for (final topic in topics) {
    int topicId = topic.id;
    topicsScore.add(TopicScore(
        topicId: topicId,
        name: topic.name,
        score: statistics[topicId.toString()] ?? 0));
  }
  topicsScore.sort((a, b) => b.score.compareTo(a.score));

  return topicsScore;
}
