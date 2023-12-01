export async function obtenerDiasDeLaSemanaEntreFechas(startDateStr, endDateStr) {
  const resultado = {};

  let fechaActual = new Date(startDateStr);
  fechaActual.setUTCHours(0, 0, 0, 0); // Configurar la hora en 00:00:00 en UTC

  const diasDeLaSemana = ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'];

  while (fechaActual <= new Date(endDateStr)) {
    const diaDeLaSemana = diasDeLaSemana[fechaActual.getUTCDay()];
    const diaKey = `${diaDeLaSemana} ${fechaActual.getUTCDate() < 10 ? '0' : ''}${fechaActual.getUTCDate()}`;
    
    resultado[diaKey] = 0; // Inicializar la suma de precios en 0

    fechaActual.setUTCDate(fechaActual.getUTCDate() + 1);
  }

  return resultado;
}

export async function obtenerClaveParaFecha(fecha) {
  const diasSemana = ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'];
  const fechaObj = new Date(fecha + "T00:00:00Z"); // Asegúrate de que la fecha esté en formato ISO 8601 y en UTC
  const diaSemana = fechaObj.getUTCDay(); // Usa getUTCDay() para obtener el día de la semana en UTC
  const dia = fechaObj.getUTCDate();
  const mes = fechaObj.getUTCMonth() + 1; // Los meses en JavaScript son 0-indexados

  return `${diasSemana[diaSemana]} ${dia < 10 ? '0' : ''}${dia}`;
}

