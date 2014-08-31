class IntRef {
  IntRef(this.val);
  int val;
  @override
  String toString() => val.toString();

  operator +(int other) {
    if(other is int) {
      val += other;
      return this;
    }
    throw 'incompatible type ${other.runtimeType}.';
  }
}

IntRef opsCount  = new IntRef(0);
IntRef jobXCount = new IntRef(0);
IntRef jobYCount = new IntRef(0);
IntRef jobZCount = new IntRef(0);

void doStats(var jobCount) {
  opsCount++;
  jobCount++;
}

main() {
  doStats(jobXCount);
  print('opsCount: $opsCount; jobXCount: $jobXCount; jobYCount: $jobYCount; jobZCount: $jobZCount');
}
