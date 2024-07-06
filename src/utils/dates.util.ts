import moment from 'moment-timezone';

export async function obtenerDiasDeLaSemanaEntreFechas(startDateStr, endDateStr) {
  const resultado = {};

  let fechaActual = moment(startDateStr).tz('America/Bogota');
  let endDate = moment(endDateStr).tz('America/Bogota');

  const diasDeLaSemana = ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'];

  while (fechaActual <= endDate) {
    const diaDeLaSemana = diasDeLaSemana[fechaActual.day()]
    const diaKey = `${diaDeLaSemana} ${fechaActual.date() < 10 ? '0' : ''}${fechaActual.date()}`;
    
    resultado[diaKey] = 0;

    fechaActual.date(fechaActual.date() + 1);
  }

  return resultado;
}

export async function obtenerClaveParaFecha(fecha) {
  const diasSemana = ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'];
  const fechaObj = moment(fecha).tz('America/Bogota'); // Asegúrate de que la fecha esté en formato ISO 8601 y en UTC
  const diaSemana = fechaObj.day(); // Usa getUTCDay() para obtener el día de la semana en UTC
  const dia = fechaObj.date();
  const mes = fechaObj.month() + 1; // Los meses en JavaScript son 0-indexados

  return `${diasSemana[diaSemana]} ${dia < 10 ? '0' : ''}${dia}`;
}

