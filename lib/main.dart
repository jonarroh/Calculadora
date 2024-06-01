import 'package:flutter/material.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora',
      debugShowCheckedModeBanner: false,
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
  double _num1 = 0;
  double _num2 = 0;
  String _visualOperation = '';
  double _result =0;
  String _operation = '+';

  void _setNum1(double value) {
    setState(() {
      _num1 = value;
    });
  }

  void _setNum2(double value) {
    setState(() {
      _num2 = value;
    });
  }

  void _setVisualOperation(String value) {
    setState(() {
      _visualOperation += value;
    });
  }

  void _ResetVisualOperation() {
    setState(() {
      _visualOperation = '';
    });
  }

  void _DeleteLastVisualOperation() {
    setState(() {
      _visualOperation = _visualOperation.substring(0, _visualOperation.length - 1);
    });
  }

  void _setOperation(String value) {
    setState(() {
      _operation = value;
    });
  }

  _setResult() {
   var num1 = _visualOperation.split(_operation)[0];
    var num2 = _visualOperation.split(_operation)[1];
    _num1 = double.parse(num1);
    _num2 = double.parse(num2);

    switch (_operation) {
      case '+':
        _result = _num1 + _num2;
        break;
      case '-':
        _result = _num1 - _num2;
        break;
      case '*':
        _result = _num1 * _num2;
        break;
      case '/':
        _result = _num1 / _num2;
        break;
    }
    setState(() {
      _visualOperation = _result.toString();
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.blue,
        child: Container(
          width: 500,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                controller: TextEditingController(text: _visualOperation),
                style: TextStyle(
                  fontSize: 50,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculadoraButton(text: '7', onPressed: (){
                    _setVisualOperation('7');
                  }),
                  CalculadoraButton(text: '8', onPressed: (){
                    _setVisualOperation('8');
                  }),
                  CalculadoraButton(text: '9', onPressed: (){
                    _setVisualOperation('9');
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculadoraButton(text: '4', onPressed: (){
                    _setVisualOperation('4');
                  }),
                  CalculadoraButton(text: '5', onPressed: (){
                    _setVisualOperation('5');
                  }),
                  CalculadoraButton(text: '6', onPressed: (){
                    _setVisualOperation('6');
                  }),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculadoraButton(text: '1', onPressed: (){
                    _setVisualOperation('1');
                  }),
                  CalculadoraButton(text: '2', onPressed: (){
                    _setVisualOperation('2');
                  }),
                  CalculadoraButton(text: '3', onPressed: (){
                    _setVisualOperation('3');
                  }),
                  CalculadoraButton(text: "cls", onPressed: (){
                    _ResetVisualOperation();

                  })
                ],

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculadoraButton(text: '0', onPressed: (){
                    _setVisualOperation('0');
                  }),
                  CalculadoraButton(text: '.', onPressed: (){
                    _setVisualOperation('.');
                  }),
                  CalculadoraButton(text: '=', onPressed: (){
                    _setResult();
                  }),
                  CalculadoraButton(text: "DEL", onPressed: (){
                    _DeleteLastVisualOperation();
                  })
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CalculadoraButton(text: '+', onPressed: (){
                    _setVisualOperation('+');
                    _setOperation('+');
                  }),
                  CalculadoraButton(text: '-', onPressed: (){
                    _setVisualOperation('-');
                    _setOperation('-');
                  }),
                  CalculadoraButton(text: '*', onPressed: (){
                    _setVisualOperation('*');
                    _setOperation('*');
                  }),
                  CalculadoraButton(text: '/', onPressed: (){
                    _setVisualOperation('/');
                    _setOperation('/');
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}


class CalculadoraButton extends StatelessWidget {
  const CalculadoraButton({super.key, required this.text, required this.onPressed});

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 100,
        height: 100,
        child: InkWell(
          onTap: onPressed,
          child: Text(
            text,
            style: TextStyle(
              fontSize: 30,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ),
    );
  }
}