// Copyright (c) 2013, the Harvest project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is governed
// by a Apache license that can be found in the LICENSE file.

part of harvest;

/** Message */
abstract class Message {
  final Map<String, Object> headers = <String, Object>{};
}

/**
 * Mixin for messages that are completed manually by their subscribers
 */
abstract class CallbackCompleted implements Message, StatusCallback {
  MessageErrorHandler _onError;
  Function _onSuccess;

  @override
  failed([Object errorData = null]) => _onError(errorData);

  @override
  succeeded([Object callbackData = null]) => _onSuccess(callbackData);
}

/**
 * Generic callback to communicate success or failure
 */
abstract class StatusCallback {
  failed([Object errorData = null]);

  succeeded([Object callbackData = null]);
}

/**
 * Called automatically by [MessageBus] prior to dispatching messages to [MessageHandler]'s.
 * Allows us to augment a [Message] with missing information such as session id, user
 * information etc.
 */
typedef MessageEnricher(Message message);

/**
 * Function executed when a message is fired on the [MessageBus]
 */
typedef MessageHandler(Message message);

/**
 * Function invoked when a message subscriber fails
 */
typedef void MessageErrorHandler(Object object, [StackTrace detail = null]);
