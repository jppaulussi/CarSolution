class carmodel {
  int id;
  String nome;
  String nivel;
  double percentualConclusao;
  int tempo;
  String conteudo;

  carmodel({
    required this.id,
    required this.nome,
    required this.nivel,
    this.percentualConclusao = 0,
    required this.tempo,
    this.conteudo = '',
  });
}
