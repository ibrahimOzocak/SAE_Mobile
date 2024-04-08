import '../exportModele.dart';

class elemDeleteBd{

  static final SupabaseClient client = initBaseDonne.initialize();

  static Future<void> deleteObjet(int idObjet) async {
    try{
      final objetDansAnnonce = await elemGetBd.getAnnonceFromObjet(idObjet);
      if (objetDansAnnonce.isNotEmpty) {
      // Si l'objet est utilisé dans une annonce, supprimer d'abord l'annonce
      await deleteAnnonce(objetDansAnnonce[0].id);
      }
      final response = await client
          .from('OBJET')
          .delete()
          .eq('Id_objet', idObjet);

      if (response != null && response.error != null) {
        throw Exception('Erreur lors de la suppression de l\'objet : ${response.error.message}');
      }
    }catch(e){
      throw Exception('Erreur lors de la suppression de l\'objet : $e');
    }
  }

  static Future<void> deleteAnnonce(int idAnnonce) async {
    try{
      final annonceReserver = await elemGetBd.getReservationWithAnnonce(idAnnonce);
      if (annonceReserver.isNotEmpty) {
        await deleteReservation(annonceReserver[0].id);
      }
      final avisAnnonce = await elemGetBd.getAvisWithAnnonce(idAnnonce);
      if (avisAnnonce.isNotEmpty) {
        await deleteAvis(avisAnnonce[0].id);
      }
      final response = await client
          .from('ANNONCE')
          .delete()
          .eq('Id_Annonce', idAnnonce);

      if (response != null && response.error != null) {
        throw Exception('Erreur lors de la suppression de l\'annonce : ${response.error.message}');
      }
    }catch(e){
      throw Exception('Erreur lors de la suppression de l\'annonce : $e');
    }
  }

  static Future<void> deleteReservation(int idReservation) async {
    try{
      final response = await client
          .from('RESERVATION')
          .delete()
          .eq('Id_Reservation', idReservation);

      if (response != null && response.error != null) {
        throw Exception('Erreur lors de la suppression de la réservation : ${response.error.message}');
      }
    }catch(e){
      throw Exception('Erreur lors de la suppression de la réservation : $e');
    }
  }

  static Future<void> deleteAvis(int idAvis) async {
    try{
      final response = await client
          .from('AVIS')
          .delete()
          .eq('Id_Avis', idAvis);

      if (response != null && response.error != null) {
        throw Exception('Erreur lors de la suppression de l\'avis : ${response.error.message}');
      }
    }catch(e){
      throw Exception('Erreur lors de la suppression de l\'avis : $e');
    }
  }

  static Future<void> deleteUtilisateur(String nomUser) async {
    try{
      final userReserver = await elemGetBd.getReservationOfUser(nomUser);
      if (userReserver.isNotEmpty) {
        for (Reservation reservation in userReserver) {
          await deleteReservation(reservation.id);
        }
      }
      final userAvis = await elemGetBd.getAvisOfUser(nomUser);
      if (userAvis.isNotEmpty) {
        for (Avis avis in userAvis) {
          await deleteAvis(avis.id);
        }
      }
      final userAnnonce = await elemGetBd.getAnnonceOfUser(nomUser);
      if (userAnnonce.isNotEmpty) {
        for (Annonce annonce in userAnnonce) {
          await deleteAnnonce(annonce.id);
        }
      }
      final userObjet = await elemGetBd.getObjetsFromUser(nomUser);
      if (userObjet.isNotEmpty) {
        for (Objet objet in userObjet) {
          await deleteObjet(objet.id);
        }
      }
      final response = await client
          .from('USER')
          .delete()
          .eq('NomUser', nomUser);

      if (response != null && response.error != null) {
        throw Exception('Erreur lors de la suppression de l\'utilisateur : ${response.error.message}');
      }
    }catch(e){
      throw Exception('Erreur lors de la suppression de l\'utilisateur : $e');
    }
  }

}