import '../exportModele.dart';

class elemAddBd{

  static final SupabaseClient client = initBaseDonne.initialize();

  static Future<void> addObjet(Objet objet) async {
    try{
      final response = await client
          .from('OBJET')
          .insert([
            {
              'Id_objet': objet.id,
              'NomObjet': objet.nomObjet,
              'Id_Etat': objet.idEtat,
              'Id_Categorie': objet.idCategorie,
              'NomUser': objet.nomUser,
            }
          ]);
        if (response != null && response.error != null) {
          throw Exception('Erreur lors de l\'ajout de l\'objet : ${response.error.message}');
        }
    }catch(e){
      throw Exception('Erreur lors de l\'ajout de l\'objet : $e');
    }
  }

  static Future<void> addAnnonce(Annonce annonce) async {
    try{
          // Vérifier si une annonce existe déjà avec cet objet
    final objets = await elemGetBd.getAnnonceFromObjet(annonce.idObjet);
    if (objets.isNotEmpty) {
      throw Exception('Une annonce avec cet objet existe déjà.');
    }
      DateTime dateDebut = DateTime.parse(annonce.dateDebut);
      DateTime dateFin = DateTime.parse(annonce.dateFin);
      DateTime dateActuelle = DateTime.now();
      if(dateDebut.isBefore(dateFin) && dateDebut.isAtSameMomentAs(dateActuelle) || dateDebut.isAfter(dateActuelle)){
        final response = await client
            .from('ANNONCE')
            .insert([
              {
                'Id_Annonce': annonce.id,
                'Titre': annonce.titre,
                'Description': annonce.description,
                'DateDebut': annonce.dateDebut,
                'DateFin': annonce.dateFin,
                'NomUser': annonce.nomUser,
                'Id_Objet': annonce.idObjet,
              }
            ]);
          if (response != null && response.error != null) {
            throw Exception('Erreur lors de l\'ajout de l\'annonce : ${response.error.message}');
          }
      }
      else{
        throw Exception('Erreur lors de l\'ajout de l\'annonce : La date de fin doit être supérieure à la date de début');
      }
    }catch(e){
      throw Exception('Erreur lors de l\'ajout de l\'annonce : $e');
    }
  }

  static Future<void> addUtilisateur(Utilisateur utilisateur) async {
    try {
      final allUsers = await elemGetBd.getUsers();
      // Vérifie si le nom d'utilisateur est déjà pris
      if (allUsers.any((user) => user.nomUser == utilisateur.nomUser)) {
        throw Exception('Erreur lors de l\'ajout de l\'utilisateur : Le nom d\'utilisateur est déjà pris');
      }

      // Vérifie si le nom d'utilisateur est vide
      if (utilisateur.nomUser.isEmpty) {
        throw Exception('Erreur lors de l\'ajout de l\'utilisateur : Le nom de l\'utilisateur est requis');
      }
      final response = await client
          .from('USER')
          .insert([
            {
              'NomUser': utilisateur.nomUser,
              // Ajoutez d'autres champs requis pour l'insertion ici si nécessaire
            }
          ]);

      // Vérifiez si l'opération d'insertion a réussi
      if (response != null && response.error != null) {
        throw Exception('Erreur lors de l\'ajout de l\'utilisateur : ${response.error.message}');
      }
    } catch (e) {
      throw Exception('Erreur lors de l\'ajout de l\'utilisateur : $e');
    }
  }

  static Future<void> addReservation(Reservation reservation) async {
    try{
      final response = await client
          .from('RESERVATION')
          .insert([
            {
              'Id_Reservation': reservation.id,
              'NomUser': reservation.nomUser,
              'Id_Annonce': reservation.idAnnonce,
            }
          ]);
      if (response != null && response.error != null) {
        throw Exception('Erreur lors de l\'ajout de la reservation : ${response.error.message}');
      }
    }catch(e){
      throw Exception('Erreur lors de l\'ajout de la réservation : $e');
    }
  }

  static Future<void> addAvis(Avis avis) async {
    try {
      final response = await client.from('AVIS').insert([
        {
          'Id_Avis': avis.id,
          'Message': avis.message,
          'NomUser': avis.nomUser,
          'DateMessage': avis.dateMessage.toIso8601String(),
          'Id_Annonce': avis.idAnnonce,
        }
      ]);
      if (response != null && response.error != null) {
        throw Exception('Erreur lors de l\'ajout de l\'avis : ${response.error.message}');
      }
    } catch (e) {
      throw Exception('Erreur lors de l\'ajout de l\'avis : $e');
    }
  }



}