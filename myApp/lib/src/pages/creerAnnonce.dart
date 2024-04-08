import 'package:flutter/material.dart';
import 'package:all_o/modele/exportModele.dart';
import 'dart:math';

import '../settings/settings_view.dart';
import '../pages/home.dart';
import 'package:all_o/modele/sharedPreferences/settingModel.dart';
import 'package:provider/provider.dart';
import 'package:all_o/main.dart';
import '../pages/mesPret.dart';
import 'package:all_o/src/sample_feature/sample_item_list_view.dart';


class CreerAnnonceView extends StatelessWidget {
  CreerAnnonceView({
    Key? key,
    required this.prefs,
  }) : super(key: key);

  final SettingViewModel prefs;
  int _selectedIndex = 1;

  static const routeName = '/CreerAnnonce';

  final TextEditingController titreController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController dateDebutController = TextEditingController();
  final TextEditingController dateFinController = TextEditingController();
  final TextEditingController objetNom = TextEditingController();
  final TextEditingController objetEtat = TextEditingController();
  final TextEditingController objetCategorie = TextEditingController();


  void _onItemTapped(BuildContext context, int index) {
      if(index == 0){
          Navigator.restorablePushNamed(context, SampleItemListView.routeName);
      }
      else if(index == 1){
        Navigator.restorablePushNamed(context, CreerAnnonceView.routeName);
      }
      else if(index == 2){
          Navigator.restorablePushNamed(context, PretView.routeName);
      }

    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crée une annonces"),
      ),
      bottomNavigationBar: BottomNavigationBar(
                          selectedItemColor: Colors.green,
                          unselectedItemColor: Colors.grey,
                          currentIndex: _selectedIndex,
                          onTap: (index) {
                            _onItemTapped(context, index);
                          },
                          items: const <BottomNavigationBarItem>[
                            BottomNavigationBarItem(
                              icon: Icon(Icons.article),
                              label: 'Annonces',
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.article),
                              label: 'Crée une annonce',
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.article),
                              label: 'Mes prêts',
                            ),
                            BottomNavigationBarItem(
                              icon: Icon(Icons.article),
                              label: 'Réservations',
                            ),
                          ],
                        ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFormField(
                controller: titreController,
                decoration: InputDecoration(labelText: 'Titre'),
              ),
              TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: dateDebutController,
                decoration: InputDecoration(labelText: 'Date Début'),
              ),
              TextFormField(
                controller: dateFinController,
                decoration: InputDecoration(labelText: 'Date Fin'),
              ),
              Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: objetNom,
                          decoration: InputDecoration(labelText: 'Nom objet'),
                        ),
                      ),
                      SizedBox(width: 10), // Ajoute un espace horizontal entre les TextFormField
                      Expanded(
                        child: TextFormField(
                          controller: objetEtat,
                          decoration: InputDecoration(labelText: 'numéro état'),
                        ),
                      ),
                      SizedBox(width: 10), // Ajoute un espace horizontal entre les TextFormField
                      Expanded(
                        child: TextFormField(
                          controller: objetCategorie,
                          decoration: InputDecoration(labelText: 'numéro catégorie'),
                        ),
                      ),

                    ],
                  ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  String titre = titreController.text;
                  String description = descriptionController.text;
                  String dateDebut = dateDebutController.text;
                  String dateFin = dateFinController.text;
                  String nomUser = prefs.pseudos;
                  Objet obj = Objet(id: Random().nextInt(10000000) + 10,nomObjet: objetNom.text, idEtat: int.parse(objetEtat.text), idCategorie : int.parse(objetCategorie.text), nomUser: prefs.pseudos);
                  elemAddBd.addObjet(obj);
                  elemAddBd.addAnnonce(Annonce(id:Random().nextInt(10000000) + 10, titre: titre, description: description, dateDebut: dateDebut, dateFin: dateFin,nomUser: prefs.pseudos,idObjet: obj.id ));
                },
                child: Text('Créer l\'annonce'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}