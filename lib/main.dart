import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int dado = 0;
  String? resultado;

  somatorio(int numero) {
    int soma = 0;
    for (int i = 0; i < numero; i++) {
      if (i % 3 == 0 || i % 5 == 0) {
        soma += i;
      }
    }
    return soma;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desafio'),
      ),
      body: Container(
        height: 500,
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.only(
            top: 30,
            left: 30,
            right: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Text(
                    'Teste Técnico 01',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w400,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Insira um número inteiro.',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  color: Colors.black87,
                ),
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Número',
                    labelStyle: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Informe um valor';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    dado = int.parse(value);
                  }),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    resultado = somatorio(dado).toString();
                    setState(() {
                      resultado = resultado;
                    });
                  },
                  child: Text('Calcular'),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              resultado != null
                  ? Text(
                      'A soma dos divisíveis é: $resultado',
                      style: TextStyle(
                        fontSize: 28,
                        color: Colors.black87,
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
