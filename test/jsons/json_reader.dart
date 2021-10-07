import 'dart:io';

String jsonReader(String name) => File('test/jsons/$name').readAsStringSync();
