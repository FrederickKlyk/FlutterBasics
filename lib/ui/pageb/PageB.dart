import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import 'PageBCubit.dart';

final GetIt sl = GetIt.instance;

class PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl.get<PageBCubit>(),
      child: _PageB(),
    );
  }
}

class _PageB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<PageBCubit>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Page2")),
      body: Center(
        child: BlocConsumer<PageBCubit, int>(
            listener: (context, state){
              
            },
            builder: (context, state) => Text("State: $state")),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            child: Icon(Icons.add),
            onPressed: () => bloc.increment(),
          ),
          SizedBox(height: 8),
          ElevatedButton(
              onPressed: () => bloc.insertIntoDB(),
              child: Text("Add TV to DB")),
          SizedBox(height: 8),
          ElevatedButton(
              onPressed: () => bloc.getFromDB(),
              child: Text("Get Data from DB")),
        ],
      ),
    );
  }
}
