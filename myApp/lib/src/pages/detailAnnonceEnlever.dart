import 'package:flutter/material.dart';
import 'package:all_o/modele/exportModele.dart';

import '../settings/settings_view.dart';
import '../pages/home.dart';
import 'package:all_o/modele/sharedPreferences/settingModel.dart';
import 'package:provider/provider.dart';
import 'package:all_o/main.dart';

/// Displays a list of SampleItems.
class DetailAnnonceEnleverView extends StatelessWidget {
  DetailAnnonceEnleverView({
    Key? key,
    required this.prefs,
  }) : super(key: key);

  final SettingViewModel prefs;

  static const routeName = '/DetailAnnonceEnlever';

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
                   FutureBuilder<Objet>(
                       future: elemGetBd.getObjetById(items.idObjet ?? 0),
                       builder: (context, snapshot) {
                         if (snapshot.connectionState == ConnectionState.waiting) {
                           return SizedBox(); // Retourne un widget vide en attendant les données
                         } else if (snapshot.hasError) {
                           return SizedBox(); // Retourne un widget vide en cas d'erreur
                         } else {
                           Objet objet = snapshot.data!;
                           return Text(
                             "Objet: ${objet.nomObjet}",
                             style: TextStyle(fontSize: 24),
                           );
                         }
                       },
                     ),
                 SizedBox(height: 20), // Espace supplémentaire
                 ElevatedButton(
                   onPressed: () {
                     elemDeleteBd.deleteReservation(prefs.idAnnonces);
                     elemDeleteBd.deleteAnnonce(prefs.idAnnonces);
                   },
                   child: Text('Mettre fin'),
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

