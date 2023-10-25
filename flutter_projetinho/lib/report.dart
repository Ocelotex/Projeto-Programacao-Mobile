class Report {
  String data;
  String local;
  String descricao;

  Report({required this.data, required this.local, required this.descricao});
}

class ReportManager {
  List<Report> denuncias = [];

  // Adicionar uma nova denúncia à lista
  void criarDenuncia(Report denuncia) {
    denuncias.add(denuncia);
  }

  // Remover uma denúncia da lista
  void removerDenuncia(Report denuncia) {
    denuncias.remove(denuncia);
  }
}
