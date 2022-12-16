import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/counter_cubit.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context)=> CounterCubit(),
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const MyHomePage(title: 'My own app on iphone 11'),

      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

//   void _increment() {
//     setState(() {
// _counter++;
//     });
//   }
//   void _decrement(){
//     setState(() {
//       _counter--;
//     });
//   }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 ElevatedButton(onPressed: (){
                   BlocProvider.of<CounterCubit>(context).increment();
                   },
                     child: const Icon(Icons.plus_one)),
                 const SizedBox(width: 20),
                 ElevatedButton(onPressed: (){
                   BlocProvider.of<CounterCubit>(context).decrement();
                 },
                     child:const Icon(Icons.exposure_minus_1)),
               ],
             ),
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (context,state){
                if(state.wasIncremented==true){
                  ScaffoldMessenger.of(context).showSnackBar(
                      const  SnackBar(
                          content: Text ('Incremented!'),
                          duration: Duration(milliseconds: 300)));
                }
                else {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const  SnackBar(
                          content: Text ('Decremented!'),
                          duration: Duration(milliseconds: 300)));
                }
              },
              builder: (context, state){
                  return Text(
                state.counterValue.toString(),
                style: Theme.of(context).textTheme.headline4
              );
                }
            ),
          ],
        ),
      )
    );
  }
}
