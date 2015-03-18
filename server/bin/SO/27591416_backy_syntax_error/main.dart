import "package:backy/backy.dart";

 // 1.
 var neuron  = new TanHNeuron(); // returnes floatingpoint values between -1 and 1
 var student = new Backy([2, 2, 1], neuron);
 var trainer = new Trainer(backy: student, maximumReapeatingCycle: 200, precision: .1);

void main() {
 // 2. Add the pattern whcih the network should learn
 trainer.addTrainingCase([-1, -1], [-1]);
 trainer.addTrainingCase([-1, 1], [-1]);
 trainer.addTrainingCase([ 1, -1], [-1]);
 trainer.addTrainingCase([ 1, 1], [ 1]);

 // 3. train all the traininCases up to 300 times and be satisfied with a precision of           .1
 print(trainer.trainOnlineSets()); // prints number loops it took to learn all      trainingcases

 // 4. After that you can use the neural network
 print(student.use([-1, -1]));
 print(student.use([-1, 1]));
 print(student.use([ 1, -1]));
 print(student.use([ 1, 1]));
}
