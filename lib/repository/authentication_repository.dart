import 'dart:async';
import 'dart:convert';

import 'package:rallymobile/model/user_model.dart';
import 'package:rallymobile/configs/constants.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

enum AuthenticationStatus { unknown, authenticated, unauthenticated }

class AuthenticationRepository {
  final _controller = StreamController<AuthenticationStatus>();
  final storage = const FlutterSecureStorage();

  Stream<AuthenticationStatus> get status async* {
    yield AuthenticationStatus.authenticated;
    yield* _controller.stream;
  }

  void dispose() => _controller.close();

  Future<User> logIn({
    required String username,
    required String password,
  }) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));
      final user = User(
        id: '1',
        email: 'test@gmail.com',
        password: '12345678',
        userName: 'mxmhx',
        imageUrl:
            'https://www.pngmart.com/files/21/Admin-Profile-Vector-PNG-Clipart.png',
        token: '123',
      );

      await _saveUserData(user);
      _controller.add(AuthenticationStatus.authenticated);
      return user;

      // const apiPath = '/api/v3/auth/application/login';
      // final response = await http.post(
      //   Uri.parse(urlEndpoint + apiPath),
      //   headers: <String, String>{
      //     'Content-Type': 'application/json',
      //     'type': 'rider_app',
      //   },
      //   body: jsonEncode({
      //     "baseSignature": baseSignature,
      //     "phone": phone,
      //     "notiToken": notiToken,
      //     "key": await DeviceInfoUtil.getId(),
      //   }),
      // );
      // // if status code 200 = success, 400 = fail
      // final body = jsonDecode(response.body);
      // if (response.statusCode == 200) {
      //   final user = User(
      //     id: body['user']['id'],
      //     userName: body['user']['userName'],
      //     imageUrl: body['user']['imageUrl'],
      //     baseName: body['base']['baseName'],
      //     baseSignature: baseSignature,
      //     baseId: body['base']['baseId'],
      //     phone: phone,
      //     baseLineId: body['base']['lineId'],
      //     token: body['token'],
      //   );

      //   print('api token: ${body['token']}');

      //   await _saveUserData(user);
      //   _controller.add(AuthenticationStatus.authenticated);
      //   return user;
      // } else {
      //   throw body['message'];
      // }
    } catch (_) {
      rethrow;
    }
  }

  Future<User?> tryAutoLogIn() async {
    try {
      return _readUserData();
    } catch (e) {
      return null;
    }
  }

  Future<void> logOut({required String token}) async {
    try {
      await _clearUserData();
      _controller.add(AuthenticationStatus.unauthenticated);

      const apiPath = '/api/v3/auth/application/logout';
      final response = await http.post(
        Uri.parse(urlEndpoint + apiPath),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'type': 'rider_app',
          'authorization': 'Bearer $token'
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> _saveUserData(User user) async {
    await storage.write(key: 'user', value: jsonEncode(user.toJson()));
  }

  Future<User?> _readUserData() async {
    final jsonString = await storage.read(key: 'user');
    if (jsonString != null) {
      return User.fromJson(jsonDecode(jsonString));
    }
    return null;
  }

  Future<void> _clearUserData() async {
    await storage.delete(key: 'user');
  }
}
