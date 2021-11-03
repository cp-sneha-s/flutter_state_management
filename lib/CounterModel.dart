class Increment {
  final int count;
  Increment(this.count);
}

class Decrement {
  final int count;
  Decrement(this.count);
}

int counterReducer(int count, dynamic action) {
  if (action is Increment) {
    return increase(count, action);
  }
  if (action is Decrement) {
    return decrease(count, action);
  }
}

int increase(int count, Increment action) {
  return count = action.count + 1;
}

int decrease(int count, Decrement action) {
  return count = action.count - 1;
}
