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
import '../pages/mesPret.dart';
import '../pages/detailAnnonce.dart';
import 'package:all_o/src/pages/creerAnnonce.dart';
import 'package:all_o/src/pages/mesReservation.dart';



/// Displays a list of SampleItems.
class SampleItemListView extends StatelessWidget {
  SampleItemListView({
    Key? key,
    required this.prefs,
  }) : super(key: key);

  final SettingViewModel prefs;
  int _selectedIndex = 0;
  static const routeName = '/Annonces';


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
    else if(index == 3){
              Navigator.restorablePushNamed(context, ReservationView.routeName);
          }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bienvenue ${prefs.pseudos}"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
                    icon: const Icon(Icons.person),
                    tooltip: 'Objets',
                    onPressed: () {
                      Navigator.restorablePushNamed(context, ProfileView.routeName);
                    },
                  ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () {
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'logout',
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
                  title: Text(' ${item.titre}'),
                  leading: const CircleAvatar(
                    foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                  ),
                  onTap: () {
                    prefs.annonce = item.id;
                    Navigator.restorablePushNamed(
                      context,
                      DetailAnnonceView.routeName,
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
    );
  }
}