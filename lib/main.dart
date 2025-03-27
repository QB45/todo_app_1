import 'package:flutter/material.dart';
import 'package:todo_app_1/components/fake_data.dart';

void main() {
  runApp(const ToDoPractice());
}

class ToDoPractice extends StatelessWidget {
  const ToDoPractice({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter  Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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
  int _counter = 0;
  DateTime? selectedDate;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Current date
      firstDate: DateTime(2000), // Earliest date
      lastDate: DateTime(2101), // Latest date
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  //   void _pickDate() {
  //   setState(() {
  //     showDatePicker(
  //         context: context,
  //         initialDate: DateTime.now(), //get today's date
  //         firstDate: DateTime(
  //             2000), //DateTime.now() - not to allow to choose before today.
  //         lastDate: DateTime(2101));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: _incrementCounter,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.amber,
                  child: Center(child: Text('create task')),
                ),
              ),
            ),

            // ElevatedButton(onPressed: _incrementCounter, child: Text("data")),

            SizedBox(
              height: 230,
              child: ListView.builder(
                  itemCount: taskList.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: ((context, index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              height: 60,
                              width: double.infinity,
                              color: Colors.cyanAccent,
                              child: Center(
                                  child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(taskList[index].taskName!,
                                          style: TextStyle(fontSize: 18)),
                                      Text(
                                          'Start Time:${taskList[index].startDate}$selectedDate',
                                          style: TextStyle(fontSize: 10.5)),
                                      Text(
                                          'End Time:${taskList[index].endDate}',
                                          style: TextStyle(fontSize: 10.5)),
                                    ],
                                  )),
                                  InkWell(
                                      onTap: _pickDate,
                                      // onTap: _pickDate,
                                      child: Icon(Icons.edit)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          taskList.removeAt(index);
                                        });
                                      },
                                      child: Icon(Icons.delete)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ))),
                        ),
                      ],
                    );
                  })),
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
