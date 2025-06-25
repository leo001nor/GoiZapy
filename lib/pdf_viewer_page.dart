import 'package:flutter/material.dart';
import 'dart:html' as html;

class PdfViewerPage extends StatelessWidget {
  const PdfViewerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Relatório de Estágio - GoiZapy'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            html.window.open('assets/relatorio.pdf', '_blank');
          },
          child: const Text('Abrir PDF'),
        ),
      ),
    );
  }
}
