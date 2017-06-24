// Copyright (c) 2017, daftspaniel. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

class MiniBus {

  final Map<String, List<Function>> _subscriptions = new Map<String,
      List<Function>>();

  // Return the number of events that have been subscribed to.
  int get eventCount {
    return _subscriptions.keys.length;
  }

  /// Return the total number of subscriptions.
  int get subscriptionCount {
    int count = 0;
    _subscriptions.keys.forEach((String key) {
      count = count + _subscriptions[key].length;
    });
    return count;
  }

  /// Subscribe a target to an event.
  void subscribe(String event, Function target) {
    List <Function> subscribers;
    if (_subscriptions.containsKey(event)) {
      subscribers = _subscriptions[event];
    }
    else {
      subscribers = new List <Function>();
      _subscriptions[event] = subscribers;
    }
    subscribers.add(target);
  }

  /// Post the event [String] to the subscriptions.
  void post(String event) {
    if (_subscriptions.containsKey(event)) {
      List <Function> subscribers = _subscriptions[event];

      subscribers.forEach((Function target) {
        target();
      });
    }
  }

  /// Display a simple report of subscriptions to STDOUT.
  void report() {
    print(
        "Active $subscriptionCount subscription(s) for $eventCount event(s).");
    _subscriptions.keys.forEach((String key) {
      List <Function> subscribers = _subscriptions[key];

      subscribers.forEach((Function target) {
        print("\t ['$key'] - $target");
      });
    });
    print('\n');
  }
}