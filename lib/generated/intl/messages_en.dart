// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "login": MessageLookupByLibrary.simpleMessage("Login"),
        "networkDisconnected":
            MessageLookupByLibrary.simpleMessage("Network Disconnected"),
        "networkDisconnectedDescription": MessageLookupByLibrary.simpleMessage(
            "You are no longer connected to the internet."),
        "networkReconnected":
            MessageLookupByLibrary.simpleMessage("Network Reconnected"),
        "networkReconnectedDescription": MessageLookupByLibrary.simpleMessage(
            "You are now connected to the internet."),
        "onboardingPage1Description": MessageLookupByLibrary.simpleMessage(
            "to find the perfect looking Onboarding for your app?"),
        "onboardingPage1Title":
            MessageLookupByLibrary.simpleMessage("On your way..."),
        "onboardingPage2Description":
            MessageLookupByLibrary.simpleMessage("Sliding with animation"),
        "onboardingPage2Title": MessageLookupByLibrary.simpleMessage(
            "You\'ve reached your destination.."),
        "onboardingPage3Description": MessageLookupByLibrary.simpleMessage(
            "Where everything is possible and customize your onboarding."),
        "onboardingPage3Title":
            MessageLookupByLibrary.simpleMessage("Start now!"),
        "register": MessageLookupByLibrary.simpleMessage("Register"),
        "skip": MessageLookupByLibrary.simpleMessage("Skip")
      };
}
