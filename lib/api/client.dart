import "dart:async";
import "dart:io";

import "package:http/http.dart" as http;
import "package:html/parser.dart";
import "package:collection/collection.dart";

import "package:estudent/models/subject.dart";

class Client {
  final Uri url;
  final String username;
  final String password;
  final http.Client client;

  String? _session;

  Client({required this.url, required this.username, required this.password})
      : client = http.Client();

  void _updateSession(http.Response resp) {
    var cookie = resp.headersSplitValues["set-cookie"]
        ?.map((cookie) => Cookie.fromSetCookieValue(cookie))
        .firstWhereOrNull((cookie) => cookie.name == "JSESSIONID");

    _session = cookie == null ? _session : "${cookie.name}=${cookie.value};";
  }

  Future<http.Response> post({
    Map<String, String> body = const {},
    pathSegments = const [],
  }) async {
    var uri = url.replace(pathSegments: pathSegments);
    var req = http.Request("post", uri)
      ..bodyFields = body
      ..followRedirects = false
      ..headers["cookie"] = _session ?? "";
    var resp = await http.Response.fromStream(await client.send(req));
    _updateSession(resp);

    while (resp.statusCode == 302) {
      var location = resp.headers[HttpHeaders.locationHeader];

      if (location != null) {
        uri = uri.resolve(location);
        var req = http.Request("get", uri)
          ..followRedirects = false
          ..headers["cookie"] = _session ?? "";
        resp = await http.Response.fromStream(await client.send(req));
        _updateSession(resp);
      }
    }

    return resp;
  }

  Future<void> login() async {
    var resp = await post(
      pathSegments: ["j_spring_security_check"],
      body: {
        "j_username": username,
        "j_password": password,
      },
    );

    if (resp.request != null &&
        (resp.request?.url.toString() ?? "").contains("loginError.jsf")) {
      return Future.error(Exception("Login failed."));
    }
  }

  Future<List<List<Subject>>> getSchedule({login = true}) async {
    List<List<Subject>> res = [];

    if (login) await this.login();

    var resp = await post(
      pathSegments: ["pocetna.jsf"],
      body: {
        "menu": "menu",
        "javax.faces.ViewState": "j_id1",
        "menu:_idcl": "menu_nav1_item14",
      },
    );

    var doc = parse(resp.body);
    var table = doc.getElementsByClassName("rasporedCasovaTable").firstOrNull;
    var week = table?.getElementsByClassName("rasporedCasovaPanel") ?? [];
    for (var weekday in week) {
      List<Subject> currentRes = [];
      var subjects = weekday.getElementsByClassName("rasporedSingleDiv");
      for (var subject in subjects) {
        var subjectElem = subject
            .getElementsByClassName("akronimPredmeta")
            .firstOrNull
            ?.children
            .firstOrNull;

        var groupElem = subject
            .getElementsByClassName("tipNastaveNG")
            .firstOrNull
            ?.children
            .firstOrNull;

        var lecturerElems = subject
            .getElementsByClassName("tipNastaveNG")
            .firstOrNull
            ?.nextElementSibling
            ?.getElementsByTagName("span");

        var timeElem = subject.getElementsByClassName("vreme").firstOrNull;

        var placeElem = subject
            .getElementsByClassName("sala")
            .firstOrNull
            ?.children
            .firstOrNull;

        currentRes.add(
          Subject(
            name: subjectElem?.attributes["title"],
            lecturers: lecturerElems?.map((elem) => elem.text).toList(),
            code: subjectElem?.text,
            group: groupElem?.text,
            time: timeElem?.text,
            place: placeElem?.attributes["title"],
          ),
        );
      }

      res.add(currentRes);
    }

    return res;
  }
}
