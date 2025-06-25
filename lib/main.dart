import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const GoizapyApp());
}

class GoizapyApp extends StatelessWidget {
  const GoizapyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Goizapy',
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF24A6C2)),
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedSection = 'Empresa';

  Widget navItem(String title, bool isLeft) {
    return TextButton(
      onPressed: () {
        setState(() {
          selectedSection = title;
        });
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (title == 'Sobre Mim' || title == 'Sobre a E-goi') ...[
            Image.asset(
              title == 'Sobre Mim'
                  ? 'assets/Sobre Mim.png'
                  : 'assets/Empresa.png',
              height: title == 'Sobre a E-goi' ? 40 : 30, // empresa maior
            ),
            const SizedBox(width: 8),
          ],
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: selectedSection == title
                  ? const Color(0xFF24A6C2)
                  : Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  Widget contentBox(String title, String content) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Text(
            content,
            style: GoogleFonts.poppins(fontSize: 16, height: 1.6),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget section;
    switch (selectedSection) {
      case 'Sobre a E-goi':
        section = Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(24),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Sobre a E-goi',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Icone e parágrafo 1 - Empresa
                const Icon(Icons.business, color: Colors.black87, size: 30),
                const SizedBox(height: 8),
                const Text(
                  'A E-goi é uma empresa portuguesa de tecnologia que atua na área do marketing digital multicanal.\n '
                  'A sua plataforma SaaS permite a criação e gestão de campanhas através de canais como email,\n SMS, '
                  'push notifications, chamadas de voz e muito mais,\n ajudando empresas a automatizar e personalizar '
                  'a comunicação com os seus clientes.\n\n',
                  style: TextStyle(fontSize: 16, height: 1.6),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Icone e parágrafo 2 - Estágio
                const Icon(Icons.school, color: Colors.black87, size: 30),
                const SizedBox(height: 8),
                const Text(
                  'Durante o meu estágio curricular, integrei a equipa MMA (Marketing Multicanal Automatizado),\n responsável '
                  'pelo desenvolvimento de soluções que ligam diferentes canais e sistemas,\n com foco na automação, integração '
                  'e inovação contínua.\n\n',
                  style: TextStyle(fontSize: 16, height: 1.6),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Icone e parágrafo 3 - Colaboração
                const Icon(Icons.group, color: Colors.black87, size: 30),
                const SizedBox(height: 8),
                const Text(
                  'A E-goi destaca-se pela sua cultura de colaboração, espírito de equipa\n e aposta na evolução tecnológica '
                  'como base do seu crescimento.',
                  style: TextStyle(fontSize: 16, height: 1.6),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
        break;
      case 'Sobre Mim':
        section = Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(24),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Sobre Mim',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Ícone + Apresentação
                const Icon(Icons.person, color: Colors.black87, size: 30),
                const SizedBox(height: 8),
                const Text(
                  'Apresentação:',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Sou finalista da Licenciatura em Engenharia Informática no ISPGAYA,\n com interesse nas áreas de desenvolvimento web, '
                  'aplicações móveis,\n integração de sistemas e inteligência artificial.\n\n',
                  style: TextStyle(fontSize: 16, height: 1.6),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Ícone + Experiência
                const Icon(Icons.work, color: Colors.black87, size: 30),
                const SizedBox(height: 8),
                const Text(
                  'Experiência:',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Tenho experiência académica e prática em projetos orientados para soluções funcionais,\n com foco em inovação tecnológica '
                  'e automatização de processos.\n\n',
                  style: TextStyle(fontSize: 16, height: 1.6),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Ícone + Formação
                const Icon(Icons.school, color: Colors.black87, size: 30),
                const SizedBox(height: 8),
                const Text(
                  'Formação:',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Licenciatura em Engenharia Informática – ISPGAYA\nConclusão prevista: 2025\n\n',
                  style: TextStyle(fontSize: 16, height: 1.6),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // Ícone + Competências Técnicas
                const Icon(Icons.memory, color: Colors.black87, size: 30),
                const SizedBox(height: 8),
                const Text(
                  'Competências Técnicas:',
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  '• Linguagens: TypeScript, JavaScript, Python, Java, C++\n'
                  '• Frameworks & Tools: SvelteKit, Flutter, Vite, Firebase\n'
                  '• Tecnologias: APIs REST, Chrome Extensions, Git, CI/CD\n'
                  '• Bases de dados: Firebase, MySQL, MongoDB\n'
                  '• Áreas de interesse: Inteligência Artificial, Aplicações Móveis,\n Power BI, Computação Gráfica, Programação Orientada a Objetos',
                  style: TextStyle(fontSize: 16, height: 1.6),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
        break;
      case 'Projeto':
        section = Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(24),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Projeto: GoiZapy',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                // ÍCONE + OBJETIVO
                Icon(Icons.flag, color: Colors.black87, size: 30),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      height: 1.6,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Objetivo:\n',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text:
                            'Desenvolver uma extensão para o Chrome que permite integrar o WhatsApp Web com a plataforma E-goi,\n facilitando a captura e gestão de contactos diretamente a partir das conversas.\n\n',
                      ),
                    ],
                  ),
                ),

                // ÍCONE + TECNOLOGIAS
                Icon(Icons.code, color: Colors.black87, size: 30),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      height: 1.6,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Tecnologias:\n',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text:
                            'SvelteKit · TypeScript · Vite · API da E-goi · Manifest V3\n\n',
                      ),
                    ],
                  ),
                ),

                // ÍCONE + FUNCIONALIDADES
                Icon(Icons.list_alt, color: Colors.black87, size: 30),
                const SizedBox(height: 8),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.black,
                      height: 1.6,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Funcionalidades principais:\n',
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      TextSpan(
                        text:
                            '• Detecção de alterações no DOM do WhatsApp Web\n'
                            '• Captura de nome e número do contacto em tempo real\n'
                            '• Envio automático de dados para a API E-goi\n'
                            '• Associação de tags e criação de contactos na conta do utilizador',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
        break;
      case 'Download':
        section = Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Download',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    color: Colors.black,
                    height: 1.6,
                  ),
                  children: const [
                    TextSpan(
                      text:
                          'Este relatório foi elaborado no âmbito do estágio curricular da Licenciatura em Engenharia Informática,\n '
                          'realizado na empresa E-goi. O documento apresenta o enquadramento institucional,\n os objetivos do estágio, '
                          'o trabalho desenvolvido, e uma reflexão final sobre as aprendizagens adquiridas.\n\n',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),
              // Idioma
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.language, color: Colors.black87),
                  SizedBox(width: 8),
                  Text(
                    'Idioma: Português',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Formato
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.picture_as_pdf, color: Colors.black87),
                  SizedBox(width: 8),
                  Text(
                    'Formato: PDF · 95 páginas',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Tamanho
              Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.storage, color: Colors.black87),
                  SizedBox(width: 8),
                  Text(
                    'Tamanho: ~4.1 MB',
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                  ),
                ],
              ),
              const SizedBox(height: 35),
              // BOTÃO DE DOWNLOAD
              ElevatedButton.icon(
                onPressed: () {
                  // Abre o link no navegador
                  launchUrl(
                    Uri.parse(
                        'https://github.com/leo001nor/GoiZapy/raw/main/GoiZapy_LeonorMachado_Final.pdf'),
                    mode: LaunchMode.externalApplication,
                  );
                },
                icon: const Icon(Icons.download, color: Colors.white),
                label: const Text(
                  'Download PDF',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF24A6C2),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        );
        break;
      default:
        section = Container(
          padding: const EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(24),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Desenvolvimento de Plugin de Integração entre E-goi e WhatsApp',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              Image.asset(
                'assets/GoiZapy.png',
                height: 200,
                fit: BoxFit.contain,
              ),
              const SizedBox(height: 24),
              const Text(
                '\nAcede ao relatório em PDF:',
                style: TextStyle(fontWeight: FontWeight.w600),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              // BOTÃO DE DOWNLOAD
              ElevatedButton.icon(
                onPressed: () {
                  // Abre o link no navegador
                  launchUrl(
                    Uri.parse(
                        'https://github.com/leo001nor/GoiZapy/raw/main/GoiZapy_LeonorMachado_Final.pdf'),
                    mode: LaunchMode.externalApplication,
                  );
                },
                icon: const Icon(Icons.download, color: Colors.white),
                label: const Text(
                  'Download PDF',
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF24A6C2),
                  foregroundColor: Colors.white,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ],
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 280),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedSection = 'Goizapy'; // nome usado no default
                  });
                },
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    children: const [
                      TextSpan(
                        text: 'Goi',
                        style: TextStyle(color: Color(0xFF24A6C2)),
                      ),
                      TextSpan(
                        text: 'Zapy',
                        style: TextStyle(color: Color(0xFF29b63e)),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 24),
              navItem('Projeto', true),
              navItem('Download', true),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 280),
            child: Row(
              children: [
                navItem('Sobre a E-goi', false),
                navItem('Sobre Mim', false),
              ],
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: SizedBox(
                  width: 1100,
                  height: 900,
                  child: section,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '© 2025 Leonor Machado · ispg2022103369@ispgaya.pt',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
