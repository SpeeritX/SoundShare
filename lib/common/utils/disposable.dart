import 'dart:async';

import 'package:flutter/foundation.dart';

extension DisposableStreamSubscriton on StreamSubscription {
  StreamSubscription canceledBy(Disposable widget) {
    widget.addSubscription(this);
    return this;
  }
}

abstract class Disposable {
  final List<StreamSubscription> _subscriptions = [];

  @protected
  void addSubscription(StreamSubscription subscription) {
    _subscriptions.add(subscription);
  }

  @mustCallSuper
  void dispose() {
    _cancelSubscriptions();
  }

  void _cancelSubscriptions() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
  }
}
