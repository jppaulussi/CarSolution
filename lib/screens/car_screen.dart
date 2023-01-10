import 'package:carsolution/models/car_model.dart';
import 'package:carsolution/repository/car_repository.dart';
import 'package:flutter/material.dart';


class CarScreen extends StatefulWidget {
  @override
  _CarScreenState createState() => _CarScreenState();
}

class _CarScreenState extends State<CarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Situação do Seu Carro"),
      ),
      body: FutureBuilder<List<carmodel>>(
        future: CarRepository().findAllAsync(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.hasError) {
              return Text('${snapshot.error}');
            } else if (snapshot.hasData) {
              var data = snapshot.data!;
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return cardCurso(data[index]);
                },
              );
            } else {
              return Text('Nenhum curso disponível');
            }
          }
        },
      ),
    );
  }

  Card cardCurso(carmodel curso) {
    return Card(
      elevation: 12.0,
      margin: EdgeInsets.symmetric(
        horizontal: 12.0,
        vertical: 6.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 180, 36, 26),
        ),
        child: ListTile(
          contentPadding:
              EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
          leading: Container(
            padding: EdgeInsets.only(right: 12.0),
            decoration: new BoxDecoration(
              border: Border(
                right: BorderSide(
                  width: 1.0,
                  color: Colors.white24,
                ),
              ),
            ),
            child: Icon(
              Icons.car_repair,
              color: Colors.white,
            ),
          ),
          title: Text(
            curso.nome,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Container(
                  child: LinearProgressIndicator(
                    backgroundColor: Color.fromRGBO(209, 224, 224, 0.2),
                    value: curso.percentualConclusao,
                    valueColor: AlwaysStoppedAnimation(Colors.orangeAccent),
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    curso.nivel,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          trailing: Icon(
            Icons.crisis_alert,
            color: Colors.white,
            size: 30.0,
          ),
          onTap: () {
            navegarTelaCursoDetalhes(context, curso);
          },
        ),
      ),
    );
  }

  void navegarTelaCursoDetalhes(ctx, curso) async {
    final retorno = await Navigator.pushNamed(
      ctx,
      "/game_info",
      arguments: curso,
    );

    carmodel? CarModel = retorno as carmodel?;

    if ( CarModel != null) {
      print( CarModel.nome);
    }
  }
}
