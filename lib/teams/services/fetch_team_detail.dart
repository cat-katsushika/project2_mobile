import 'package:project2_mobile/teams/models/team_detail.dart';

Future<TeamDetail> fetchTeamDetail(String id) async {

  // Djangoを使わないとき用
  if (id == "001") {
    final Map<String, dynamic> jsonData = {
      "team": {
        "id": "c1c61f36-6032-4d39-a649-6ad16ee4f00c",
        "name": "統計の勉強を10分",
        "description": "統計の勉強を10分取り組んだらOKです"
      },
      "task": {
        "id": "b22157a3-5951-48c4-b6fa-721b17d55d45",
        "user": "testuser2",
        "created_at": "2024-05-13T21:43:49+09:00"
      },
      "continuation_count": 12,
      "users": [
        {"id": "b22157a3-5951-48c4-b6fa-721b17d55d45", "username": "testuser1"},
        {"id": "b22157a3-5951-48c4-b6fa-721b17d55d45", "username": "testuser2"}
      ]
    };
    TeamDetail aaa = TeamDetail.fromJson(jsonData);
    return aaa;
  }
  else {
    final Map<String, dynamic> jsonData = {
    "team": {
      "id": "c1c61f36-6032-4d39-a649-6ad16ee4f00c",
      "name": "英語の勉強を10分",
      "description": "統計の勉強を10分取り組んだらOKです"
    },
    "task": {
      "id": "b22157a3-5951-48c4-b6fa-721b17d55d45",
      "user": "cccc",
      "created_at": "2024-05-13T21:43:49+09:00"
    },
    "continuation_count": 44,
    "users": [
      {"id": "b22157a3-5951-48c4-b6fa-721b17d55d45", "username": "cccc"},
      {"id": "b22157a3-5951-48c4-b6fa-721b17d55d45", "username": "dddd"}
    ]
  };
  TeamDetail aaa = TeamDetail.fromJson(jsonData);
  return aaa;
  }
  // Djangoを使わない時用

  
}

