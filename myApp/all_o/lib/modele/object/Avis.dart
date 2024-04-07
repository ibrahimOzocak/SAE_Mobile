class Avis{
  int id;
  String message;
  String nomUser;
  DateTime dateMessage;
  int idAnnonce;

  Avis({
    required this.id,
    required this.message,
    required this.nomUser,
    required this.dateMessage,
    required this.idAnnonce, 
    });

  @override
  String toString() {
    return 'Avis{id: $id, message: $message, nomUser: $nomUser, dateMessage: $dateMessage, idAnnonce: $idAnnonce}';
  }
}