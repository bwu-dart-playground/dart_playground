library angular2_hero_router.dialog_service;

import 'dart:html' as dom;
import 'dart:async' show Future;
import 'package:angular2/core.dart' show Injectable;

/// Async modal dialog service
/// DialogService makes this app easier to test by faking this service.
/// TODO: better modal implemenation that doesn't use window.confirm
@Injectable()
class DialogService {
  /// Ask user to confirm an action. `message` explains the action and choices.
  /// Returns promise resolving to `true`=confirm or `false`=cancel
  Future<bool> confirm(String message) {
    return new Future<bool>(() => dom.window.confirm(message ?? 'Is it OK?'));
  }
}
