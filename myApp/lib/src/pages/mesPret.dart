import 'package:flutter/material.dart';
import 'package:all_o/modele/exportModele.dart';
import '../settings/settings_view.dart';
import '../pages/home.dart';
import 'package:all_o/modele/sharedPreferences/settingModel.dart';
import 'package:provider/provider.dart';
import 'package:all_o/main.dart';
import 'package:all_o/src/sample_feature/sample_item_list_view.dart';
import 'package:all_o/src/pages/detailAnnonce.dart';
import 'package:all_o/src/pages/detailAnnonceRien.dart';
import 'package:all_o/src/pages/creerAnnonce.dart';
import 'package:all_o/src/pages/mesReservation.dart';

class PretView extends StatelessWidget {
  PretView({
    Key? key,
    required this.prefs,
  }) : super(key: key);
  int _selectedIndex = 2;

  final SettingViewModel prefs;

  static const routeName = '/Pret';

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
            title: Text("Mes Prêts"),
            automaticallyImplyLeading: false,
      ),
      body: FutureBuilder<List<Reservation>>(
        future: elemGetBd.getReservationOfUser(prefs.pseudos),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Erreur: ${snapshot.error}'));
          } else {
            List<Reservation> reservations = snapshot.data ?? [];
            return FutureBuilder<List<Annonce>>(
              future: getAnnonceWithReservation(reservations),
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
                        title: Text('${item.titre}'),
                        leading: const CircleAvatar(
                          foregroundImage: AssetImage('assets/images/flutter_logo.png'),
                        ),
                        onTap: () {
                        prefs.annonce = item.id;
                          Navigator.restorablePushNamed(
                                                context,
                                                DetailAnnonceRienView.routeName,
                                              );
                        },
                      );
                    },
                  );
                }
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