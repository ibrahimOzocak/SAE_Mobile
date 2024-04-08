import '../exportModele.dart';

class elemGetBd {

  static final SupabaseClient client = initBaseDonne.initialize();

  static Future<List<Objet>> getObjets() async {
    try{  
      final response = await client
          .from('OBJET')
          .select();

      final List<dynamic> data = response;

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

  static Future<Objet> getObjetById(int id) async {
    try {
      final response = await client
        .from('OBJET')
        .select()
        .eq('Id_objet', id)
        .single(); // Utilisation de la méthode single() pour récupérer un seul enregistrement

      final objetData = response; // L'enregistrement unique est directement récupéré

      // Création de l'instance de la classe Objet à partir des données récupérées
      final Objet objet = Objet(
        id: objetData['Id_objet'] as int,
        nomObjet: objetData['NomObjet'] as String,
        idEtat: objetData['Id_Etat'] as int,
        idCategorie: objetData['Id_Categorie'] as int,
        nomUser: objetData['NomUser'] as String,
      );

      return objet; // Renvoi de l'objet Objet
    } catch (e) {
      throw Exception('Erreur lors de la récupération de l\'objet : $e');
    }
  }

    static Future<List<Objet>> getObjetsFromUser(nomUser) async {
    try{  
      final response = await client
          .from('OBJET')
          .select()
          .match({'NomUser': nomUser});

      final List<dynamic> data = response;

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

  static Future<List<Reservation>> getReservation() async{
    try{
      final response = await client
          .from('RESERVATION')
          .select();

      final List<dynamic> data = response;

      // Récupération des réservations depuis les données et création des instances de la classe Reservation
      final List<Reservation> reservations = data.map((reservationData) {
        return Reservation(
          id: reservationData['Id_Reservation'] as int,
          nomUser: reservationData['NomUser'] as String,
          idAnnonce: reservationData['Id_Annonce'] as int,
        );
      }).toList();

      return reservations;
    }catch(e){
      throw Exception('Erreur lors de la récupération des réservations : $e');
    }
  }

    static Future<List<Reservation>> getReservationOfUser(nomUser) async{
    try{
      final response = await client
          .from('RESERVATION')
          .select()
          .eq('NomUser', nomUser);

      final List<dynamic> data = response;

      // Récupération des réservations depuis les données et création des instances de la classe Reservation
      final List<Reservation> reservations = data.map((reservationData) {
        return Reservation(
          id: reservationData['Id_Reservation'] as int,
          nomUser: reservationData['NomUser'] as String,
          idAnnonce: reservationData['Id_Annonce'] as int,
        );
      }).toList();

      return reservations;
    }catch(e){
      throw Exception('Erreur lors de la récupération des réservations : $e');
    }
  }

    static Future<List<Reservation>> getReservationWithAnnonce(id) async{
    try{
      final response = await client
          .from('RESERVATION')
          .select()
          .eq('Id_Annonce', id);

      final List<dynamic> data = response;

      // Récupération des réservations depuis les données et création des instances de la classe Reservation
      final List<Reservation> reservations = data.map((reservationData) {
        return Reservation(
          id: reservationData['Id_Reservation'] as int,
          nomUser: reservationData['NomUser'] as String,
          idAnnonce: reservationData['Id_Annonce'] as int,
        );
      }).toList();

      return reservations;
    }catch(e){
      throw Exception('Erreur lors de la récupération des réservations : $e');
    }
  }

  static Future<List<Annonce>> getAnnonces() async {
    try{  
      final response = await client
          .from('ANNONCE')
          .select();

      final List<dynamic> data = response;

      // Récupération des annonces depuis les données et création des instances de la classe Annonce
      final List<Annonce> annonces = data.map((annonceData) {
        return Annonce(
          id: annonceData['Id_Annonce'] as int,
          titre: annonceData['Titre'] as String,
          description: annonceData['Description'] as String,
          dateDebut: annonceData['DateDebut'] as String,
          dateFin: annonceData['DateFin'] as String,
          nomUser: annonceData['NomUser'] as String,
          idObjet: annonceData['Id_Objet'] as int,
        );
      }).toList();

      return annonces;
    }catch(e){
      throw Exception('Erreur lors de la récupération des annonces : $e');
    }
  }

  static Future<List<Annonce>> getAnnonceOfUser(nomUser) async {
    try{  
      final response = await client
          .from('ANNONCE')
          .select()
          .eq('NomUser', nomUser);

      final List<dynamic> data = response;

      // Récupération des annonces depuis les données et création des instances de la classe Annonce
      final List<Annonce> annonces = data.map((annonceData) {
        return Annonce(
          id: annonceData['Id_Annonce'] as int,
          titre: annonceData['Titre'] as String,
          description: annonceData['Description'] as String,
          dateDebut: annonceData['DateDebut'] as String,
          dateFin: annonceData['DateFin'] as String,
          nomUser: annonceData['NomUser'] as String,
          idObjet: annonceData['Id_Objet'] as int,
        );
      }).toList();

      return annonces;
    }catch(e){
      throw Exception('Erreur lors de la récupération des annonces : $e');
    }
  }

  static Future<List<Annonce>> getAnnonceFromObjet(id) async {
    try{  
      final response = await client
          .from('ANNONCE')
          .select()
          .eq('Id_Objet', id);

      final List<dynamic> data = response;

      // Récupération des annonces depuis les données et création des instances de la classe Annonce
      final List<Annonce> annonces = data.map((annonceData) {
        return Annonce(
          id: annonceData['Id_Annonce'] as int,
          titre: annonceData['Titre'] as String,
          description: annonceData['Description'] as String,
          dateDebut: annonceData['DateDebut'] as String,
          dateFin: annonceData['DateFin'] as String,
          nomUser: annonceData['NomUser'] as String,
          idObjet: annonceData['Id_Objet'] as int,
        );
      }).toList();

      return annonces;
    }catch(e){
      throw Exception('Erreur lors de la récupération des annonces : $e');
    }
  }
  static Future<Annonce> getAnnonceById(id) async {
    try {
      final response = await client
          .from('ANNONCE')
          .select()
          .eq('Id_Annonce', id)
          .single(); // Utilisation de la méthode single() pour récupérer un seul enregistrement

      final annonceData = response; // L'enregistrement unique est directement récupéré

      // Création de l'instance de la classe Annonce à partir des données récupérées
      final Annonce annonce = Annonce(
        id: annonceData['Id_Annonce'] as int,
        titre: annonceData['Titre'] as String,
        description: annonceData['Description'] as String,
        dateDebut: annonceData['DateDebut'] as String,
        dateFin: annonceData['DateFin'] as String,
        nomUser: annonceData['NomUser'] as String,
        idObjet: annonceData['Id_Objet'] as int,
      );

      return annonce; // Renvoi de l'objet Annonce
    } catch (e) {
      throw Exception('Erreur lors de la récupération de l\'annonce : $e');
    }
  }


  static Future<List<Annonce>> getAnnoncesSansReservation() async {
  try {
    // Récupérer toutes les annonces
    final responseAnnonces = await client
        .from('ANNONCE')
        .select();

    final List<dynamic> annoncesData = responseAnnonces;

    // Récupérer les annonces qui ont des réservations
    final responseAnnoncesAvecReservation = await client
        .from('RESERVATION')
        .select('Id_Annonce');

    final List<dynamic> annoncesAvecReservationData = responseAnnoncesAvecReservation;

    // Filtrer les annonces qui n'ont pas de réservation
    final List<Annonce> annoncesSansReservation = annoncesData
        .where((annonceData) =>
            !annoncesAvecReservationData.any((reservationData) => reservationData['Id_Annonce'] == annonceData['Id_Annonce']))
        .map((annonceData) {
      return Annonce(
        id: annonceData['Id_Annonce'] as int,
        titre: annonceData['Titre'] as String,
        description: annonceData['Description'] as String,
        dateDebut: annonceData['DateDebut'] as String,
        dateFin: annonceData['DateFin'] as String,
        nomUser: annonceData['NomUser'] as String,
        idObjet: annonceData['Id_Objet'] as int,
      );
    }).toList();

    return annoncesSansReservation;
  } catch (e) {
    throw Exception('Erreur lors de la récupération des annonces sans réservation : $e');
  }
}

  static Future<List<Utilisateur>> getUsers() async {
    try{  
      final response = await client
          .from('USER')
          .select();

      final List<dynamic> data = response;

      // Récupération des utilisateurs depuis les données et création des instances de la classe User
      final List<Utilisateur> users = data.map((userData) {
        return Utilisateur(
          nomUser: userData['NomUser'] as String,
        );
      }).toList();

      return users;
    }catch(e){
      throw Exception('Erreur lors de la récupération des utilisateurs : $e');
    }
  }

  static Future<List<Etat>> getEtats() async {
    try{  
      final response = await client
          .from('ETAT')
          .select();

      final List<dynamic> data = response;

      // Récupération des états depuis les données et création des instances de la classe Etat
      final List<Etat> etats = data.map((etatData) {
        return Etat(
          id: etatData['Id_Etat'] as int,
          nomEtat: etatData['NomEtat'] as String,
        );
      }).toList();

      return etats;
    }catch(e){
      throw Exception('Erreur lors de la récupération des états : $e');
    }
  }

  static Future<List<Categorie>> getCategories() async {
    try{  
      final response = await client
          .from('CATEGORIE')
          .select();

      final List<dynamic> data = response;

      // Récupération des catégories depuis les données et création des instances de la classe Categorie
      final List<Categorie> categories = data.map((categorieData) {
        return Categorie(
          id: categorieData['Id_Categorie'] as int,
          nomCategorie: categorieData['NomCategorie'] as String,
        );
      }).toList();

      return categories;
    }catch(e){
      throw Exception('Erreur lors de la récupération des catégories : $e');
    }
  }

  static Future<List<Avis>> getAvis() async {
    try{  
      final response = await client
          .from('AVIS')
          .select();

      final List<dynamic> data = response;

      // Récupération des avis depuis les données et création des instances de la classe Avis
      final List<Avis> avis = data.map((avisData) {
        return Avis(
          id: avisData['Id_Avis'] as int,
          message: avisData['Message'] as String,
          nomUser: avisData['NomUser'] as String,
          dateMessage: (avisData['DateMessage'] != null) ? DateTime.parse(avisData['DateMessage'] as String) : DateTime.now(),
          idAnnonce: avisData['Id_Annonce'] as int,
        );
      }).toList();

      return avis;
    }catch(e){
      throw Exception('Erreur lors de la récupération des avis : $e');
    }
  }

  static Future<List<Avis>> getAvisWithAnnonce(idAnnonce) async {
    try{  
      final response = await client
          .from('AVIS')
          .select()
          .eq('Id_Annonce', idAnnonce);

      final List<dynamic> data = response;

      // Récupération des avis depuis les données et création des instances de la classe Avis
      final List<Avis> avis = data.map((avisData) {
        return Avis(
          id: avisData['Id_Avis'] as int,
          message: avisData['Message'] as String,
          nomUser: avisData['NomUser'] as String,
          dateMessage: (avisData['DateMessage'] != null) ? DateTime.parse(avisData['DateMessage'] as String) : DateTime.now(),
          idAnnonce: avisData['Id_Annonce'] as int,
        );
      }).toList();

      return avis;
    }catch(e){
      throw Exception('Erreur lors de la récupération des avis : $e');
    }
  }

static Future<List<Avis>> getAvisOfUser(nomUser) async {
    try{  
      final response = await client
          .from('AVIS')
          .select()
          .eq('NomUser', nomUser);

      final List<dynamic> data = response;

      // Récupération des avis depuis les données et création des instances de la classe Avis
      final List<Avis> avis = data.map((avisData) {
        return Avis(
          id: avisData['Id_Avis'] as int,
          message: avisData['Message'] as String,
          nomUser: avisData['NomUser'] as String,
          dateMessage: (avisData['DateMessage'] != null) ? DateTime.parse(avisData['DateMessage'] as String) : DateTime.now(),
          idAnnonce: avisData['Id_Annonce'] as int,
        );
      }).toList();

      return avis;
    }catch(e){
      throw Exception('Erreur lors de la récupération des avis : $e');
    }
  }

}