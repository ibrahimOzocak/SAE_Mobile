import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

import 'package:all_o/modele/exportModele.dart';

void main() async {

  elemGetBd();
  elemAddBd();
  elemDeleteBd();
  elemUpdateBd();

/*
  List<Objet> objets = await elemGetBd.getObjets();
  for(Objet objet in objets){
    print(objet.nomObjet);
  }

  List<Annonce> annonces = await elemGetBd.getAnnoncesSansReservation();
  for(Annonce annonce in annonces){
    print(annonce.titre);
  }
  
  List<Utilisateur> utilisateurs = await elemGetBd.getUsers();
  for(Utilisateur utilisateur in utilisateurs){
    print(utilisateur.nomUser);
  }
  

  
  List<Reservation> reservations = await elemGetBd.getReservation();
  for(Reservation reservation in reservations){
    print(reservation.idAnnonce);
  }

  List<Etat> etats = await elemGetBd.getEtats();
  for(Etat etat in etats){
    print(etat.nomEtat);
  }

  List<Categorie> categories = await elemGetBd.getCategories();
  for(Categorie categorie in categories){
    print(categorie.nomCategorie);
  }
  */
  /*
  List<Avis> avis = await elemGetBd.getAvis();
  for(Avis avi in avis){
    print(avi.dateMessage);
  }
  */


  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController));
}
