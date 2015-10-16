import 'dart:convert';

/*server side Post class */
class Post {
  int post_id;
  String title;
  String description;
  DateTime posted_at;
  DateTime last_edited;
  String user;
  String editor;
  int up_votes;
  int down_votes;
  int total_votes;
  String links_to;
  List<String> tags = new List();

  Post();

  Post.fromSQL(List sql_post) {
    //initialization code, unrelated.
  }

  Map toJson() => {
    'post_id': post_id,
    'title': title,
    'description': description,
    'posted_at': posted_at,
    'last_edited': last_edited,
    'user': user,
    'editor': editor,
    'up_votes': up_votes,
    'dwon_votes': down_votes,
    'total_votes': total_votes,
    'links_to': links_to,
    'tags': tags
  };

//    return fromObject;
  //I use the code below as a temporary solution
  //JSON.encode(fromObject, toEncodable: (date)=>date.toString());
//  }
}

void main() {
  var data = [
    new Post()
      ..post_id = 1
      ..title = 'title'
      ..description = 'description'
      ..posted_at = new DateTime.now(),
    new Post()
      ..post_id = 2
      ..title = 'title'
      ..description = 'description'
      ..posted_at = new DateTime.now(),
  ];
  print(JSON.encode(data, toEncodable: (value) {
    if (value is DateTime) {
      return value.toIso8601String();
    } else {
      return value.toJson();
    }
  }));
}

//class JsonDateTime {
//  final DateTime value;
//  JsonDateTime(this.value);
//
//  String toJson() => value != null ? value.toIso8601String() : null;
//}
