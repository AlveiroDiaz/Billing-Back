import moment from 'moment-timezone';

export async function obtenerDiasDeLaSemanaEntreFechas(startDateStr: string, endDateStr: string) {
  const resultado: { [key: string]: number } = {};

  let fechaActual = moment(startDateStr).tz('America/Bogota');
  let endDate = moment(endDateStr).tz('America/Bogota');

  const diasDeLaSemana = ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'];

  while (fechaActual.isSameOrBefore(endDate, 'day')) {
    const diaDeLaSemana = diasDeLaSemana[fechaActual.day()];
    const diaKey = `${diaDeLaSemana} ${fechaActual.date() < 10 ? '0' : ''}${fechaActual.date()}`;
    
    resultado[diaKey] = 0;

    fechaActual.add(1, 'day');
  }

  return resultado;
}

export async function obtenerClaveParaFecha(fecha: string) {
  const diasSemana = ['Dom', 'Lun', 'Mar', 'Mie', 'Jue', 'Vie', 'Sab'];
  const fechaObj = moment(fecha).tz('America/Bogota');
  const diaSemana = fechaObj.day();
  const dia = fechaObj.date();

  return `${diasSemana[diaSemana]} ${dia < 10 ? '0' : ''}${dia}`;
}
