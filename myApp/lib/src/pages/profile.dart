import 'package:flutter/material.dart';
import 'package:all_o/modele/exportModele.dart';

import '../settings/settings_view.dart';
import '../pages/home.dart';
import 'package:all_o/modele/sharedPreferences/settingModel.dart';
import 'package:provider/provider.dart';
import 'package:all_o/main.dart';

/// Displays a list of SampleItems.
class ProfileView extends StatelessWidget {
  ProfileView({
    Key? key,
    required this.prefs,
  }) : super(key: key);

  final SettingViewModel prefs;

  static const routeName = '/Profile';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile de ${prefs.pseudos}"),
      ),
      body: FutureBuilder<List<Objet>>(
        future: elemGetBd.getObjetsFromUser(prefs.pseudos),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            List<Objet> items = snapshot.data ?? [];
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return ListTile(
                  title: Text('${item.nomObjet}'),
                  leading: const CircleAvatar(
                    foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                  ),
                  onTap: () {

                  },
                );
              },
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.grey,
              currentIndex: 0,

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
                  label: 'Réservations',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.article),
                  label: 'Mes prêts',
                ),
              ],
            ),
    );
  }
}