import 'dart:convert';
import 'dart:html';
import 'package:supabase_flutter/supabase_flutter.dart';

import './classe/Annonce.dart';
import './classe/Objet.dart';
import './classe/User.dart';
import './classe/Etat.dart';
import './classe/Categorie.dart';
import './classe/Reservation.dart';
import './classe/Avis.dart';

class Bd{
  Bd(){
    Supabase.initialize(
      url:'https://abhsxqmlsjhtjsdmvwrv.supabase.co',
      anonKey:'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFiaHN4cW1sc2podGpzZG12d3J2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTIwNzQ3NDEsImV4cCI6MjAyNzY1MDc0MX0.Jp5cK5-k8FVrhEf8jvgQt2nnxDDBHYODtBedYMQt45s'
    );
  }

  static Future<List<Objet>> getObjets() async {
    try{  
      final response = await Supabase.instance.client
          .from('OBJET')
          .select();

      final List<dynamic> data = response;
      print(data);

      // Récupération des objets depuis les données et création des instances de la classe Objet
      final List<Objet> objets = data.map((objetData) {
        return Objet(
          id: objetData['Id_objet'] as int,
          nomObjet: objetData['NomObjet'] as String,
          idEtat: objetData['Id_Etat'] as int,
          idCategorie: objetData['Id_Categorie'] as int,
          nomUser: objetData['NomUser'] as String,
        );
      }).toList();

      return objets;
    }catch(e){
      throw Exception('Erreur lors de la récupération des objets : $e');
    }
  }


}