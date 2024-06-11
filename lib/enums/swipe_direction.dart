enum SwipeDirection {
  up,
  right,
  left;

  @override
  String toString() {
    switch (this) {
      case SwipeDirection.up:
        return 'SUPER LIKE!!';
      case SwipeDirection.right:
        return 'LIKE!';
      case SwipeDirection.left:
        return 'NOPE';
    }
  }
}
