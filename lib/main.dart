import 'package:flutter/material.dart';
import 'package:flutter_quize_app/quiz.dart';

void main() {
  runApp(const Quiz());
}



// Note:

// Every Flutter Widget has a built-in lifecycle: A collection of methods that are automatically executed by Flutter (at certain points of time).

// There are three extremely important (stateful) widget lifecycle methods you should be aware of:

// initState(): Executed by Flutter when the StatefulWidget's State object is initialized

// build(): Executed by Flutter when the Widget is built for the first time AND after setState() was called

// dispose(): Executed by Flutter right before the Widget will be deleted (e.g., because it was displayed conditionally)

// You will encounter them all multiple times throughout the course - therefore you don't have to memorize them now and you will see them in action. It's still worth learning about them right now already.