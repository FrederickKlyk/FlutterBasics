import 'package:demo1/ui/pageb/PageB.dart';
import 'package:demo1/ui/widgets/AppDrawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Counter.dart';
import '../CounterEvent.dart';

/// A [StatelessWidget] which is responsible for providing a
/// [CounterCubit] instance to the [CounterView].
class CounterPage extends StatelessWidget {
  static const String routeName = '/counterpage';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CounterFlutterBloc(),
      child: _CounterPage(),
    );
  }
}

/// A [StatelessWidget] which reacts to the provided
/// [CounterCubit] state and notifies it in response to user input.
class _CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: Text("Meine CounterApp")),
      drawer: AppDrawer(),
      body: Center(
        child: BlocBuilder<CounterFlutterBloc, int>(
          builder: (context, state) =>
              Text("$state", style: textTheme.headline2),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              heroTag: "btn1",
              key: Key("counterView_increment_fab"),
              child: Icon(Icons.add),
              onPressed: () => context
                  .read<CounterFlutterBloc>()
                  .add(CounterEvent.Increment)),
          SizedBox(height: 8),
          FloatingActionButton(
              heroTag: "btn2",
              key: Key("counterView_decrement_fab"),
              child: Icon(Icons.remove),
              onPressed: () => context
                  .read<CounterFlutterBloc>()
                  .add(CounterEvent.Decrement)),
          SizedBox(height: 8),
          FloatingActionButton(
              heroTag: "btn3",
              key: Key("counterView_next_page"),
              child: Icon(Icons.add_location),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute<PageB>(builder: (context) => PageB())))
        ],
      ),
    );
  }
}
