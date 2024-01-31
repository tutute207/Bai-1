import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return _CounterPageState();
  }
}

class MyObject {
  int _value;

  MyObject({required int value}) : _value = value;

  int get getValue => _value;

  set setValue(int newValue) {
    _value = newValue;
  }

  void increase() {
    _value++;
  }

  void decrease() {
    _value--;
  }

  int square() {
    return _value * _value;
  }

  int power(int a, int b) {
    if (b == 0) {
      return 1;
    }
    int x = power(a, b ~/ 2);
    if (b % 2 == 1) {
      return x * x * a;
    } else {
      return x * x;
    }
  }
}

class _CounterPageState extends State<CounterPage> {
  MyObject _myObject = MyObject(value: 0);
   int n = 0;
   int luythua = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Counter Page"),
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                    hintText: "Nhập số n",
                  contentPadding:const EdgeInsets.all(10.0),
                ),
                onChanged: (value) {
                  n = int.tryParse(value) ?? 0;
                  setState(() {
                  });
                },
              // Thêm khoảng cách bằng EdgeInsets
              ),
              const SizedBox(
                height: 20,
              ),



              Text("Giá trị hiện tại : ${_myObject.getValue}"),
              Text(
                  "Giá trị của phép tính lũy thừa bậc ${n} bằng phương thức power là :${luythua}"),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton.icon(
                    onPressed: () {
                      _myObject.decrease();
                      setState(() {});
                    },
                    icon: const Icon(Icons.remove),
                    label: const Text("Giảm"),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      _myObject.increase();
                      setState(() {});
                    },
                    icon: const Icon(Icons.add),
                    label: const Text("Tăng"),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  OutlinedButton.icon(
                    onPressed: () {
                      luythua = _myObject.power(_myObject.getValue, n);
                      setState(() {});
                    },
                    icon: const Icon(Icons.ac_unit_sharp),
                    label: const Text("Tính lũy thừa"),
                  )
                ],
              ),
            ],
          )),
    );
  }
}