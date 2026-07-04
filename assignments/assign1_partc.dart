void main() {
  String studentName = "Ashar Tanveer";
  
  int phy = 92;
  int chem = 85;
  int maths = 78;

  int totalMarks = phy + chem + maths;
  double percentage = (totalMarks / 300) * 100;

  print("Student Name: $studentName");
  print("Total Marks: $totalMarks");
  print("Percentage: $percentage%");
}