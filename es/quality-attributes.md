## Atributos de calidad

Los atributos de calidad para el nuevo Sistema de Riesgo Financiero son los siguientes.

### Rendimiento

- Los informes de riesgo deben generarse antes de las 9 a.m. del siguiente día hábil en Singapur.
 
### Escalabilidad
- El sistema debe ser capaz de hacer frente a los volúmenes de comercio durante los próximos 5 años.
- La exportación del Sistema de Datos Comerciales incluye aproximadamente 5000 operaciones ahora y se prevé que habrá 10 operaciones adicionales por día.
- La exportación de contrapartes del Sistema de Datos de Referencia incluye aproximadamente 20.000 contrapartes y el crecimiento será insignificante.
- Hay entre 40 y 50 usuarios empresariales en todo el mundo que necesitan acceder al informe.

### Disponibilidad

- Los informes de riesgos deben estar disponibles para los usuarios las 24 horas del día, los 7 días de la semana, pero se puede tolerar una pequeña cantidad de tiempo de inactividad (menos de 30 minutos por día).

### Conmutación por error

- La conmutación por error manual es suficiente para todos los componentes del sistema, siempre que se puedan cumplir los objetivos de disponibilidad.

### Seguridad

- Este sistema debe seguir la política bancaria que establece que el acceso al sistema está restringido solo a usuarios autenticados y autorizados.
- Los informes solo deben distribuirse a los usuarios autorizados.
- Solo un subconjunto de los usuarios autorizados puede modificar los parámetros utilizados en los cálculos de riesgo.
- Aunque es deseable, no hay requisitos de inicio de sesión único (por ejemplo, integración con Active Directory, LDAP, etc.).
- Todo el acceso al sistema y a los informes se realizará dentro de los límites de la red global del banco.

### Auditoría

- Los siguientes eventos deben registrarse en los registros de auditoría del sistema:
  - Generación de informes.
  - Modificación de los parámetros de cálculo de riesgos.
- Debe ser posible comprender los datos de entrada que se utilizaron para calcular el riesgo.

### Tolerancia a fallos y resiliencia

- El sistema debe tomar las medidas adecuadas para recuperarse de un error si es posible, pero todos los errores deben registrarse.
- Los errores que impiden que se complete un cálculo de riesgo de contraparte deben registrarse y el proceso debe continuar.

### Internacionalización y localización

- Todas las interfaces de usuario se presentarán solo en inglés.
- Todos los informes se presentarán únicamente en inglés.
- Todos los valores de negociación y las cifras de riesgo se presentarán únicamente en dólares estadounidenses.

### Seguimiento y gestión

- Se debe enviar una trampa de Protocolo Simple de Administración de Red (SNMP) al Servicio Central de Monitoreo del banco en las siguientes circunstancias:
  - Cuando hay un error fatal con un componente del sistema.
  - Cuando los informes no se hayan generado antes de las 9 a.m., hora de Singapur.

### Retención y archivo de datos

- Los archivos de entrada utilizados en el proceso de cálculo de riesgos deben conservarse durante 1 año.

### Interoperabilidad

- Las interfaces con los sistemas de datos existentes deben ajustarse a los formatos de datos existentes y utilizarlos.