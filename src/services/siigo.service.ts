import axios from "axios";
import { getConnectionSql } from "../db/connection";
import { VehicleEntity } from "../db/entities/vehicle.entity";

export class SiigoService {

    static async getTokenSiigo() {
        console.log("Starting method getTokenSiigo")
        await getConnectionSql();
        try {
            const url = 'https://sandbox.api.siigo.com/auth';

            const data = {
                username: 'AUTOLAVADOELINGLES@GMAIL.COM',
                access_key: 'ZjNhYWZiZWMtYzVmOC00NDM3LTgzMjUtZTYwNDlmMGU1N2RiOiU5a3tZMUQtLFA='
            };

            const response = await axios.post(url, data);

            console.log('Autenticación exitosa:', response.data);

            this.createInvoice(response.data.access_token);

            console.log("Ending method getTokenSiigo")
        } catch (error) {
            console.log(">>>>>>", error);

        }
    }

    static async createInvoice(token) {
        const url = 'https://sandbox.api.siigo.com/v1/invoices';
        const invoiceData = {
            "document": {
                "id": 24446
            },
            "date": "2015-12-15",
            "customer": {
                "person_type": "Person",
                "id_type": "13",
                "identification": "13832081",
                "branch_office": 0,
                "name": ["Manuel", "Camacho"],
                "address": {
                    "address": "Cra. 18 #79A - 42",
                    "city": {
                        "country_code": "Co",
                        "country_name": "Colombia",
                        "state_code": "19",
                        "state_name": "Cauca",
                        "city_code": "19001",
                        "city_name": "Popayán"
                    },
                    "postal_code": "110911"
                },
                "phones": [{
                    "indicative": "57",
                    "number": "3006003345",
                    "extension": "132"
                }],
                "contacts": [{
                    "first_name": "Marcos",
                    "last_name": "Castillo",
                    "email": "marcos.castillo@contacto.com",
                    "phone": {
                        "indicative": "57",
                        "number": "3006003345",
                        "extension": "132"
                    }
                }]
            },
            "cost_center": 235,
            "currency": {
                "code": "USD",
                "exchange_rate": 3825.03
            },
            "seller": 629,
            "stamp": {
                "send": true
            },
            "mail": {
                "send": true
            },
            "observations": "Observaciones",
            "items": [{
                "code": "Item-1",
                "description": "Camiseta de algodón",
                "quantity": 1,
                "price": 1069.77,
                "discount": 0.0,
                "taxes": [{
                    "id": 13156
                }],
                "transport": {
                    "file_number": 536,
                    "shipment_number": "RM-145",
                    "transported_quantity": 120,
                    "measurement_unit": "KGM",
                    "freight_value": 220000,
                    "purchase_order": "OC-236",
                    "service_type": "AdditionalService"
                }
            }],
            "payments": [{
                "id": 5636,
                "value": 1273.03,
                "due_date": "2021-03-19"
            }],
            "globaldiscounts": [{
                "id": 13156,
                "percentage": 10.00,
                "value": 100.0
            }],
            "additional_fields": {}
        };

        try {
            const response = await axios.post(url, invoiceData, {
                headers: {
                    Authorization: `Bearer ${token}`
                }
            });
            console.log('Factura creada exitosamente:', response.data);
        } catch (error) {
            console.error('Error al crear la factura:', error.response ? error.response.data : error.message);
            throw error;
        }
    }



}