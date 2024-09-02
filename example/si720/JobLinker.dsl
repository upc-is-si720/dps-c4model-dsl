workspace "JobLinker" "aplicacion para buscar empleo" {

    model {
        // actors
        # Entidades creadas
        postulante = person "Postulante" "Persona que postula a un empelo" "Postulante"
        empresa = person "Empresa" "Grupo encargado de contratar personas" "Empresa"
        anonymusPostulante = person "PostulanteAnonimo" "Persona que ingresa anonimanente al sistema pero tiene funciones limitadas" "PostulanteAnonimo"
    
        jobLinker = softwareSystem "JobLinker-App" "Aplicacion para busqueda de empleo" "JobLinker-App" {
          mobileApp = container "Mobile App" "Proporciona un conjunto de funciones de Internet a los clientes a través de su dispositivo móvil." "Flutter" "MobileApp" 
          apiGateway = container "APIGateway" "Componente que se encuentra entre los clientes y los servicios y proporciona un manejo centralizado de la comunicación API entre ellos" "ApiGateway"
          # aqui van los microoservicios (bounded context)
          
          PerfilUsuarioBC = container "PerfilUsuario Bounded Context" "Register user" "Laravel PHP" "perfilUsuarioBC" {
           group "Empelado"{
               PerfilUsuarioQueryService = component "PerfilUsuario QueryService" "Bussines Logic del Query del PerfilUsuario" "Class" "Comando"
               PerfilUsuarioCommandService = component "PerfilUsuario CommandService" "Bussines Logic del Command del PerfilUsuario" "Class" "Comando"
               PerfilusuarioQuery = component "PerfilUsuario Query" "Query for read an entity PerfilUsuario" "Record" "comando3"
               PerfilUsuarioCommand = component "PerfilUsuario Command" "Command for create, update and delete an Entity PerfilUsuario" "Record" "comando2"
               PerfilUsuarioRepository = component "PerfilUsuario Repository" "Repository Interface for PerfilUsuario Entity" "Interface" "comando1"
               PerfilUsuarioEntity = component "PerfilUsuario Entity" "Container class for PerfilUsuario" "Class" "Entity"
               
           }
           group "Editar"{
               EditarQueryService = component "Editar Query Service" "Bussines Logic del Query del Editar" "Class" "Comando"
               EditarCommandService = component "Editar CommandService" "Bussines Logic del Command del Editar" "Class" "Comando"
               EditarQuery = component "Editar Query" "Query for read an entity Editar" "Record" "comando3"
               EditarCommand = component "Editar Command" "Command for create, update and delete an Entity Editar" "Record" "comando2"
               EditarRepository = component "Editar Repository" "Repository Interface for Editar Entity" "Interface" "comando1"
               EditarEntity = component "Editar Entity" "Container class for Editar" "Class" "Entity"
            
           }
           group "Documento"{
               DocumentoEntity = component "Documento Entity" "Container class for Documento" "Class" "Entity" 
               DocumentoRepository = component "Documento Repository" "Repository Interface for Documento Entity" "Interface" "comando1"
           }
           group "Imagen"{
               ImagenRepository = component "Imagen Repository" "Repository Interface for Imagen Entity" "Interface" "comando1"
               ImagenEntity = component "Imagen Entity" "Container class for Imagen" "Class" "Entity"
               }
           group "Mencion"{
               MencionRepository = component "Mencion Respository" "Repository Interface for Mencion Entity" "Interface" "comando1"
               MencionEntity = component "Mencion Entity" "Container class for Mencion" "Class" "Entity"
           }
           # controlador de perfilUsuario BC
            PerfilUsuarioBCController = component "PerfilUsuarioBC Controller" "RESTfull API for PerfilUsuario" "Class" "BCController"
            EditarBCController = component "EditarBC Controller" "RESTfull API Controller Class of Editar" "Class" "BCController"
          }
          dashBoardBC = container "DashBoard" "Funcionalidad que permite a los pstulantes acceder a las opciones del sistema" "Java v20 / Spring" "DashBoard"{
            group "PerfilUsuario"{
                PerfilEmpleadoQueryService = component "PerfilUsuario QueryService" "Bussines Logic del Query del PerfilUsuario" "Class" "Comando"
               PerfilEmpleadoCommandService = component "PerfilUsuario CommandService" "Bussines Logic del Command del PerfilUsuario" "Class" "Comando"
               PerfilEmpleadoQuery = component "PerfilUsuario Query" "Query for read an entity PerfilUsuario" "Record" "comando3"
               PerfilEmpleadoCommand = component "PerfilUsuario Command" "Command for create, update and delete an Entity PerfilUsuario" "Record" "comando2"
               PerfilEmpleadoRepository = component "PerfilUsuario Repository" "Repository Interface for PerfilUsuario Entity" "Interface" "comando1"
              PerfilEmpleadoEntity = component "PerfilUsuario Entity" "Container class for PerfilUsuario" "Class" "Entity"
            }
            group "PerfilEmpresa"{
                PerfilEmpresaQueryService = component "PerfilEmpresa QueryService" "Bussines Logic del Query del PerfilEmpresa" "Class" "Comando"
               PerfilEmpresaCommandService = component "PerfilEmpresa CommandService" "Bussines Logic del Command del PerfilEmpresa" "Class" "Comando"
               PerfilEmpresaQuery = component "PerfilEmpresa Query" "Query for read an entity PerfilEmpresa" "Record" "comando3"
               PerfilEmpresaCommand = component "PerfilEmpresa Command" "Command for create, update and delete an Entity PerfilEmpresa" "Record" "comando2"
               PerfilEmpresaRepository = component "PerfilEmpresa Repository" "Repository Interface for PerfilEmpresa Entity" "Interface" "comando1"
              PerfilEmpresaEntity = component "PerfilEmpresa Entity" "Container class for PerfilEmpresa" "Class" "Entity"
            }
            group "EstadoPostulacion"{
                EstadoPostulacionRepository = component "EstadoPostulacion Repository" "Repository Interface for EstadoPostulacion Entity" "Interface" "comando1"
               EstadoPostulacionEntity = component "EstadoPostulacion Entity" "Container class for EstadoPostulacion" "Class" "Entity"
            }
            group "Busqueda"{
                BusquedaQueryService = component "Busqueda QueryService" "Bussines Logic del Query del Busqueda" "Class" "Comando"
               BusquedaCommandService = component "Busqueda CommandService" "Bussines Logic del Command del Busqueda" "Class" "Comando"
               BusquedaQuery = component "Busqueda Query" "Query for read an entity Busqueda" "Record" "comando3"
               BusquedaCommand = component "Busqueda Command" "Command for create, update and delete an Entity Busqueda" "Record" "comando2"
               BusquedaRepository = component "Busqueda Repository" "Repository Interface for Busqueda Entity" "Interface" "comando1"
              BusquedaEntity = component "Busqueda Entity" "Container class for Busqueda" "Class" "Entity"
            }
            PerfilEmpleadoBCController = component "PerfilUsuarioBC Controller" "RESTfull API for PerfilUsuario" "Class" "BCController"
            BusquedaBCController = component "BusquedaBC Controller" "RESTfull API for Busqueda" "Class" "BCController"
            PerfilEmpresaBCController = component "PerfilEmpresaBC Controller" "RESTfull API Controller Class of Editar" "Class" "BCController"
          }
          ofertaEmpleoBC = container "Creacion de Ofertas de Empleo" "Funcionalidad que permite a las Empresas crear ofertas de empleo en busca de postulantes" "Java v20 / Spring" "ofertaEmpleoBC"{
          group "PerfilContratador" {
               PerfilContratadorQueryService = component "PerfilEmpresa QueryService" "Bussines Logic del Query del PerfilEmpresa" "Class" "Comando"
               PerfilContratadorCommandService = component "PerfilEmpresa CommandService" "Bussines Logic del Command del PerfilEmpresa" "Class" "Comando"
               PerfilContratadorQuery = component "PerfilEmpresa Query" "Query for read an entity PerfilEmpresa" "Record" "comando3"
               PerfilContratadorCommand = component "PerfilEmpresa Command" "Command for create, update and delete an Entity PerfilEmpresa" "Record" "comando2"
               PerfilContratadorRepository = component "PerfilEmpresa Repository" "Repository Interface for PerfilEmpresa Entity" "Interface" "comando1"
              PerfilContratadorEntity = component "PerfilEmpresa Entity" "Container class for PerfilEmpresa" "Class" "Entity"
          }
          group "Oferta"{
                OfertaQueryService = component "Oferta QueryService" "Bussines Logic del Query del Oferta" "Class" "Comando"
               OfertaCommandService = component "Oferta CommandService" "Bussines Logic del Command del Oferta" "Class" "Comando"
               OfertaQuery = component "Oferta Query" "Query for read an entity Oferta" "Record" "comando3"
               OfertaCommand = component "Oferta Command" "Command for create, update and delete an Entity Oferta" "Record" "comando2"
              OfertaRepository = component "Oferta Repository" "Repository Interface for Oferta Entity" "Interface" "comando1"
              OfertaEntity = component "Oferta Entity" "Container class for Oferta" "Class" "Entity"
          }
          group "Empleo"{
              EmpleoQueryService = component "Empleo QueryService" "Bussines Logic del Query del Empleo" "Class" "Comando"
               EmpleoCommandService = component "Empleo CommandService" "Bussines Logic del Command del Empleo" "Class" "Comando"
               EmpleoQuery = component "Empleo Query" "Query for read an entity Empleo" "Record" "comando3"
               EmpleoCommand = component "Empleo Command" "Command for create, update and delete an Entity Empleo" "Record" "comando2"
               EmpleoRepository = component "Empleo Repository" "Repository Interface for Empleo Entity" "Interface" "comando1"
              EmpleoEntity = component "Empleo Entity" "Container class for Empleo" "Class" "Entity"
          }
          group "Documento"{
             DocumentEntity = component "Documento Entity" "Container class for Documento" "Class" "Entity" 
             DocumentRepository = component "Documento Repository" "Repository Interface for Documento Entity" "Interface" "comando1"
          }
            # controlador de perfilUsuario BC
            EmpleoBCController = component "EmpleoBC Controller" "RESTfull API Controller Class for Empleo" "Class" "BCController"
            OfertaBCController = component "OfertaBC Controller" "RESTfull API Controller Class of Oferta" "Class" "BCController"
            PerfilContratadorBCController = component "PerfilEmpresaBC Controller" "RESTfull API Controller Class of PerfilEmpresa" "Class" "BCController"
          }
          busquedaEmpleoBC = container "Busqueda de empleo" "Funcionalidad que permite a los postulantes buscar la oferta de empleo ideal"  "Java v20 / Spring" "busquedaEmpleoBC"{
            group "Usuario"{
                UsuarioQueryService = component "PerfilUsuario QueryService" "Bussines Logic del Query del PerfilUsuario" "Class" "Comando"
               UsuarioCommandService = component "PerfilUsuario CommandService" "Bussines Logic del Command del PerfilUsuario" "Class" "Comando"
               UsuarioQuery = component "PerfilUsuario Query" "Query for read an entity PerfilUsuario" "Record" "comando3"
               UsuarioCommand = component "PerfilUsuario Command" "Command for create, update and delete an Entity PerfilUsuario" "Record" "comando2"
               UsuarioRepository = component "PerfilUsuario Repository" "Repository Interface for PerfilUsuario Entity" "Interface" "comando1"
               UsuarioEntity = component "PerfilUsuario Entity" "Container class for PerfilUsuario" "Class" "Entity"
            }
            group "Buscar"{
               BuscarQueryService = component "Busqueda QueryService" "Bussines Logic del Query del Busqueda" "Class" "Comando"
               BuscarCommandService = component "Busqueda CommandService" "Bussines Logic del Command del Busqueda" "Class" "Comando"
               BuscarQuery = component "Busqueda Query" "Query for read an entity Busqueda" "Record" "comando3"
               BuscarCommand = component "Busqueda Command" "Command for create, update and delete an Entity Busqueda" "Record" "comando2"
               BuscarRepository = component "Busqueda Repository" "Repository Interface for Busqueda Entity" "Interface" "comando1"
               BuscarEntity = component "Busqueda Entity" "Container class for Busqueda" "Class" "Entity"
            }
            group "Oferta"{
                ResultadoQueryService = component "Oferta QueryService" "Bussines Logic del Query del Oferta" "Class" "Comando"
               ResultadoCommandService = component "Oferta CommandService" "Bussines Logic del Command del Oferta" "Class" "Comando"
               ResultadoQuery = component "Oferta Query" "Query for read an entity Oferta" "Record" "comando3"
               ResultadoCommand = component "Oferta Command" "Command for create, update and delete an Entity Oferta" "Record" "comando2"
              ResultadoRepository = component "Oferta Repository" "Repository Interface for Oferta Entity" "Interface" "comando1"
              ResultadoEntity = component "Oferta Entity" "Container class for Oferta" "Class" "Entity"
            }
            group "Guardado"{
                GuardadoRepository = component "Guardado Repository" "Repository Interface for Guardado Entity" "Interface" "comando1"
               GuardadoEntity = component "Guardado Entity" "Container class for Guardado" "Class" "Entity"
            }
            UsuarioBCController = component "PerfilUsuarioBC Controller" "RESTfull API for PerfilUsuario" "Class" "BCController"
            ResultadoBCController = component "ResultadoBC Controller" "RESTfull API Controller Class of Oferta" "Class" "BCController"
            BuscarBCController = component "BuscarBC Controller" "RESTfull API for Busqueda" "Class" "BCController"
          }
          recomendacionesEmpleoBC = container "Recomendacion de Empleos" "Funcionalidad que recomienda ofertas de empleo a los postulantes"  "Java v20 / Spring" "recomendacionesEmpleo"{
              group "Usuario"{
                    UserQueryService = component "PerfilUsuario QueryService" "Bussines Logic del Query del PerfilUsuario" "Class" "Comando"
               UserCommandService = component "PerfilUsuario CommandService" "Bussines Logic del Command del PerfilUsuario" "Class" "Comando"
               UserQuery = component "PerfilUsuario Query" "Query for read an entity PerfilUsuario" "Record" "comando3"
               UserCommand = component "PerfilUsuario Command" "Command for create, update and delete an Entity PerfilUsuario" "Record" "comando2"
               UserRepository = component "PerfilUsuario Repository" "Repository Interface for PerfilUsuario Entity" "Interface" "comando1"
               UserEntity = component "PerfilUsuario Entity" "Container class for PerfilUsuario" "Class" "Entity"
              }
              group "Busqueda"{
                   SearchQueryService = component "Busqueda QueryService" "Bussines Logic del Query del Busqueda" "Class" "Comando"
               SearchCommandService = component "Busqueda CommandService" "Bussines Logic del Command del Busqueda" "Class" "Comando"
               SearchQuery = component "Busqueda Query" "Query for read an entity Busqueda" "Record" "comando3"
               SearchCommand = component "Busqueda Command" "Command for create, update and delete an Entity Busqueda" "Record" "comando2"
               SearchRepository = component "Busqueda Repository" "Repository Interface for Busqueda Entity" "Interface" "comando1"
               SearchEntity = component "Busqueda Entity" "Container class for Busqueda" "Class" "Entity"
              }
              group "Filtro"{
                  FiltroRepository = component "Filtro Repository" "Repository Interface for Filtro Entity" "Interface" "comando1"
                  FiltroEntity = component "Filtro Entity" "Container class for Filtro" "Class" "Entity"
              }
              UserBCController = component "PerfilUsuarioBC Controller" "RESTfull API for PerfilUsuario" "Class" "BCController"
              SearchBCController = component "BuscarBC Controller" "RESTfull API for Busqueda" "Class" "BCController"
          }
          comunicacionBC = container "Comunicacion" "Funcionalidad que permite al postulante entablar comunicacion con otros Postulantes" "Java v20 / Spring" "Comunicacion"{
              group "Usuario"{
                  PostulanteQueryService = component "PerfilUsuario QueryService" "Bussines Logic del Query del PerfilUsuario" "Class" "Comando"
                    PostulanteCommandService = component "PerfilUsuario CommandService" "Bussines Logic del Command del PerfilUsuario" "Class" "Comando"
                    PostulanteQuery = component "PerfilUsuario Query" "Query for read an entity PerfilUsuario" "Record" "comando3"
                    PostulanteCommand = component "PerfilUsuario Command" "Command for create, update and delete an Entity PerfilUsuario" "Record" "comando2"
                    PostulanteRepository = component "PerfilUsuario Repository" "Repository Interface for PerfilUsuario Entity" "Interface" "comando1"
                    PostulanteEntity = component "PerfilUsuario Entity" "Container class for PerfilUsuario" "Class" "Entity"
              }
              group "Empresa"{
                  EmpresasQueryService = component "Empresas QueryService" "Bussines Logic del Query del Empresas" "Class" "Comando"
                    EmpresasCommandService = component "Empresas CommandService" "Bussines Logic del Command del Empresas" "Class" "Comando"
                    EmpresasQuery = component "Empresas Query" "Query for read an entity Empresas" "Record" "comando3"
                    EmpresasCommand = component "Empresas Command" "Command for create, update and delete an Entity Empresas" "Record" "comando2"
                    EmpresasRepository = component "Empresas Repository" "Repository Interface for Empresas Entity" "Interface" "comando1"
                    EmpresasEntity = component "Empresas Entity" "Container class for Empresas" "Class" "Entity"

              }
              group "Metodo"{
                  MetodoQueryService = component "MetodoComunicacion QueryService" "Bussines Logic del Query del MetodoComunicacion" "Class" "Comando"
                    MetodoCommandService = component "MetodoComunicacion CommandService" "Bussines Logic del Command del MetodoComunicacion" "Class" "Comando"
                    MetodoQuery = component "MetodoComunicacion Query" "Query for read an entity MetodoComunicacion" "Record" "comando3"
                    MetodoCommand = component "MetodoComunicacion Command" "Command for create, update and delete an Entity MetodoComunicacion" "Record" "comando2"
                    MetodoRepository = component "MetodoComunicacion Repository" "Repository Interface for MetodoComunicacion Entity" "Interface" "comando1"
                    MetodoEntity = component "MetodoComunicacion Entity" "Container class for MetodoComunicacion" "Class" "Entity"
              }
              group "Chat"{
                  ChatRepository = component "ComunicacionChat Repository" "Repository Interface for ComunicacionChat Entity" "Interface" "comando1"
                    ChatEntity = component "ComunicacionChat Entity" "Container class for ComunicacionChat" "Class" "Entity"
              }
              group "Llamada"{
                  LlamadaRepository = component "ComunicacionVideoLlamada Repository" "Repository Interface for ComunicacionVideoLlamada Entity" "Interface" "comando1"
                    LlamadaEntity = component "ComunicacionVideoLlamada Entity" "Container class for ComunicacionVideoLlamada" "Class" "Entity"
              }
              PostulanteBCController = component "PerfilUsuarioBC Controller" "RESTfull API for PerfilUsuario" "Class" "BCController"
              EmpresasBCController = component "PerfilEmpresaBC Controller" "RESTfull API Controller Class of PerfilEmpresaBC" "Class" "BCController"
              MetodoBCController = component "MetodoComunicacion Controller" "RESTfull API Controller Class of MetodoComunicacion" "Class" "BCController"

          }
          consejosBC = container "Consejos busqueda de empleo" "Funcionalidad que enseña al postulante como encontrar el empleo ideal" "Java v20 / Spring" "ConsejosBusquedaEmpelo"{
              group "Postulante"{
                  ConsultadorQueryService = component "PerfilUsuario QueryService" "Bussines Logic del Query del PerfilUsuario" "Class" "Comando"
                    ConsultadorCommandService = component "PerfilUsuario CommandService" "Bussines Logic del Command del PerfilUsuario" "Class" "Comando"
                    ConsultadorQuery = component "PerfilUsuario Query" "Query for read an entity PerfilUsuario" "Record" "comando3"
                    ConsultadorCommand = component "PerfilUsuario Command" "Command for create, update and delete an Entity PerfilUsuario" "Record" "comando2"
                    ConsultadorRepository = component "PerfilUsuario Repository" "Repository Interface for PerfilUsuario Entity" "Interface" "comando1"
                    ConsultadorEntity = component "PerfilUsuario Entity" "Container class for PerfilUsuario" "Class" "Entity"
              }
              group "Tips"{
                  TipsQueryService = component "Tips QueryService" "Bussines Logic del Query del Tips" "Class" "Comando"
                    TipsCommandService = component "Tips CommandService" "Bussines Logic del Command del Tips" "Class" "Comando"
                    TipsQuery = component "Tips Query" "Query for read an entity Tips" "Record" "comando3"
                    TipsCommand = component "Tips Command" "Command for create, update and delete an Entity Tips" "Record" "comando2"
                    TipsRepository = component "Tips Repository" "Repository Interface for Tips Entity" "Interface" "comando1"
                    TipsEntity = component "Tips Entity" "Container class for Tips" "Class" "Entity"
              }
              group "Ayuda_Base"{
                  BuscarAyudaRepository = component "BuscarAyuda Repository" "Repository Interface for BuscarAyuda Entity" "Interface" "comando1"
                    BuscarAyudaEntity = component "BuscarAyuda Entity" "Container class for BuscarAyuda" "Class" "Entity"
              }
              group "Consejos"{
                  AyudaExternaRepository = component "AyudaExterna Repository" "Repository Interface for AyudaExterna Entity" "Interface" "comando1"
                    AyudaExternaEntity = component "AyudaExterna Entity" "Container class for AyudaExterna" "Class" "Entity"
              }
              ConsultadorBCController = component "PerfilUsuarioBC Controller" "RESTfull API for PerfilUsuario" "Class" "BCController"
              TipsBCController = component "Tips Controller" "RESTfull API for Tips" "Class" "BCController"
          }
          contratacionBC = container "Contratacion" "Funcionalidad que permite a las empresas seleccionar el postulante ideal" "Java v20 / Spring" "Contratacion"{
              group "Empleado"{
                  InternoQueryService = component "PerfilInterno QueryService" "Bussines Logic del Query del PerfilInterno" "Class" "Comando"
InternoCommandService = component "PerfilInterno CommandService" "Bussines Logic del Command del PerfilInterno" "Class" "Comando"
InternoQuery = component "PerfilInterno Query" "Query for read an entity PerfilInterno" "Record" "comando3"
InternoCommand = component "PerfilInterno Command" "Command for create, update and delete an Entity PerfilInterno" "Record" "comando2"
InternoRepository = component "PerfilInterno Repository" "Repository Interface for PerfilInterno Entity" "Interface" "comando1"
InternoEntity = component "PerfilInterno Entity" "Container class for PerfilInterno" "Class" "Entity"

              }
              group "Contratador"{
                  ContratadorQueryService = component "PerfilEmpresa QueryService" "Bussines Logic del Query del PerfilEmpresa" "Class" "Comando"
ContratadorCommandService = component "PerfilEmpresa CommandService" "Bussines Logic del Command del PerfilEmpresa" "Class" "Comando"
ContratadorQuery = component "PerfilEmpresa Query" "Query for read an entity PerfilEmpresa" "Record" "comando3"
ContratadorCommand = component "PerfilEmpresa Command" "Command for create, update and delete an Entity PerfilEmpresa" "Record" "comando2"
ContratadorRepository = component "PerfilEmpresa Repository" "Repository Interface for PerfilEmpresa Entity" "Interface" "comando1"
ContratadorEntity = component "PerfilEmpresa Entity" "Container class for PerfilEmpresa" "Class" "Entity"

              }
              group "Reclutamiento"{
                  ReclutamientoQueryService = component "Reclutamiento QueryService" "Bussines Logic del Query del Reclutamiento" "Class" "Comando"
ReclutamientoCommandService = component "Reclutamiento CommandService" "Bussines Logic del Command del Reclutamiento" "Class" "Comando"
ReclutamientoQuery = component "Reclutamiento Query" "Query for read an entity Reclutamiento" "Record" "comando3"
ReclutamientoCommand = component "Reclutamiento Command" "Command for create, update and delete an Entity Reclutamiento" "Record" "comando2"
ReclutamientoRepository = component "Reclutamiento Repository" "Repository Interface for Reclutamiento Entity" "Interface" "comando1"
ReclutamientoEntity = component "Reclutamiento Entity" "Container class for Reclutamiento" "Class" "Entity"

              }
              group "Empleo"{
                  TrabajoQueryService = component "Empleo QueryService" "Bussines Logic del Query del Empleo" "Class" "Comando"
TrabajoCommandService = component "Empleo CommandService" "Bussines Logic del Command del Empleo" "Class" "Comando"
TrabajoQuery = component "Empleo Query" "Query for read an entity Empleo" "Record" "comando3"
TrabajoCommand = component "Empleo Command" "Command for create, update and delete an Entity Empleo" "Record" "comando2"
TrabajoRepository = component "Empleo Repository" "Repository Interface for Empleo Entity" "Interface" "comando1"
TrabajoEntity = component "Empleo Entity" "Container class for Empleo" "Class" "Entity"

              }
              group "Modalidad"{
                  ModalidadTrabajoQueryService = component "ModalidadTrabajo QueryService" "Bussines Logic del Query del ModalidadTrabajo" "Class" "Comando"
ModalidadTrabajoCommandService = component "ModalidadTrabajo CommandService" "Bussines Logic del Command del ModalidadTrabajo" "Class" "Comando"
ModalidadTrabajoQuery = component "ModalidadTrabajo Query" "Query for read an entity ModalidadTrabajo" "Record" "comando3"
ModalidadTrabajoCommand = component "ModalidadTrabajo Command" "Command for create, update and delete an Entity ModalidadTrabajo" "Record" "comando2"
ModalidadTrabajoRepository = component "ModalidadTrabajo Repository" "Repository Interface for ModalidadTrabajo Entity" "Interface" "comando1"
ModalidadTrabajoEntity = component "ModalidadTrabajo Entity" "Container class for ModalidadTrabajo" "Class" "Entity"

              }
              group "Presencial"{
                  PresencialRepository = component "Presencial Repository" "Repository Interface for Presencial Entity" "Interface" "comando1"
PresencialEntity = component "Presencial Entity" "Container class for Presencial" "Class" "Entity"

              }
              group "Virtual"{
                  VirtualRepository = component "Virtual Repository" "Repository Interface for Virtual Entity" "Interface" "comando1"
VirtualEntity = component "Virtual Entity" "Container class for Virtual" "Class" "Entity"

              }
              group "Hibrido"{
                  HibridoRepository = component "Híbrido Repository" "Repository Interface for Híbrido Entity" "Interface" "comando1"
HibridoEntity = component "Híbrido Entity" "Container class for Híbrido" "Class" "Entity"

              }
              ContratadorBCController = component "PerfilEmpresaBC Controller" "RESTfull API Controller Class of PerfilEmpresaBC" "Class" "BCController"
              ModalidadBCController = component "ModalidadBC Controller" "RESTfull API Controller Class of ModalidadBC" "Class" "BCController"
                TrabajoBCController = component "EmpleoBC Controller" "RESTfull API for Empleo" "Class" "BCController"
              ReclutamientoBCController = component "ReclutamientoBC Controller" "RESTfull API Controller Class of ReclutamientoBC" "Class" "BCController"
              InternoBCController = component "PerfilUsuarioBC Controller" "RESTfull API for PerfilUsuario" "Class" "BCController"
          }
          databaseApp = container "Base de datos no relacional" "Almacena y actualiza información, credenciales de autenticación hash, registros de acceso, etc." "MongoDB" "databaseApp"
        } 
         # sistema externos a utilizar
        googleApi = softwareSystem "Google-API" "vinculacion de cuenta con Google" "Google-API"
        linkeddinApi = softwareSystem "Linkeddin-API" "vinculacion de cuenta con Linkedind" "Linkeddin-API"
        abstractAPI = softwareSystem "AbstractAPI" "Se encarga de la validacion o recuperacion de la cuenta" "AbstractAPI"
        
        
         # Enlace de user to program
        postulante -> jobLinker "use program"
        empresa -> joblinker "use Program"
        anonymusPostulante -> joblinker "use Program"
         # Enlace program to appi
        jobLinker -> googleApi "Request to Gmail"
        jobLinker -> linkeddinApi "Request to Linkedind"
        jobLinker -> abstractAPI  "Request to AbstractAPPI"
        
        # Enlace de  user con mobileApp y webAplication
        postulante -> mobileApp "use"
        empresa -> mobileApp "use"
        anonymusPostulante  -> mobileApp "use"
        # Enlace de mobileApp y webAplication con AppiGetwei
        mobileApp -> apiGateway "Endpoint call"
        # Enlace de AppiGetwei con Bounded Contex
        apiGateway -> PerfilUsuarioBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> dashBoardBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> ofertaEmpleoBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> busquedaEmpleoBC "Endpoint call" "JSON / HTTPS" 
        apiGateway -> recomendacionesEmpleoBC "Endpoint call" "JSON / HTTPS" 
        apiGateway -> comunicacionBC "Endpoint call" "JSON / HTTPS" 
        apiGateway -> consejosBC "Endpoint call" "JSON / HTTPS"
        apiGateway -> contratacionBC "Endpoint call" "JSON / HTTPS"
        # Enlace de Bounded Contex con database
        PerfilUsuarioBC -> databaseApp "Store, get, update and delete record" "JDBC"
        dashBoardBC -> databaseApp "Store, get, update and delete record" "JDBC"
        ofertaEmpleoBC -> dashBoardBC "Connect"
        ofertaEmpleoBC -> contratacionBC "Connect"
        contratacionBC -> dashBoardBC "Connect"
        PerfilUsuarioBC -> busquedaEmpleoBC "Connect"
        busquedaEmpleoBC -> recomendacionesEmpleoBC "Connect"
        busquedaEmpleoBC -> consejosBC "Connect"
        PerfilUsuarioBC -> comunicacionBC "Connect"
        PerfilUsuarioBC -> recomendacionesEmpleoBC "Connect"
        PerfilUsuarioBC -> consejosBC "Connect"
        ofertaEmpleoBC -> databaseApp "Store, get, update and delete record" "JDBC"
        busquedaEmpleoBC -> databaseApp "Store, get, update and delete record" "JDBC"
        recomendacionesEmpleoBC -> databaseApp "Store, get, update and delete record" "JDBC"
        comunicacionBC -> databaseApp "Store, get, update and delete record" "JDBC"
        consejosBC -> databaseApp "Store, get, update and delete record" "JDBC"
        contratacionBC -> databaseApp "Store, get, update and delete record" "JDBC"
        # Enlace de bounded Contex con appi external
        PerfilUsuarioBC -> googleApi "Endpoint call" "JSON / HTTPS"
        PerfilUsuarioBC -> linkeddinApi "Endpoint call" "JSON / HTTPS"
        PerfilUsuarioBC -> abstractAPI "Endpoint call" "JSON / HTTPS"
        
        /* Relation Ship PerfilUsuario BC */
        apiGateway -> PerfilUsuarioBCController "Endpoint Request - PerfilUsuario"
        PerfilUsuarioBCController -> PerfilUsuarioQueryService
        PerfilUsuarioBCController -> PerfilUsuarioCommandService
        PerfilUsuarioQueryService -> PerfilusuarioQuery
        PerfilUsuarioCommandService -> PerfilUsuarioCommand
        PerfilUsuarioQueryService -> PerfilUsuarioRepository
        PerfilUsuarioCommandService -> PerfilUsuarioRepository
        PerfilUsuarioRepository -> PerfilUsuarioEntity
        PerfilUsuarioCommandService -> PerfilUsuarioEntity
        PerfilUsuarioQueryService -> PerfilUsuarioEntity
        PerfilUsuarioBCController -> googleApi
        PerfilUsuarioBCController -> linkeddinApi
        
        apiGateway -> EditarBCController "Endpoint Request - Editar"
        EditarBCController -> EditarQueryservice
        EditarBCController -> EditarCommandService
        EditarQueryService -> EditarQuery
        EditarCommandService -> EditarCommand
        EditarQueryService -> EditarRepository
        EditarCommandService -> EditarRepository
        EditarQueryService -> EditarEntity
        EditarCommandService -> EditarEntity
        EditarRepository -> EditarEntity
        EditarBCController -> abstractAPI
        
        EditarCommandService -> DocumentoRepository
        DocumentoRepository -> DocumentoEntity
        
        EditarCommandService -> ImagenRepository
        ImagenRepository -> ImagenEntity
        
        EditarQueryService -> MencionRepository
        MencionRepository -> MencionEntity
        
        DocumentoRepository -> databaseApp
        ImagenRepository -> databaseApp
        MencionRepository -> databaseApp
        EditarRepository -> databaseApp
        PerfilUsuarioRepository -> databaseApp
        
        /* Relation Ship dashboard BC */
        apiGateway -> PerfilEmpleadoBCController
        apiGateway -> BusquedaBCController
        apiGateway -> PerfilEmpresaBCController
        PerfilEmpleadoBCController -> PerfilEmpleadoQueryService
        PerfilEmpleadoBCController -> PerfilEmpleadoCommandService
        PerfilEmpleadoQueryService -> PerfilEmpleadoQuery
        PerfilEmpleadoCommandService -> PerfilEmpleadoCommand
        PerfilEmpleadoQueryService -> PerfilEmpleadoRepository
        PerfilEmpleadoCommandService -> PerfilEmpleadoRepository
        PerfilEmpleadoCommandService -> PerfilEmpleadoEntity
        PerfilEmpleadoQueryService -> PerfilEmpleadoEntity
        PerfilEmpleadoRepository -> PerfilEmpleadoEntity
        
        BusquedaBCController -> BusquedaQueryService
        BusquedaBCController -> BusquedaCommandService
        BusquedaQueryService -> BusquedaQuery
        BusquedaCommandService -> BusquedaCommand
        BusquedaQueryService -> BusquedaRepository
        BusquedaCommandService -> BusquedaRepository
        BusquedaQueryService -> BusquedaEntity
        BusquedaCommandService -> BusquedaEntity
        BusquedaRepository -> BusquedaEntity
        
        PerfilEmpresaBCController -> PerfilEmpresaQueryService
        PerfilEmpresaBCController -> PerfilEmpresaCommandService
        PerfilEmpresaQueryService -> PerfilEmpresaQuery
        PerfilEmpresaCommandService -> PerfilEmpresaCommand
        PerfilEmpresaQueryService -> PerfilEmpresaRepository
        PerfilEmpresaCommandService -> PerfilEmpresaRepository
        PerfilEmpresaQueryService -> PerfilEmpresaEntity
        PerfilEmpresaCommandService -> PerfilEmpresaEntity
        PerfilEmpresaRepository -> PerfilEmpresaEntity
        
        PerfilEmpleadoBCController -> linkeddinApi
        PerfilEmpresaBCController -> linkeddinApi
        PerfilEmpleadoQueryService -> EstadoPostulacionRepository
        EstadoPostulacionRepository -> EstadoPostulacionEntity
        
        PerfilEmpleadoRepository -> databaseApp
        BusquedaRepository -> databaseApp
        PerfilEmpresaRepository -> databaseApp
        EstadoPostulacionRepository -> databaseApp
        
        /* Relation Ship ofertas BC */
        apiGateway -> PerfilContratadorBCController
        apiGateway -> EmpleoBCController
        apiGateway -> OfertaBCController
        
        PerfilContratadorBCController -> PerfilContratadorQueryService
        PerfilContratadorBCController -> PerfilContratadorCommandService
        PerfilContratadorCommandService -> PerfilContratadorCommand
        PerfilContratadorQueryService -> PerfilContratadorQuery
         PerfilContratadorCommandService -> PerfilContratadorRepository
        PerfilContratadorQueryService -> PerfilContratadorRepository
        PerfilContratadorCommandService -> PerfilContratadorEntity
        PerfilContratadorQueryService -> PerfilContratadorEntity
        PerfilContratadorRepository -> PerfilContratadorEntity
        
        EmpleoBCController -> EmpleoQueryService
        EmpleoBCController -> EmpleoCommandService
        EmpleoCommandService -> EmpleoCommand
        EmpleoQueryService -> EmpleoQuery
        EmpleoCommandService -> EmpleoRepository
        EmpleoQueryService -> EmpleoRepository
        EmpleoCommandService -> EmpleoEntity
        EmpleoQueryService -> EmpleoEntity
        EmpleoRepository -> EmpleoEntity
        
        OfertaBCController -> OfertaQueryService
        OfertaBCController -> OfertaCommandService
        OfertaQueryService -> OfertaQuery
        OfertaCommandService -> OfertaCommand
        OfertaQueryService -> OfertaRepository
        OfertaCommandService -> OfertaRepository
        OfertaQueryService -> OfertaEntity
        OfertaCommandService -> OfertaEntity
        OfertaRepository -> OfertaEntity
        
        OfertaCommandService -> DocumentRepository
        DocumentRepository -> DocumentEntity
        
        DocumentRepository -> databaseApp
        OfertaRepository -> databaseApp
        EmpleoRepository -> databaseApp
        PerfilContratadorRepository -> databaseApp
        PerfilContratadorBCController -> abstractApi
        OfertaBCController -> linkeddinApi
        
        /* Relation Ship busqueda BC */
        apiGateway -> UsuarioBCController
        apiGateway -> ResultadoBCController
        apiGateway -> BuscarBCController
        
        UsuarioBCController -> UsuarioQueryService
        UsuarioBCController -> UsuarioCommandService
        UsuarioQueryService -> UsuarioQuery
        UsuarioCommandService -> UsuarioCommand
        UsuarioQueryService -> UsuarioRepository
        UsuarioCommandService -> UsuarioRepository
        UsuarioQueryService -> UsuarioEntity
        UsuarioCommandService -> UsuarioEntity
        UsuarioRepository -> UsuarioEntity
        
        ResultadoBCController -> ResultadoQueryService
        ResultadoBCController -> ResultadoCommandService
        ResultadoQueryService -> ResultadoQuery
        ResultadoCommandService -> ResultadoCommand
        ResultadoQueryService -> ResultadoRepository
        ResultadoCommandService -> ResultadoRepository
        ResultadoQueryService -> ResultadoEntity
        ResultadoCommandService -> ResultadoEntity
        ResultadoRepository -> ResultadoEntity
        
        BuscarBCController -> BuscarQueryService
        BuscarBCController -> BuscarCommandService
        BuscarQueryService -> BuscarQuery
        BuscarCommandService -> BuscarCommand
        BuscarQueryService -> BuscarRepository
        BuscarCommandService -> BuscarRepository
        BuscarQueryService -> BuscarEntity
        BuscarCommandService -> BuscarEntity
        BuscarRepository -> BuscarEntity
        
        BuscarQueryService -> GuardadoRepository
        GuardadoRepository -> GuardadoEntity 
        
        UsuarioRepository -> databaseApp
        ResultadoRepository -> databaseApp
        BuscarRepository -> databaseApp
        GuardadoRepository -> databaseApp
        
        /* Relation Ship recomendaciones BC */
        apiGateway -> SearchBCController
        apiGateway -> UserBCController
        
        UserBCController -> UserQueryService
        UserBCController -> UserCommandService
        UserQueryService -> UserQuery
        UserCommandService -> UserCommand
        UserQueryService -> UserRepository
        UserCommandService -> UserRepository
        UserQueryService -> UserEntity
        UserCommandService -> UserEntity
        UserRepository -> UserEntity
        
        SearchBCController -> SearchQueryService
        SearchBCController -> SearchCommandService
        SearchQueryService -> SearchQuery
        SearchCommandService -> SearchCommand
        SearchQueryService -> SearchRepository
        SearchCommandService -> SearchRepository
        SearchQueryService -> SearchEntity
        SearchCommandService -> SearchEntity
        SearchRepository -> SearchEntity
        
        SearchQueryService -> FiltroRepository
        FiltroRepository -> FiltroEntity
        
        UserRepository -> databaseApp
        SearchRepository -> databaseApp
        FiltroRepository -> databaseApp
        
        /* Relation Ship comunicacion BC */
        apiGateway -> PostulanteBCController
        apiGateway -> EmpresasBCController
        apiGateway -> MetodoBCController
        
        PostulanteBCController -> PostulanteQueryService
        PostulanteBCController -> PostulanteCommandService
        PostulanteQueryService -> PostulanteQuery
        PostulanteQueryService -> PostulanteRepository
        PostulanteQueryService -> PostulanteEntity
        PostulanteCommandService -> PostulanteCommand
        PostulanteCommandService -> PostulanteRepository
        PostulanteCommandService -> PostulanteEntity
        PostulanteRepository -> PostulanteEntity
        
        EmpresasBCController -> EmpresasQueryService
        EmpresasBCController -> EmpresasCommandService
        EmpresasQueryService -> EmpresasQuery
        EmpresasQueryService -> EmpresasRepository
        EmpresasQueryService -> EmpresasEntity
        EmpresasCommandService -> EmpresasCommand
        EmpresasCommandService -> EmpresasRepository
        EmpresasCommandService -> EmpresasEntity
        EmpresasRepository -> EmpresasEntity
        
        MetodoBCController -> MetodoQueryService
        MetodoBCController -> MetodoCommandService
        MetodoQueryService -> MetodoQuery
        MetodoQueryService -> MetodoRepository
        MetodoQueryService -> MetodoEntity
        MetodoCommandService -> MetodoCommand
        MetodoCommandService -> MetodoRepository
        MetodoCommandService -> MetodoEntity
        MetodoRepository -> MetodoEntity
        
        MetodoBCController -> googleApi
        EmpresasBCController -> abstractApi
        PostulanteBCController -> abstractApi
        MetodoCommandService -> ChatRepository
        MetodoCommandService -> LlamadaRepository
        
        ChatRepository -> ChatEntity
        LlamadaRepository -> LlamadaEntity
        
        EmpresasRepository -> databaseApp
        PostulanteRepository -> databaseApp
        MetodoRepository -> databaseApp
        ChatRepository -> databaseApp
        LlamadaRepository -> databaseApp
        
         /* Relation Ship consejos BC */
        apiGateway -> ConsultadorBCController 
        apiGateway -> TipsBCController
        
        ConsultadorBCController -> ConsultadorQueryService
        ConsultadorBCController -> ConsultadorCommandService
        ConsultadorQueryService -> ConsultadorQuery
        ConsultadorQueryService -> ConsultadorRepository
        ConsultadorQueryService -> ConsultadorEntity
        ConsultadorCommandService -> ConsultadorCommand
        ConsultadorCommandService -> ConsultadorRepository
        ConsultadorCommandService -> ConsultadorEntity
        ConsultadorRepository -> ConsultadorEntity
        
        TipsBCController -> TipsQueryService
        TipsBCController -> TipsCommandService
        TipsQueryService -> TipsQuery
        TipsQueryService -> TipsRepository
        TipsQueryService -> TipsEntity
        TipsCommandService -> TipsCommand
        TipsCommandService -> TipsRepository
        TipsCommandService -> TipsEntity
        TipsRepository -> TipsEntity
        
        TipsQueryService -> BuscarAyudaRepository
        TipsQueryService -> AyudaExternaRepository
        BuscarAyudaRepository -> BuscarAyudaEntity
        AyudaExternaRepository -> AyudaExternaEntity
        
        ConsultadorRepository -> databaseApp
        TipsRepository -> databaseApp
        BuscarAyudaRepository -> databaseApp
        AyudaExternaRepository -> databaseApp
        
        /* Relation Ship contratacion BC */
        apiGateway -> ContratadorBCController 
        apiGateway -> ModalidadBCController
        apiGateway -> InternoBCController
        apiGateway -> TrabajoBCController
        apiGateway -> ReclutamientoBCController
        
        ContratadorBCController -> ContratadorQueryService
        ContratadorBCController -> ContratadorCommandService
        ContratadorQueryService -> ContratadorQuery
        ContratadorQueryService -> ContratadorRepository
        ContratadorQueryService -> ContratadorEntity
        ContratadorCommandService -> ContratadorCommand
        ContratadorCommandService -> ContratadorRepository
        ContratadorCommandService -> ContratadorEntity
        ContratadorRepository -> ContratadorEntity

        ModalidadBCController -> ModalidadTrabajoQueryService
        ModalidadBCController -> ModalidadTrabajoCommandService
        ModalidadTrabajoQueryService -> ModalidadTrabajoQuery
        ModalidadTrabajoQueryService -> ModalidadTrabajoRepository
        ModalidadTrabajoQueryService -> ModalidadTrabajoEntity
        ModalidadTrabajoCommandService -> ModalidadTrabajoCommand
        ModalidadTrabajoCommandService -> ModalidadTrabajoRepository
        ModalidadTrabajoCommandService -> ModalidadTrabajoEntity
        ModalidadTrabajoRepository -> ModalidadTrabajoEntity
        ModalidadBCController -> googleApi

        InternoBCController -> InternoQueryService
        InternoBCController -> InternoCommandService
        InternoQueryService -> InternoQuery
        InternoQueryService -> InternoRepository
        InternoQueryService -> InternoEntity
        InternoCommandService -> InternoCommand
        InternoCommandService -> InternoRepository
        InternoCommandService -> InternoEntity
        InternoRepository -> InternoEntity

        ReclutamientoBCController -> ReclutamientoQueryService
        ReclutamientoBCController -> ReclutamientoCommandService
        ReclutamientoQueryService -> ReclutamientoQuery
        ReclutamientoQueryService -> ReclutamientoRepository
        ReclutamientoQueryService -> ReclutamientoEntity
        ReclutamientoCommandService -> ReclutamientoCommand
        ReclutamientoCommandService -> ReclutamientoRepository
        ReclutamientoCommandService -> ReclutamientoEntity
        ReclutamientoRepository -> ReclutamientoEntity

        TrabajoBCController -> TrabajoQueryService
        TrabajoBCController -> TrabajoCommandService
        TrabajoQueryService -> TrabajoQuery
        TrabajoQueryService -> TrabajoRepository
        TrabajoQueryService -> TrabajoEntity
        TrabajoCommandService -> TrabajoCommand
        TrabajoCommandService -> TrabajoRepository
        TrabajoCommandService -> TrabajoEntity
        TrabajoRepository -> TrabajoEntity
        
        ReclutamientoBCController -> linkeddinApi
        InternoBCController -> linkeddinApi
        
        ModalidadTrabajoQueryService -> PresencialRepository
        ModalidadTrabajoQueryService -> VirtualRepository
        ModalidadTrabajoQueryService -> HibridoRepository
        
        PresencialRepository -> PresencialEntity
        VirtualRepository -> VirtualEntity
        HibridoRepository -> HibridoEntity
        
        ContratadorRepository -> databaseApp
        ModalidadTrabajoRepository -> databaseApp
        InternoRepository -> databaseApp
        ReclutamientoRepository -> databaseApp
        TrabajoRepository -> databaseApp
        PresencialRepository -> databaseApp
        VirtualRepository -> databaseApp
        HibridoRepository -> databaseApp
    }
    
   views {
        systemContext jobLinker {
            include *
            autolayout 
        }
        container jobLinker "container_jobLinker" {
            include *
            autoLayout 
        }
        component perfilUsuarioBC "PerfilUsuarioBoundedContext"{
            include *
            autoLayout
        }
        component ofertaEmpleoBC "ofertaEmpleoBoundedContext"{
            include *
            autoLayout
        }
        component busquedaEmpleoBC "BusquedaEmpleoBoundedContext"{
            include *
            autoLayout
        }
        component dashboardBC "DashboardBoundedContext"{
            include *
            autoLayout
        }
        component recomendacionesEmpleoBC "RecomendacionesBoundedContext"{
            include *
            autoLayout
        }
        component comunicacionBC "ComunicacionBoundedContext"{
            include *
            autoLayout
        }
        component consejosBC "ConsejosBoundedContext"{
            include *
            autoLayout
        }
        component contratacionBC "ContratacionBoundedContext"{
            include *
            autoLayout
        }
        styles {
            element "Person" {
                color #ffffff
                background #000000
                fontSize 18
                shape Person
            }
            element "JobLinker-App" {
                color #ffffff
                background #A18DDD
                fontSize 22
                shape RoundedBox
            }
            element "Google-APPI" {
                color #ffffff
                background #19FA59
                fontSize 22
                shape RoundedBox
            }
            element "Linkeddin-APPI" {
                color #ffffff
                background #3343FA
                fontSize 22
                shape RoundedBox
            }
            element "AbstractAPPI" {
                color #ffffff
                background #FFAE39
                fontSize 22
                shape RoundedBox
            }
             element "MobileApp" {
                background #4C6EF6
                color #FFFFFF
                shape MobileDevicePortrait
            }
              element "WebApp" {
                background #4C6EF6
                color #FFFFFF
                shape webBrowser
            }
             element "Container" {
                background #B333F5
                color #FFFFFF
                shape Hexagon
            }
            element "databaseApp"{
                 background #F2E2D7
                color #000000
                shape Cylinder
            }
            element "ofertaEmpleoBCController"{
                 background #B333F5
                color #FFFFFF
                shape RoundedBox
            }
            element "Component" {
                background #05FA9A
                color #000000
                shape Component
            }
            element "Repository" {
                shape Diamond
                background #F0EB0A
            }
            element "Command" {
                shape Circle
                background #C22777
                color #000000
            }
            element "Query" {
                shape Ellipse
                background #42B8C2
                color #FFFFFF
            }
            element "Entity" {
                shape Box
                background #7D08BC
                color #FFFFFF
            }
            element "BCController"{
                shape Box
                background #2596be
                color #FFFFFF
            }
            element "comando1"{
                shape Diamond
                background #D8D614
                color #000000
            }
            element "comando2"{
                shape Circle
                background #F739B6
                color #000000
            }
            element "comando3"{
                shape Ellipse
                background #49A8D2
                color #000000
            }
        }
    }

    configuration {
        scope softwaresystem
    }

}
