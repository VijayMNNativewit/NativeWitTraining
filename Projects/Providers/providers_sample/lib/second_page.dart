import 'package:flutter/material.dart';
import 'main.dart';
import 'package:provider/provider.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Text('Second Page'),
            Count(),
            Counts(),
          ],
        ),
      ),
    );
  }
}

class Counts extends StatelessWidget {
  const Counts({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Counter>(
      builder: (context, counter, widgte) => widgte,
      child: Text(

          /// Calls `context.watch` to make [Count] rebuild when [Counter] changes.
          '${context.watch<Counter>().count}',
          key: const Key('counterState'),
          style: Theme.of(context).textTheme.headline4),
    );
  }
}
