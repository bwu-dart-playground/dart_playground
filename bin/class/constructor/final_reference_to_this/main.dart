
typedef Step(Map<String,List<double>> dataReferences);
class AgentData {

  //for each name a list of observations
  final Map<String, List<double>> _dataMap;

  /**
   * the update step
   */
  final Step _updateStep;

  AgentData(Step initializer(Map<String,List<double>> dataReferences)) : _dataMap = new Map(), _updateStep = initializer(_dataMap);


}

void main() {
  var initializer = (Map<String,List<double>> dataReferences) => print('initializer');
  //new DataMap(initializer)
}

