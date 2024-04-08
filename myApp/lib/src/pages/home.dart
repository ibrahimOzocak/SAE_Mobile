import 'package:flutter/material.dart';
import 'package:all_o/modele/exportModele.dart';
import '../sample_feature/sample_item_list_view.dart';
import 'package:all_o/modele/sharedPreferences/settingModel.dart';
import 'package:provider/provider.dart';
import 'package:all_o/main.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
    required this.prefs,
  }) : super(key: key);

  static const routeName = '/';

  final SettingViewModel prefs;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  final TextEditingController _pseudoController = TextEditingController();

  void _showDialogLogIn(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Entrez votre pseudo'),
            content: TextField(
              controller: _pseudoController,
              decoration: const InputDecoration(hintText: 'Pseudo'),
            ),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  widget.prefs.pseudo = _pseudoController.text;
                  Navigator.of(context).pop();
                },
                child: const Text('Annuler'),
              ),
              TextButton(
                onPressed: () {
                  widget.prefs.pseudo = _pseudoController.text;
                  _checkPseudo(context, _pseudoController.text);
                },
                child: const Text('Valider'),
              ),
            ],
          );
        },
      );
    }
    void _showDialogCreateAccount(BuildContext context) async{
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Entrez votre pseudo'),
                content: TextField(
                  controller: _pseudoController,
                  decoration: const InputDecoration(hintText: 'Pseudo'),
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      widget.prefs.pseudo = _pseudoController.text;
                      Navigator.of(context).pop();
                    },
                    child: const Text('Annuler'),
                  ),
                  TextButton(
                    onPressed:  () async{
                        var pse = _pseudoController.text;
                        if(!(await _checkPseudoAvaible(context, pse))){
                            elemAddBd();
                            await elemAddBd.addUtilisateur(Utilisateur(nomUser : pse ));
                        }
                    },
                    child: const Text('Valider'),
                  ),
                ],
              );
            },
          );
        }
   void _checkPseudo(BuildContext context, String pseudo) async{
        List<Utilisateur> utilisateurs = await elemGetBd.getUsers();
       if (utilisateurs.any((objet) => objet.nomUser == pseudo)) {
         // Action à effectuer lorsque le pseudo est correct
         Navigator.of(context).pop(); // Ferme la boîte de dialogue
         Navigator.restorablePushNamed(
             context,
             SampleItemListView.routeName,
           );
       } else {
         // Action à effectuer lorsque le pseudo est incorrect
         ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
             content: Text('Pseudo incorrect'),
             duration: Duration(seconds: 2),
           ),
         );
       }
     }
  Future<bool> _checkPseudoAvaible(BuildContext context, String pseudo) async{
    List<Utilisateur> utilisateurs = await elemGetBd.getUsers();
    return utilisateurs.any((objet) => objet.nomUser == pseudo);
  }



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                _showDialogLogIn(context);
              },
              child: Text('Se connecter'),
            ),
            TextButton(
              onPressed: () {
                _showDialogCreateAccount(context);
              },
              child: Text('S\'inscrire'),
            ),

          ],
        ),
      ),

    );
  }
}