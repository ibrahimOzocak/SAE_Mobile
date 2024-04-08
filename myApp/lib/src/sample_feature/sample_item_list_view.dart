import 'package:flutter/material.dart';
import 'package:all_o/modele/exportModele.dart';

import '../settings/settings_view.dart';
import 'sample_item.dart';
import 'sample_item_details_view.dart';
import '../pages/home.dart';
import 'package:all_o/modele/sharedPreferences/settingModel.dart';
import 'package:provider/provider.dart';
import 'package:all_o/main.dart';
import '../pages/profile.dart';

/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  SampleItemListView({
    Key? key,
    required this.prefs,
  }) : super(key: key);

  final SettingViewModel prefs;

  static const routeName = '/Annonces';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenue ${prefs.pseudos}"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
                    icon: const Icon(Icons.person),
                    onPressed: () {
                      Navigator.restorablePushNamed(context, ProfileView.routeName);
                    },
                  ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.restorablePushNamed(context, Home.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder<List<Annonce>>(
        future: elemGetBd.getAnnoncesSansReservation(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            List<Annonce> items = snapshot.data ?? [];
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                final item = items[index];
                return ListTile(
                  title: Text('Annonce ${item.titre}'),
                  leading: const CircleAvatar(
                    foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                  ),
                  onTap: () {
                    Navigator.restorablePushNamed(
                      context,
                      SampleItemDetailsView.routeName,
                    );
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