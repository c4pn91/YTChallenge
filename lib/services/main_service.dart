import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ytchallenge/models/avatar_channel_response.dart';
import 'package:ytchallenge/models/response_model.dart';
import 'package:http/http.dart' as http;

class MainService with ChangeNotifier {

  MainService._instantiate();
  static final MainService instance = MainService._instantiate();

  List<Item> videos = [];

  final String _baseUrl = 'www.googleapis.com';
  final String _key = 'AIzaSyDfc_xVsO3IYPQfP6K6144WeRhKNBREFxo';
  final String _part = 'snippet, contentDetails, statistics';
  final String _maxResults = '20';
  final String _chart = 'mostPopular';
  String _nextPageToken = '';

  MainService(){
    this.fetchMainVideos();
  }

  fetchMainVideos() async {

    Map<String, String> parameters = {
      'part': _part,
      'key': _key,
      'maxResults': _maxResults,
      'chart': _chart,
      'pageToken': this._nextPageToken
    };

    Uri uri = Uri.https(_baseUrl, '/youtube/v3/videos', parameters);

    Map<String, String> headers = {
      HttpHeaders.contentTypeHeader: 'application/json',
    };

    // Get Videos
    var response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = json.decode(response.body);
      YoutubeResponse ytRespponse = YoutubeResponse.fromJson(data);

      this._nextPageToken = ytRespponse.nextPageToken;

      this.videos += ytRespponse.items;

      await getAvatarChannel(ytRespponse.items);

      return new Future.delayed(const Duration(seconds: 2), () => notifyListeners());
    } else {
      throw json.decode(response.body)['error']['message'];
    }
  }

  getAvatarChannel(List<Item> videos) async {
    videos.forEach((element) async {
      var response2 = await http.get("https://www.googleapis.com/youtube/v3/channels?part=snippet&fields=items%2Fsnippet%2Fthumbnails%2Fdefault%2Furl&id=${element.snippet.channelId}&key=${_key}");
      if (response2.statusCode == 200) {
        Map<String, dynamic> data2 = json.decode(response2.body);
        AvatarChannelResponse avatarResp = AvatarChannelResponse.fromJson(
            data2);
        element.snippet.avatarChannel =
            avatarResp.items[0].snippet.thumbnails.thumbnailsDefault.url;
      }
    });
  }
}