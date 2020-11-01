class Reading {
  final int id;
  final String accountname;
  final String accountno;
  final String units;
  final String previousreading;
  final String currentreading;
  final String meternumber;
  final String homeaddress;
  final String status;

  Reading(
      {this.id,
      this.accountname,
      this.accountno,
      this.currentreading,
      this.homeaddress,
      this.meternumber,
      this.status,
      this.previousreading,
      this.units});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'accountname': accountname,
      'accountno': accountno,
      'units': units,
      'previousreading': previousreading,
      'currentreading': currentreading,
      'meternumber': meternumber,
      'homeaddress': homeaddress,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Reading{id: $id, accountno: $accountno, accountname: $accountname,status: $status,meternumber:$meternumber,previousreading:$previousreading,currentreading:$currentreading,units:$units}';
  }
}
