// ignore_for_file: lines_longer_than_80_chars

import 'package:flutter/material.dart';

class TreatmentsScreen extends StatefulWidget {
  const TreatmentsScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _TreatmentsScreenState createState() => _TreatmentsScreenState();
}

class _TreatmentsScreenState extends State<TreatmentsScreen> {
  List<String> treatments = [
    'CHEMICAL DRUGS:',
    'Nicarbazin',
    'Amprolium',
    'Ionophores (eg, Monensin and Lasalocid )',
    'Sulphonamides (such as sulfadimidine, sulfaquinoxaline, sulphanitran, sulfadimethoxine, and sulpha guanidine)',
    'Quinolines and Clopidol (eg, buquinolate, decoquinate,  methylbenzoquate, and nequinate )',
    'COXID',
    'Diclazuril and toltrazuril',
    'Halofuginone hydrobromide',
    'Robenidine',
    'Nitrobenzamides',
    'Roxarsone',

    'HERBAL DRUGS:',
    'Condensed Tannins and Pine Bark',
    'Garlic (Allium sativum) and Ginger',
    'Green Tea (Camellia sinensis)',
    'PawPaw (Carica papaya and Papain)',
    'Grape Seed Extract',
    'Mushroom (Fomitella fraxinea)',
    'Cinnamon (cinnamaldehyde)',
    'Turmeric and eugenol from cloves',
    'Oregano',
    'Thyme',
    'Bitterleaf',
    'Essential Oils from Plants like Tea Tree, Oregano, Clove etc.',
    'Commercial Oils like Carvacrol, Carvone, Isopulegol etc.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Treatments'),
        ),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: treatments.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(treatments[index]),
                  );
                },
              ),
            ),
          ],
        ));
  }
}
