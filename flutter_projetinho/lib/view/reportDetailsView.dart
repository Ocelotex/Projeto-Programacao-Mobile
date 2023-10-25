import 'package:flutter/material.dart';
import '/report.dart';

class ReportDetailsView extends StatelessWidget {
  final Report denuncia;
  final Function onDelete;

  const ReportDetailsView({required this.denuncia, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Detalhes da Denúncia'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDelete();
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Denúncia: ${denuncia.descricao}',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text('Data: ${denuncia.data}'),
            Text('Local: ${denuncia.local}'),
          ],
        ),
      ),
    );
  }
}
