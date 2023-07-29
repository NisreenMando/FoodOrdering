class Credit {
  String? number;
  String? month;
  String? year;
  String? security;
  String? first;
  String? last;
  Credit({
    this.first,
    this.last,
    this.month,
    this.number,
    this.security,
    this.year,
  });

  static final users = [
    Credit(
        number: '12345',
        month: '3',
        year: '1',
        security: '123456789',
        first: 'nisreen',
        last: 'mando')
  ];
}
