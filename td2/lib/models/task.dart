class Task {
  int id;
  String title;
  List<String> tags;
  int nbhours;
  int difficulty;
  String description;

  Task({required this.id,required this.title,required this.tags,required this.nbhours,required this.difficulty,required this.description});

  factory Task.fromJson(Map<String, dynamic> json) {
    final tags = <String>[];

    if (json['tags'] != null){
      json['tags'].forEach((t){
        tags.add(t);
      });
    }

    return Task(
        id: json['id'],
        title: json['title'],
        tags: tags,
        nbhours: json['nbhours'],
        difficulty: json['difficulty'],
        description: json['description']);

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    final tags = <String>[];
    this.tags.forEach((element) {tags.add(element);});

    data['id'] = this.id;
    data['title'] = this.title;
    data['tags'] = tags;
    data['nbhours'] = this.nbhours;
    data['difficulty'] = this.difficulty;
    data['description'] = this.description;
    return data;
  }

  static List<Task> generateTask(int i){
    List<Task> tasks=[];
    for(int n=0;n<i;n++){
      tasks.add(Task(id: n, title: "title $n", tags: ['tag $n','tag ${n+1}'], nbhours: n, difficulty: n, description: '$n'));
    }
    return tasks;
  }
}
