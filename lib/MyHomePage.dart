
import 'package:demo1/CounterBloc.dart';
import 'package:demo1/main.dart';
import 'package:demo1/ui/counter/CounterEvent.dart';
import 'package:flutter/material.dart';

@deprecated
class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

@deprecated
class _MyHomePageState extends State<MyHomePage>{
  final CounterBloc _counterBloc = CounterBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            MyButton(_counterBloc),
            Text(
              'You have pushed the button this many times:',
            ),
            // wrap counter text with StreamBuilder
            // it rebuilds itself when new data comes in stream
            StreamBuilder<int>(
              stream: _counterBloc.counterStream,
              initialData: 0,
              builder: (context, snapshot){
                //get the data
                final counter = snapshot.data;
                return Text(
                  '$counter',
                  style: Theme.of(context).textTheme.headline4
                );
              },
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // this call back will be called on button press
  void _incrementCounter() {
    // add event to notify bloc
    _counterBloc.eventSink.add(CounterEvent.Increment);
  }

  @override
  void dispose() {
    _counterBloc.dispose();
    super.dispose();
  }
}