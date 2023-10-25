import 'package:flutter/material.dart';
import 'package:flutter_projetinho/view/reportDetailsView.dart';
import '/report.dart';

class ReportListView extends StatefulWidget {
  final ReportManager reportManager;

  const ReportListView({required this.reportManager});

  @override
  // ignore: library_private_types_in_public_api
  _ReportListViewState createState() => _ReportListViewState();
}

class _ReportListViewState extends State<ReportListView> {
  void onDeleteDenuncia(Report denuncia) {
    widget.reportManager.removerDenuncia(denuncia);
    setState(() {}); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Lista de Denúncias'),
      ),
      body: ListView.builder(
        itemCount: widget.reportManager.denuncias.length,
        itemBuilder: (context, index) {
          final denuncia = widget.reportManager.denuncias[index];
          return ListTile(
            title: Text('Denúncia: ${denuncia.descricao}'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ReportDetailsView(
                    denuncia: denuncia,
                    onDelete: () => onDeleteDenuncia(denuncia),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
