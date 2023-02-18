import 'package:flutter/material.dart';

extension ValidDigit on String {
  //this is only for integer set in textformfield
  bool isValidDigit() {
    var length = this?.length ?? 0;
    if (length != 0) {
      for (var i = 0; i < length; i++) {
        var code = this.codeUnits[i] ?? 0;
        if (!(code >= 48 && code <= 57)) {
          return false;
        }
      }
      return true;
    }
    return false;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: globalKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFormField(
                validator: (value) {
                  if (value!.length >= 6) {
                    return null;
                  } else {
                    return 'invalid';
                  }
                },
              ),
              TextFormField(
                validator: (value) {
                  for (var i = 0; i < value!.length; i++) {
                    // the codeUnit number 48 to 57 is ASCII Table is only for digit and only string are other codeUnit in ASCII Table
                    if (!(value.codeUnits[i] >= 48 &&
                        value.codeUnits[i] <= 57)) {
                      return 'invalid digit';
                    }
                    return null;
                  }
                },
                // validator: (value) {
                //   if (value!.isValidDigit()) {
                //     return null;
                //   } else {
                //     return 'invalid';
                //   }
                // },
              ),
              TextFormField(),
              ElevatedButton(
                  onPressed: () {
                    globalKey.currentState!.validate();
                  },
                  child: Text('Click'))
              // TextFormField(
              //   decoration: InputDecoration(
              //       labelText: 'name', border: OutlineInputBorder()),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'name should not empty';
              //     }
              //   },
              // ),
              // TextFormField(
              //   decoration: InputDecoration(
              //       labelText: 'password', border: OutlineInputBorder()),
              //   validator: (value) {
              //     if (value!.isEmpty) {
              //       return 'Password should not empty';
              //     } else if (value.length <= 6) {
              //       return 'password atleast 6 digit';
              //     }
              //   },
              // ),
              // ElevatedButton(
              //     onPressed: () {
              //       setState(() {
              //         if (globalKey.currentState!.validate()) {
              //           ScaffoldMessenger.of(context).showSnackBar(
              //               SnackBar(content: Text('Feilds upgrade')));
              //         } else {
              //           ScaffoldMessenger.of(context).showSnackBar(
              //               SnackBar(content: Text('Feilds should not empty')));
              //         }
              //       });
              //     },
              //     child: Text('SignIn'))
            ],
          ),
        ),
      ),
    );
  }
}
