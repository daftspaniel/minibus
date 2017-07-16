# minibus

A library for a minimal synchronous event bus.

## Usage

A simple usage example:

    import 'package:minibus/minibus.dart';
    String EVENT = "myevent";
    
    main() {
      MiniBus bus1 = new MiniBus();
      bus1.subscribe(EVENT, (){print('Hello World!')});
      bus1.post(EVENT);
    }

## Features and bugs

Please file feature requests and bugs.

Run tests with (note tests mostly moved to sub-packages):
+ pub run test

Check source code formatting:
+ dartfmt -n .