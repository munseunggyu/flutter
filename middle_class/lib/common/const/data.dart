import 'dart:io';

const ACCESS_TOKEN_KEY = 'ACCESS_TOKEN';
const REFRESH_TOKEN_KEY = 'REFRESH_TOKEN';

const emulatorIp = 'http://10.0.2.2:3000';

const simulatorIp = 'http://localhost:3000';

String get ip => Platform.isIOS ? simulatorIp : emulatorIp;
