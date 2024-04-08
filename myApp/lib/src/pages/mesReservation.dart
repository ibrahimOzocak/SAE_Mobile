import 'package:flutter/material.dart';
import 'package:all_o/modele/exportModele.dart';
import '../settings/settings_view.dart';
import '../pages/home.dart';
import 'package:all_o/modele/sharedPreferences/settingModel.dart';
import 'package:provider/provider.dart';
import 'package:all_o/main.dart';
import 'package:all_o/src/sample_feature/sample_item_list_view.dart';
import 'package:all_o/src/pages/detailAnnonce.dart';
import 'package:all_o/src/pages/detailAnnonceEnlever.dart';
import 'package:all_o/src/pages/creerAnnonce.dart';
import 'package:all_o/src/pages/mesPret.dart';

class ReservationView extends StatelessWidget {
  ReservationView({
    Key? key,
    required this.prefs,
  }) : super(key: key);
  int _selectedIndex = 3;

  final SettingViewModel prefs;

  static const routeName = '/Reservation';

  Future<List<Annonce>> getAnnonceWithReservation(List<Reservation> ids) async {
    List<Annonce> liste = [];

    for (Reservation id in ids) {
      Annonce annonce = await elemGetBd.getAnnonceById(id.idAnnonce);
      liste.add(annonce);
    }
    return liste;
  }

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
            title: Text("Mes Reservation"),
            automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Annonce>>(
        future: elemGetBd.getAnnonceOfUser(prefs.pseudos),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            List<Annonce> annonces = snapshot.data ?? [];
            return ListView.builder(
                itemCount: annonces.length,
                itemBuilder: (BuildContext context, int index) {
                  final annonce = annonces[index];
                  return ListTile(
                    title: Text('${annonce.titre}'),
                    leading: const CircleAvatar(
                      foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                    ),
                    onTap: () {
                    prefs.annonce = annonce.id;
                      Navigator.restorablePushNamed(
                        context,
                        DetailAnnonceEnleverView.routeName,
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