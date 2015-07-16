// Copyright (c) 2013-2015, the Harvest project authors. Please see the AUTHORS 
// file for details. All rights reserved. Use of this source code is governed 
// by a Apache license that can be found in the LICENSE file.

part of harvest;

/** Message */
abstract class Message { 
  final Map<String, Object> headers = <String, Object>{};
}

/**
 * Called automatically by [MessageBus] prior to dispatching messages to [MessageHandler]'s. 
 * Allows us to augment a [Message] with missing information such as session id, user 
 * information etc.
 */
typedef MessageEnricher(Message message);

/** Function executed when a message is fired on the [MessageBus] */
typedef MessageHandler(Message message);

