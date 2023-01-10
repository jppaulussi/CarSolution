import 'package:carsolution/models/car_model.dart';
import 'package:carsolution/screens/maps_screen.dart';
import 'package:flutter/material.dart';


class CarInfoScrenn extends StatelessWidget {
  CarInfoScrenn({Key? key}) : super(key: key);

  late carmodel CarModel;

  @override
  Widget build(BuildContext context) {
    CarModel = ModalRoute.of(context)!.settings.arguments as carmodel;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(CarModel.nome),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            labelValue('Criticidade do Item'),
            fieldValue(CarModel.id.toString()),
            espaco(),
            labelValue('Nível de Desgaste'),
            fieldValue(CarModel.nivel),
            espaco(),
            labelValue('Tempo desde a ultima Troca'),
            fieldValue(CarModel.tempo.toString()),
            espaco(),
            labelValue('Porcentagem do Desgaste'),
            fieldValue((CarModel.percentualConclusao * 100).toString()),
            espaco(),
            labelValue('Instruções'),
            fieldValue(CarModel.conteudo),
            espaco(),
            Center(
              child: ElevatedButton(
                child: Text("Finalizado!"),
                onPressed: () {
                  Navigator.push(
                    context,
                   MaterialPageRoute(builder: (context) => MyApp()),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        backgroundColor: Color.fromARGB(255, 180, 36, 26),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  SizedBox espaco() => SizedBox(
        height: 16,
      );

  Widget labelValue(String _label) {
    return Text(
      '$_label:',
      textAlign: TextAlign.left,
      style: TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
        fontSize: 18,
      ),
    );
  }

  Widget fieldValue(String _value) {
    return Text(
      _value,
      style: TextStyle(
        color: Colors.black,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w800,
        fontSize: 20,
      ),
    );
  }
}
