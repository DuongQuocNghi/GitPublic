import 'dart:convert';

import 'package:bizwork_lite/Service/Dto/APIResponse.dart';

import 'AuthorizationRemoteSource.dart';
import 'Dto/LoginRequestDto.dart';
import 'Dto/LoginResponseDto.dart';

class AuthorizationService {
  Future<APIResponse> login(LoginResquestDto input) async {
    var jsonData = await AuthorizationRemoteSource().login(input);

    var mapData = json.decode(jsonData);
//    var test = LoginResponseDto.fromJson(mapTest);
//    print(test);

    return APIResponse.fromJson(mapData);
  }
}
