# Re-trying to create a formal UML diagram with proper attributes, methods, and relationships in Spanish

uml_formal_retry = Digraph('UML_Formal_Retry', filename='/mnt/data/uml_formal_diagrama_clases_v2')

# Define classes in UML format with attributes and methods (in Spanish)

uml_formal_retry.node('App', '''Aplicación
------------------------
+ nombre: string
+ versión: string
+ gestionarOperaciones(): void
+ enviarNotificaciones(): void''')

uml_formal_retry.node('Database', '''Base de Datos en la Nube
------------------------
+ nombre: string
+ tamaño: number
+ almacenarDatos(): void
+ recuperarDatos(): void''')

uml_formal_retry.node('Owner', '''Propietario
------------------------
+ nombre: string
+ ingresos: number
+ gastos: number
+ gestionarFinanzas(): void
+ controlarOperaciones(): void''')

uml_formal_retry.node('Client', '''Cliente
------------------------
+ nombre: string
+ ubicación: string
+ buscarLavadero(): void
+ hacerReserva(): void
+ recibirNotificaciones(): void''')

uml_formal_retry.node('CarWash', '''Autolavado
------------------------
+ nombre: string
+ ubicación: string
+ servicios: string[]
+ promociones: string[]
+ ofrecerServicios(): void''')

uml_formal_retry.node('Reservation', '''Reserva
------------------------
+ fecha: Date
+ hora: Time
+ servicio: string
+ confirmarReserva(): void''')

# Define relationships between classes (in Spanish, with multiplicity)

uml_formal_retry.edge('App', 'Database', '1 conecta a 1')
uml_formal_retry.edge('App', 'Owner', '1 ofrece herramientas a 1')
uml_formal_retry.edge('App', 'Client', '1 ofrece servicios a *')
uml_formal_retry.edge('Owner', 'CarWash', '1 gestiona *')
uml_formal_retry.edge('Client', 'Reservation', '* realiza 1')
uml_formal_retry.edge('Client', 'CarWash', '* selecciona 1')

# Save the UML diagram as a PDF
uml_formal_retry.render('/mnt/data/uml_formal_diagrama_clases_v2', format='pdf')

'/mnt/data/uml_formal_diagrama_clases_v2.pdf'