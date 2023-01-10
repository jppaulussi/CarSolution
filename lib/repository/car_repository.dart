import 'package:carsolution/models/car_model.dart';
import 'package:carsolution/repository/database.dart';


class CarRepository {
  Future<List<carmodel>> findAllAsync() async {
    var db = Database();
    await db.createDatabase();

    return <carmodel>[
      carmodel(
        id: 1,
        nome: 'Bateria',
        nivel: 'Extremamente Ruim ',
        percentualConclusao: 1,
        tempo: 2000,
        conteudo:
            'Realizar a troca da Bateria o mais rapido possivel para evitar problemas maiores com a parte eletrica',
      ),
      carmodel(
          id: 3,
          nome: 'Nivel do Oleo',
          nivel: 'Bom ',
          percentualConclusao: 0.4,
          tempo: 150,
          conteudo:
              'Verificar o nivel de oleo na vareta de Oleo'),
      carmodel(
          id: 4,
          nome: 'Nivel de Agua',
          nivel: 'Normal ',
          percentualConclusao: 0.7,
          tempo: 800,
          conteudo:
              'Verificar o nivel do reservatorio de agua'),
      carmodel(
          id: 2,
          nome: 'Situação do motor',
          nivel: 'Normal ',
          percentualConclusao: 0.6,
          tempo: 500,
          conteudo: 'Verificar por anomalias de trepidação ou emissão de gases e vazamentos'),
      carmodel(
          id: 5,
          nome: 'Nivel de Gases Emitidos',
          nivel: 'Extremamente Bom',
          percentualConclusao: 0,
          tempo: 0,
          conteudo: 'Verificar a gasolina os bicos ingetores e a situação do motor'),
      carmodel(
          id: 6,
          nome: 'Situação das Rodas',
          nivel: 'Bom ',
          percentualConclusao: 0.4,
          tempo: 50,
          conteudo: 'Verificar a aderencia e os vincos da roda'),
    ];
  }
}
