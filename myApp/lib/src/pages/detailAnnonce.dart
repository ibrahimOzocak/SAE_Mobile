import 'package:flutter/material.dart';
import 'package:all_o/modele/exportModele.dart';

import '../settings/settings_view.dart';
import '../pages/home.dart';
import 'package:all_o/modele/sharedPreferences/settingModel.dart';
import 'package:provider/provider.dart';
import 'package:all_o/main.dart';

/// Displays a list of SampleItems.
class DetailAnnonceView extends StatelessWidget {
  DetailAnnonceView({
    Key? key,
    required this.prefs,
  }) : super(key: key);

  final SettingViewModel prefs;

  static const routeName = '/DetailAnnonce';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Détail annonce"),
      ),
      body: FutureBuilder<Annonce>(
        future: elemGetBd.getAnnonceById(prefs.idAnnonces),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            Annonce? items = snapshot.data as Annonce;
           return Center( // Centrer la colonne sur la page
             child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Text(
                         "Titre : " + items.titre,
                         style: TextStyle(fontSize: 24), // Doubler la taille de la police
                       ),
                       Text(
                         "Description : " + items.description,
                         style: TextStyle(fontSize: 24), // Doubler la taille de la police
                       ),
                       Text(
                         "Date Début: " + items.dateDebut,
                         style: TextStyle(fontSize: 24), // Doubler la taille de la police
                       ),
                       Text(
                         "Date Fin: " + items.dateFin,
                         style: TextStyle(fontSize: 24), // Doubler la taille de la police
                       ),
                       Text(
                         "Demandée par: " + items.nomUser,
                         style: TextStyle(fontSize: 24), // Doubler la taille de la police
                       ),
                 SizedBox(height: 20), // Espace supplémentaire
                 ElevatedButton(
                   onPressed: () {
                     // Action à effectuer lors du clic sur le bouton
                   },
                   child: Text('Mon Bouton'),
                 ),
               ],
             ),
           );
          }
        },
      ),
    );
  }
}