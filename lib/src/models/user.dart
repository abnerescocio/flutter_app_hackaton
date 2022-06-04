class User {
  bool _hasFirstAccess = false;

  bool get hasFirstAccess => _hasFirstAccess;

  User(this._hasFirstAccess);

  void setHasFirstAccess(bool hasFirstAccess) {
    _hasFirstAccess = hasFirstAccess;
  }
}
