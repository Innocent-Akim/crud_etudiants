import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Source {
  static Source _instace;

  static Source get getInstance {
    return _instace = null ? _instace = Source() : _instace;
  }
}
