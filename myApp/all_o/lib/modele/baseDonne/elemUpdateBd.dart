import '../exportModele.dart';

class elemUpdateBd{

  static final SupabaseClient client = initBaseDonne.initialize();

  static Future<void> updateNomObjet(id, newNom) async{
    try{
      if (newNom == null || newNom.isEmpty) {
        throw Exception('Erreur lors de la mise à jour du nom de l\'objet : Le nom de l\'objet est requis');
      }
      final response = await client
          .from('OBJET')
          .update({'NomObjet': newNom})
          .eq('Id_objet', id);
      if (response != null && response.error != null) {
        throw Exception('Erreur lors de la mise à jour du nom de l\'objet : ${response.error.message}');
      }
    }catch(e){
      throw Exception('Erreur lors de la mise à jour du nom de l\'objet : $e');
    }
  }
  
  static Future<void> updateEtatObjet(id, idEtat) async{
    try{
      final response = await client
          .from('OBJET')
          .update({'Id_Etat': idEtat})
          .eq('Id_objet', id);
      if (response != null && response.error != null) {
        throw Exception('Erreur lors de la mise à jour du nom de l\'Etat de l objet : ${response.error.message}');
      }
    }catch(e){
      throw Exception('Erreur lors de la mise à jour du nom de l\'objet : $e');
    }
  }

  static Future<void> updateCategorieObjet(id, idCategorie) async{
    try{
      final response = await client
          .from('OBJET')
          .update({'Id_Categorie': idCategorie})
          .eq('Id_objet', id);
      if (response != null && response.error != null) {
        throw Exception('Erreur lors de la mise à jour de la catégorie de l objet : ${response.error.message}');
      }
    }catch(e){
      throw Exception('Erreur lors de la mise à jour de la catégorie de l objet : $e');
    }
  }

  static Future<void> updateMessageAvis(id, newMessage) async{
    try{
      if (newMessage == null || newMessage.isEmpty) {
        throw Exception('Erreur lors de la mise à jour du message de l\'avis : Le message de l\'avis est requis');
      }
      final response = await client
          .from('AVIS')
          .update({'Message': newMessage})
          .eq('Id_Avis', id);
      if (response != null && response.error != null) {
        throw Exception('Erreur lors de la mise à jour du message de l\'avis : ${response.error.message}');
      }
    }catch(e){
      throw Exception('Erreur lors de la mise à jour du message de l\'avis : $e');
    }
  }

  static Future<void> updateTitreAnnonce(id, newTitre) async{
    try{
      if (newTitre == null || newTitre.isEmpty) {
        throw Exception('Erreur lors de la mise à jour du titre de l\'annonce : Le titre de l\'annonce est requis');
      }
      final response = await client
          .from('ANNONCE')
          .update({'Titre': newTitre})
          .eq('Id_Annonce', id);
      if (response != null && response.error != null) {
        throw Exception('Erreur lors de la mise à jour du titre de l\'annonce : ${response.error.message}');
      }
    }catch(e){
      throw Exception('Erreur lors de la mise à jour du titre de l\'annonce : $e');
    }
  }

  static Future<void> updateDescriptionAnnonce(id, newDescription) async{
    try{
      if (newDescription == null || newDescription.isEmpty) {
        throw Exception('Erreur lors de la mise à jour de la description de l\'annonce : La description de l\'annonce est requise');
      }
      final response = await client
          .from('ANNONCE')
          .update({'Description': newDescription})
          .eq('Id_Annonce', id);
      if (response != null && response.error != null) {
        throw Exception('Erreur lors de la mise à jour de la description de l\'annonce : ${response.error.message}');
      }
    }catch(e){
      throw Exception('Erreur lors de la mise à jour de la description de l\'annonce : $e');
    }
  }

}