import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projetinho/view/reportListView.dart';
import '/report.dart';

class ReportView extends StatefulWidget {
  final ReportManager reportManager;

  const ReportView({required this.reportManager});

  @override
  // ignore: library_private_types_in_public_api
  _ReportViewState createState() => _ReportViewState();
}

class _ReportViewState extends State<ReportView> {
  final TextEditingController dataController = TextEditingController();
  final TextEditingController localController = TextEditingController();
  final TextEditingController descricaoController = TextEditingController();

  void _enviarDenuncia() {
    final novaDenuncia = Report(
      data: dataController.text,
      local: localController.text,
      descricao: descricaoController.text,
    );

    widget.reportManager.criarDenuncia(novaDenuncia);

    dataController.clear();
    localController.clear();
    descricaoController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Fazer Denúncia'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              // ignore: use_build_context_synchronously
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.list),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    ReportListView(reportManager: widget.reportManager),
              ),
            );
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            TextField(
              controller: dataController,
              decoration: const InputDecoration(
                labelText: 'Data',
              ),
            ),
            TextField(
              controller: localController,
              decoration: const InputDecoration(
                labelText: 'Local',
              ),
            ),
            TextField(
              controller: descricaoController,
              decoration: const InputDecoration(
                labelText: 'Descrição do Animal',
              ),
              maxLines: 3,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _enviarDenuncia,
              style: ElevatedButton.styleFrom(primary: Colors.orange),
              child: const Text('Enviar Denúncia'),
            ),
          ],
        ),
      ),
    );
  }
}
