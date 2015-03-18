//int _zero = "0".codeUnits[0];
//int _nine = "9".codeUnits[0];
bool isDigit(String s, int idx) =>
  "0".compareTo(s[idx]) <= 0 && "9".compareTo(s[idx]) >= 0;

void main() {
  String s = '0123456789abcdefgHIJKLMN';
  for(int i = 0; i < s.length; i++) {
    print(isDigit(s, i));
  }
}
