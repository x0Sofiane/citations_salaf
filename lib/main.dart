import 'package:flutter/material.dart';

void main() {
  runApp(const CitationsApp());
}

class CitationsApp extends StatelessWidget {
  const CitationsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Citations Salaf',
      theme: ThemeData(primarySwatch: Colors.teal, fontFamily: 'Roboto'),
      home: const CitationScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CitationScreen extends StatefulWidget {
  const CitationScreen({super.key});

  @override
  State<CitationScreen> createState() => _CitationScreenState();
}

class _CitationScreenState extends State<CitationScreen> {
  final List<Map<String, String>> citations = [
    {
      'texte': 'ما ترك أحد شيئًا لله عز وجل إلا عوّضه الله خيرًا منه',
      'traduction':
          'Quiconque délaisse une chose pour Allāh, Allāh la lui remplace par quelque chose de meilleur.',
      'auteur': 'Ibn al-Qayyim رحمه الله',
    },
    {
      'texte': 'البدعة أحب إلى الشيطان من المعصية',
      'traduction': 'L’innovation est plus aimée par Shayṭān que le péché.',
      'auteur': 'Sufyān ath-Thawrī رحمه الله',
    },
    {
      'texte': 'اتبع ولا تبتدع فقد كُفيت',
      'traduction': 'Suis (la Sunna) et n’innove pas, car cela te suffit.',
      'auteur': 'al-Fuḍayl ibn ʿIyāḍ رحمه الله',
    },
  ];

  int index = 0;

  void nouvelleCitation() {
    setState(() {
      index = (index + 1) % citations.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    final citation = citations[index];
    return Scaffold(
      appBar: AppBar(title: const Text('Citations Salaf'), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              color: Colors.teal.shade50,
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Text(
                      citation['texte']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Scheherazade',
                        height: 2,
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    const SizedBox(height: 12),
                    Text(
                      citation['traduction']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '- ${citation['auteur']} -',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: nouvelleCitation,
              icon: const Icon(Icons.refresh),
              label: const Text('Nouvelle citation'),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
