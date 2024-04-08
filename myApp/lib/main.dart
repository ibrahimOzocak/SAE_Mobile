import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'src/app.dart';
import 'src/settings/settings_controller.dart';
import 'src/settings/settings_service.dart';

import 'package:all_o/modele/exportModele.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'src/sample_feature/sample_item_details_view.dart';
import 'src/sample_feature/sample_item_list_view.dart';
import 'src/settings/settings_view.dart';
import 'src/pages/home.dart';
import 'src/pages/profile.dart';
import 'package:all_o/modele/sharedPreferences/settingModel.dart';
void main() async {

  elemGetBd();
  elemAddBd();
  elemDeleteBd();
  SettingViewModel prefs = SettingViewModel();

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

  List<Avis> avis = await elemGetBd.getAvis();
  for(Avis avi in avis){
    print(avi);
  }

  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.
  runApp(MyApp(settingsController: settingsController,prefs: prefs));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
    required this.prefs,
  });

  final SettingsController settingsController;
  final SettingViewModel prefs;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
            onGenerateRoute: (RouteSettings routeSettings) {
              return MaterialPageRoute<void>(
                settings: routeSettings,
                builder: (BuildContext context) {
                  switch (routeSettings.name) {
                    case SettingsView.routeName:
                      return SettingsView(controller: settingsController);
                    case SampleItemDetailsView.routeName:
                      return const SampleItemDetailsView();
                    case SampleItemListView.routeName:
                      return SampleItemListView(prefs: prefs);
                    case ProfileView.routeName:
                      return ProfileView(prefs: prefs);
                    default:
                      return Home(prefs: prefs);
                  }
                },
              );
            },
        );
      },
    );
  }
}