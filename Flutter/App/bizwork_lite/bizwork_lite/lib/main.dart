import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'Widget/PasswordField.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: MaterialApp(home: LoginPage()),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class UserLoginData {
  String userName = '';
  String password = '';
}

class _LoginPageState extends State<LoginPage> {
  UserLoginData userLogin = UserLoginData();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            const SizedBox(height: 300.0),
            TextFormField(
              textCapitalization: TextCapitalization.words,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                filled: false,
                labelText: 'Tên đăng nhập',
              ),
              onSaved: (String value) {
                userLogin.userName = value;
              },
            ),
            const SizedBox(height: 12.0),
            PasswordField(
              fieldKey: GlobalKey<FormFieldState<String>>(),
              labelText: 'Mật khẩu',
              onFieldSubmitted: (String value) {
                setState(() {
                  userLogin.password = value;
                });
              },
            ),
            const SizedBox(height: 30.0),
            Center(
              child: RaisedButton(
                onPressed: () {
                  var apiCallBack = LoginAPI();

                  apiCallBack.then((value) {
                    print(value);
                  },
                      onError: (e) {
                        print(e);
                      });
                },
                clipBehavior: Clip.antiAlias,
                padding: const EdgeInsets.all(0),
                shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                ),
                child: Container(
                  width: 200.0,
                  height: 50.0,
                  decoration: new BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0xFF3EBFEA),
                        Color(0xFF047DC1),
                      ],
                    ),
                  ),
                  child: new Center(
                    child: new Text(
                      'Đăng nhập',
                      style: new TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<LoginResquestDto> LoginAPI() async {
    var url = 'http://125.212.252.106:1003/BizServiceWS.svc/api/login';
    var header = {'Content-Type': 'application/json'};
    var body = {'UserName': 'BIZ00017', 'Password': '1234567'};

    var response = await http.post(url, headers: header, body: body);
    print('Resquest header: ${response.headers}');
    print('Resquest body: ${response.body}');
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    return compute(parseLoginResquestDto, response.body);
  }

  // A function that converts a response body into a List<Photo>.
  LoginResquestDto parseLoginResquestDto(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();

    return parsed
        .map<LoginResquestDto>((json) => LoginResquestDto.fromJson(json))
        .toList();
  }
}

class LoginResquestDto {
  String loginSessionKey;
  String avatar;
  int employeeID;
  String employeeCode;
  String employeeType;
  String fullName;
  String lastName;
  String jobType;
  String lastActiveDate;
  String languageCode;
  int roleInTaskBelow;
  int sessionType;
  String deepLinkChatCS;

  LoginResquestDto(
      {this.loginSessionKey,
        this.avatar,
        this.employeeID,
        this.employeeCode,
        this.employeeType,
        this.fullName,
        this.lastName,
        this.jobType,
        this.lastActiveDate,
        this.languageCode,
        this.roleInTaskBelow,
        this.sessionType,
        this.deepLinkChatCS});

  factory LoginResquestDto.fromJson(Map<String, dynamic> json) {
    return LoginResquestDto(
        loginSessionKey: json['LoginSessionKey'] as String,
        avatar: json['Avatar'] as String,
        employeeID: json['EmployeeID'] as int,
        employeeCode: json['EmployeeCode'] as String,
        employeeType: json['EmployeeType'] as String,
        fullName: json['FullName'] as String,
        lastName: json['LastName'] as String,
        jobType: json['JobType'] as String,
        lastActiveDate: json['LastActiveDate'] as String,
        languageCode: json['LanguageCode'] as String,
        roleInTaskBelow: json['RoleInTaskBelow'] as int,
        sessionType: json['SessionType'] as int,
        deepLinkChatCS: json['DeepLinkChatCS'] as String);
  }
}
