# R5
- v1.0.0
- Video probando su funcionalidad: (https://youtu.be/88cUPLk_34E)
- Video socializando Infra: (https://youtu.be/-Ayk6cbX5w8)


Esta aplicacion esta Modularizada, en el Modulo
GlobalModule, estan.
 - init
 - home
 - task
 - AuthModule

Tiene un bloc llamado BlocTask, donde por ejemplo hay eventos como:
- ChangeDateEvent: Sirve para cambiar la fecha.
- SaveTaskEvent: Hace la logica de enviar la task a Firestore.
- EditTaskEvent: Hace la logica de editar la task a Firestore.

Vistas:
- Login:
  Es la vista que se muestra al iniciar, para autenticarse.
- Register:
  Es la vista que se muestra para registrarse.
- Home:
  Es la vista que muestra la lista de tareas, agregar tareas y para cerrar sesion.
- Task:
  Para agregar y editar tareas.

Adicionalmente, le dejo algunas caracteristicas implementadas:

- Manejador de estado: BLOC.
- Modular.
- Singleton.
- Widget definicion.
