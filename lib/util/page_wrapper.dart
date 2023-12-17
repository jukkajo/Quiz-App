import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

/* Created:       13.12.2023
   Last modified  15.12.2023
   jajoutzs@jyu.fi
*/

class PageWrapper extends ConsumerWidget {
  final Widget widget;

  const PageWrapper(this.widget, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Center(
          child: Text(
            'Quizz App',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
            ),
          ),
        ),
        actions: <Widget>[
          Row(
            children: [
              TextButton(
                onPressed: () => context.go('/'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.teal[800],
                  side: BorderSide(color: Colors.black),
                ),
                child: const Text('Topics'),
              ),
              TextButton(
                onPressed: () => context.go('/statistics'),
                style: TextButton.styleFrom(
                  foregroundColor: Colors.teal[800],
                  side: BorderSide(color: Colors.black),
                ),
                child: const Text('Statistics'),
              ),
            ],
          ),
        ],
      ),
      body: widget,
    );
  }
}

