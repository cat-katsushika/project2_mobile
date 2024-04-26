import 'package:flutter/material.dart';
import 'package:project2_mobile/models/team.dart';

Future<TeamDetail> fetchTeamDetail(String id) async {
  final Map<String, dynamic> jsonData = {
    "team": {
      "id": "c1c61f36-6032-4d39-a649-6ad16ee4f00c",
      "name": "統計の勉強を10分",
      "description": "統計の勉強を10分取り組んだらOKです"
    },
    "task": {
      "id": "b22157a3-5951-48c4-b6fa-721b17d55d45",
      "user": "test_user2",
      "created_at": "2023-09-13T21:43:49+09:00"
    },
    "continuation_count": 12,
    "users": [
      {"id": "b22157a3-5951-48c4-b6fa-721b17d55d45", "username": "testuser1"}
    ]
  };
  TeamDetail aaa = TeamDetail.fromJson(jsonData);
  return aaa;
}

