# minibus

A library for a minimal synchronous event bus.

## Usage

A simple usage example:

    import 'package:minibus/minibus.dart';

    main() {
      MiniBus bus1 = new MiniBus();
      bus1.subscribe(EVENT, (){print('Hello World!')});
      bus1.post(EVENT);
    }

## Features and bugs

Please file feature requests and bugs at the [issue tracker][tracker].

[tracker]: http://example.com/issues/replaceme
