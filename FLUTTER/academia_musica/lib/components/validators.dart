class Validators {
  Validators._();
  // ME SIRVE PARA Q SOLO SEAN LETRAS Y NO INCLUYA NUMEROS
  static String? validateString(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'DEBE INGRESAR EL NOMBRE';
    } else if (!RegExp(r"^[a-zA-ZáéíóúÁÉÍÓÚñÑ\s]+$").hasMatch(value.trim())) {
      return 'EL NOMBRE SOLO DEBE CONTENER LETRAS';
    }
    return null;
  }

  //ME PERMITE VALIDAR QUE MI VALUE INGRESADO SOLO SEA NUMEROS ENTEROS
  static String? validateInt(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'DEBE INGRESAR UN VALOR';
    } else if (!RegExp(r'^\d+$').hasMatch(value.trim())) {
      return 'SOLO SE PERMITEN NÚMEROS ENTEROS';
    }
    return null;
  }
}
