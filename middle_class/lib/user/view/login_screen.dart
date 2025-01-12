import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:middle_class/common/component/custom_text_form_field.dart';
import 'package:middle_class/common/const/colors.dart';
import 'package:middle_class/common/const/data.dart';
import 'package:middle_class/common/dio/dio.dart';
import 'package:middle_class/common/layout/default_layout.dart';
import 'package:middle_class/common/secure_storage/secure_storage.dart';
import 'package:middle_class/common/view/root_tab.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    final dio = ref.watch(dioProvider);
    final storage = ref.watch(secureStorage);
    return DefaultLayout(
      child: SafeArea(
        top: true,
        bottom: false,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const _Title(),
                const SizedBox(
                  height: 20,
                ),
                const _SubTitle(),
                Image.asset(
                  'asset/img/misc/logo.png',
                  width: MediaQuery.of(context).size.width / 3 * 2,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFormField(
                  hintText: '이메일을 입력해주세요.',
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomTextFormField(
                  hintText: '비밀번호를 입력해주세요.',
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  obscureText: true,
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // test@codefactory.ai
                    //testtest
                    String rawString = 'test@codefactory.ai:testtest';

                    Codec<String, String> stringToBase64 = utf8.fuse(base64);

                    String token = stringToBase64.encode(rawString);

                    final resp = await dio.post(
                      '$ip/auth/login',
                      options: Options(
                        headers: {'authorization': 'Basic $token'},
                      ),
                    );

                    final accessToken = resp.data['accessToken'];
                    final refreshToken = resp.data['refreshToken'];

                    await storage.write(
                        key: ACCESS_TOKEN_KEY, value: accessToken);
                    await storage.write(
                        key: REFRESH_TOKEN_KEY, value: refreshToken);

                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => const RootTab(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: PRIMARY_COLOR,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          3,
                        ),
                      )),
                  child: const Text(
                    '로그인',
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    // backgroundColor: PRIMARY_COLOR,
                    foregroundColor: PRIMARY_COLOR,
                  ),
                  child: const Text(
                    '회원가입',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  const _Title({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '환영합니다!',
      style: TextStyle(
        fontSize: 34,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}

class _SubTitle extends StatelessWidget {
  const _SubTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return const Text(
      '이메일과 비밀번호를 입력해서 로그인해주세요! \n오늘도 성공적인 주문이 되길 :)',
      style: TextStyle(
        fontSize: 16,
        color: BODY_TEXT_COLOR,
      ),
    );
  }
}
