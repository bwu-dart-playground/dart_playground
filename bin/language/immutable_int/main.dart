class IntRef {
  IntRef(this.val);
  int val;
  @override
  String toString() => val.toString();
}

IntRef opsCount  = new IntRef(0);
IntRef jobXCount = new IntRef(0);
IntRef jobYCount = new IntRef(0);
IntRef jobZCount = new IntRef(0);

void doStats(var jobCount) {
  opsCount.val++;
  jobCount.val++;
}

main() {
  doStats(jobXCount);
  print('opsCount: $opsCount; jobXCount: $jobXCount; jobYCount: $jobYCount; jobZCount: $jobZCount');
}
