# Sistema de Riesgos Financieros

## Contexto

Un banco de inversión global con sede en Londres, Nueva York y Singapur comercia (compra y vende) productos financieros con otros bancos (contrapartes). Cuando los precios de las acciones en los mercados bursátiles suben o bajan, el banco gana dinero o lo pierde. Al final de la jornada laboral, el banco necesita tener una visión de cuánto riesgo está expuesto (por ejemplo, de perder dinero) realizando algunos cálculos sobre los datos que tiene sobre sus operaciones. El banco cuenta con un Sistema de Datos Comerciales (TDS) y un Sistema de Datos de Referencia (RDS), pero necesita un nuevo Sistema de Riesgos.

![](embed:Context)

### Sistema de Datos Comerciales

El Sistema de Datos Comerciales mantiene un almacén de todas las operaciones realizadas por el banco. Ya está configurado para generar una exportación XML basada en archivos de datos comerciales al cierre de las operaciones (17:00 horas) en Nueva York. La exportación incluye la siguiente información para cada operación realizada por el banco:

- Identificación comercial
- Fecha
- Valor comercial actual en dólares estadounidenses
- ID de contraparte

### Sistema de datos de referencia

El Sistema de Datos de Referencia mantiene todos los datos de referencia que necesita el banco. Esto incluye información sobre las contrapartes; cada uno de los cuales representa a un individuo, un banco, etc. También está disponible una exportación XML basada en archivos que incluye información básica sobre cada contraparte. Está previsto que en los próximos 3 meses se complete un nuevo sistema de datos de referencia para toda la organización, y que el sistema actual se desmantele finalmente.