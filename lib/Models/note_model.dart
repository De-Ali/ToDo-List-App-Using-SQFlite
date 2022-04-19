class Note {
  int? id;
  String? title;
  DateTime? date;
  String? priority;
  int? status;

  //Default Construtor
  Note({this.title, this.date, this.priority, this.status});
  //named Constructor
Note.withid({this.id,this.title, this.date, this.priority, this.status});

Map<String, dynamic> toMap(){
  final map = Map<String , dynamic>();

  if(id!= null){
    map ['id'] = id;
  }

  map ['title'] = title ;
  map['date'] = date!.toIso8601String();
  map['priority'] = priority;
  map['status'] = status;
  return map;
}
factory Note.fromMap(Map<String,dynamic >map){
  return Note.withid(
    id: map['id'],
    title: map['title'],
    priority: map['priority'],
    status: map['status'],
    date: DateTime.parse(map['date']),

  );
}

}