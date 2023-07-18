	
let regCliente=async()=>{
const inputFile = document.getElementById("file-input");
let doc=document.getElementById("doc").value;
let id=document.getElementById("id").value;
let nombres=document.getElementById("nombres").value;
let apellidos=document.getElementById("apellidos").value;
let telefono=document.getElementById("telefono").value;
let correo=document.getElementById("correo").value;
let password=document.getElementById("password").value;
let direccion=document.getElementById("direccion").value;
let rol=document.getElementById("rol").value;
let foto = inputFile.files[0];

if (doc === '' || id === ''|| nombres === '' || apellidos === '' || telefono === '' || correo === '' || password === '' || direccion === '' || rol === '') {
  Swal.fire(
    '',
    'Por favor, completa todos los campos',
    'warning'
  );
  return; // 
}
const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()]).{8,}$/;
    if (!passwordRegex.test(password)) {
      Swal.fire("", "La contraseña debe tener al menos 8 caracteres y debe contener como mínimo una letra mayúscula, una letra minúscula, un número y un carácter especial.", "warning");
      return;
    }
let datos=new FormData();
datos.append("doc", doc);
datos.append("id", id);
datos.append("nombres", nombres);
datos.append("apellidos", apellidos);
datos.append("telefono", telefono);
datos.append("correo", correo);
datos.append("password", password);
datos.append("direccion", direccion);
datos.append("rol", rol);
datos.append("foto", foto);


try {
    let respuesta = await fetch("?controller=funcionarios&action=registrar", {
      method: "POST",
      body: datos,
    });

    let info = await respuesta.json();

    Swal.fire("", info.mensaje, "success");
  } catch (error) {
    Swal.fire("", "Error al registrar los datos", "error");
    console.log(error);
  }}
  function showPasswordRequirements() {
    const requirements = "La contraseña debe tener al menos 8 caracteres y debe contener como mínimo una letra mayúscula, una letra minúscula, un número y un carácter especial.";
    const passwordRequirementsElement = document.getElementById("password-requirements");
    passwordRequirementsElement.textContent = requirements;
}
function hidePasswordRequirements() {
  const passwordRequirementsElement = document.getElementById("password-requirements");
  passwordRequirementsElement.textContent = "";
}
  let regApre=async()=>{
    let id=document.getElementById("id").value;
    let ficha=document.getElementById("ficha").value;
    let nombres=document.getElementById("nombres").value;
    let apellidos=document.getElementById("apellidos").value;
    let telefono=document.getElementById("telefono").value;
    let correo=document.getElementById("correo").value;
    let sexo=document.getElementById("sexo").value;
    let rol=document.getElementById("rol").value;
    
    if (id === ''|| nombres === '' || apellidos === '' || telefono === '' || correo === '' || sexo === '' || rol === '') {
      Swal.fire(
        '',
        'Por favor, completa todos los campos obligatorios',
        'warning'
      );
      return; // 
    }
    let datos=new FormData();
    datos.append("id", id);
    datos.append("ficha", ficha);
    datos.append("nombres", nombres);
    datos.append("apellidos", apellidos);
    datos.append("telefono", telefono);
    datos.append("correo", correo);
    datos.append("sexo", sexo);
    datos.append("rol", rol);
    
    try {
      let respuesta = await fetch("?controller=aprendices&action=registrar", {
          method: "POST",
          body: datos,
      });

      let info = await respuesta.json();

      if (info.estado === 1) {
          Swal.fire("", info.mensaje, "success");
          document.getElementById("id").value="";
          document.getElementById("nombres").value="";
          document.getElementById("apellidos").value="";
          document.getElementById("telefono").value="";
          document.getElementById("correo").value="";
      } else if (info.estado === 2) {
          Swal.fire("", info.mensaje, "error");
      }else if (info.estado===3){
        Swal.fire("", info.mensaje, "error");
      }
  } catch (error) {
      Swal.fire("", "Error al registrar los datos", "error");
      console.log(error);
  }
    }


      
let regPrograma = async () => {
  let codigo = document.getElementById("codigo").value;
  let descripcion = document.getElementById("descripcion").value;

  if (codigo === '' || descripcion === '') {
    Swal.fire(
      '',
      'Por favor, completa todos los campos',
      'warning'
    );
    return; // 
  }

  let datos = new FormData();
  datos.append("codigo", codigo);
  datos.append("descripcion", descripcion);

  let respuesta = await fetch("?controller=main&action=registrar", {
    method: "POST",
    body: datos
  });

  let info = await respuesta.json();
  Swal.fire(
    '',
    info.mensaje,
    'success'
  );
  document.getElementById("codigo").value = '';
  document.getElementById("descripcion").value = '';
}

let regFichas = async () => {
  try {
    let ficha = document.getElementById("ficha").value;
    let desc = document.getElementById("desc").value;
    let cod_prog = document.getElementById("cod_prog").value;
    let fech_inic = document.getElementById("fech_inic").value;
    let fech_fin = document.getElementById("fech_fin").value;
    let instructores = document.getElementById("instructores").value;

    let datos = new FormData();
    datos.append("ficha", ficha);
    datos.append("desc", desc);
    datos.append("cod_prog", cod_prog);
    datos.append("fech_inic", fech_inic);
    datos.append("fech_fin", fech_fin);
    datos.append("instructores", instructores);

    let respuesta = await fetch("?controller=programas&action=registrar", {
      method: "POST",
      body: datos,
    });

    let info = await respuesta.json();

    Swal.fire("", info.mensaje, "success");
    document.getElementById("ficha").value = "";
    document.getElementById("desc").value = "";
    document.getElementById("cod_prog").value = "";
    document.getElementById("fech_inic").value = "";
    document.getElementById("fech_fin").value = "";
    document.getElementById("instructores").value = "";
  } catch (error) {
    Swal.fire("", "Error al registrar los datos", "error");
    console.log(error);
  }
};


let editarFuncionario = async (datos) => {
  try {
    let respuesta = await fetch("?controller=funcionarios&action=edit", {
      method: "POST",
      body: datos,
    });

    let info = await respuesta.json();
    if (info.estado === 1) {
      Swal.fire("", info.mensaje, "success");
    } else {
      Swal.fire("", info.mensaje, "error");
    }
  } catch (error) {
    console.error(error);
    Swal.fire("", "Ocurrió un error al editar los datos", "error");
  }
};

let edtFuncionario = async () => {
  const inputFile = document.getElementById("file-input");
  let doc = document.getElementById("doc").value;
  let id = document.getElementById("id").value;
  let nombres = document.getElementById("nombres").value;
  let apellidos = document.getElementById("apellidos").value;
  let telefono = document.getElementById("telefono").value;
  let correo = document.getElementById("correo").value;
  let direccion = document.getElementById("direccion").value;
  let rol = document.getElementById("rol").value;
  let foto = inputFile.files[0];

  if (
    doc === "" ||
    id === "" ||
    nombres === "" ||
    apellidos === "" ||
    telefono === "" ||
    correo === "" ||
    direccion === "" ||
    rol === ""
  ) {
    Swal.fire("", "Por favor, completa todos los campos", "warning");
    return;
  }

  let datos = new FormData();
  datos.append("doc", doc);
  datos.append("id", id);
  datos.append("nombres", nombres);
  datos.append("apellidos", apellidos);
  datos.append("telefono", telefono);
  datos.append("correo", correo);
  datos.append("direccion", direccion);
  datos.append("rol", rol);
  if (foto) {
    datos.append("foto", foto);
  }

  editarFuncionario(datos);
};

let login = async () => {
  try {
    let doc = document.getElementById("doc").value;
    let id = document.getElementById("id").value;
    let password = document.getElementById("password").value;
    let datos = new FormData();
    datos.append("doc", doc);
    datos.append("id", id);
    datos.append("password", password);
  
    let respuesta = await fetch("?controller=funcionarios&action=validar", {
      method: "POST",
      body: datos
    });
  
    // Verificar si la respuesta es válida antes de analizarla como JSON
    if (!respuesta.ok) {
      throw new Error("Error en la solicitud: " + respuesta.status);
    }
  
    let info = await respuesta.json();
  
    if (info.estado == 1) {
      window.location.href = info.url;
    } else {
      Swal.fire("", info.mensaje, 'error');
    }
  } catch (error) {
    console.error("Ocurrió un error al realizar la solicitud:", error);
    // Aquí puedes agregar código para manejar el error, como mostrar un mensaje al usuario
  }
}



  let CambiarPass=async()=>{
    let passwordElement = document.getElementById("password");
    let NpasswordElement = document.getElementById("Npassword");
    let NCpasswordElement = document.getElementById("NCpassword");
    let password = passwordElement.value;
    let Npassword = NpasswordElement.value;
    let NCpassword = NCpasswordElement.value;
    let datos = new FormData();
    datos.append("password",password);
    datos.append("Npassword",Npassword);
    datos.append("NCpassword",NCpassword);
    if (
      Npassword === "" ||
      NCpassword === ""
    ) {
      Swal.fire("", "Por favor, completa todos los campos", "warning");
      return;
    }
    const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*()]).{8,}$/;
    if (!passwordRegex.test(Npassword)) {
      Swal.fire("", "La contraseña debe tener al menos 8 caracteres y debe contener como mínimo una letra mayúscula, una letra minúscula, un número y un carácter especial.", "warning");
      return;
    }

    if(Npassword == NCpassword){
        let respuesta=await fetch("?controller=funcionarios&action=CambiarPassword", {
          method: "POST",
          body: datos
      });
    let info = await respuesta.json();
    if(info.estado == 1){
      Swal.fire('',info.mensaje,'success')
      passwordElement.value="";
      NpasswordElement.value="";
      NCpasswordElement.value=""
    }else{
      Swal.fire('',info.mensaje,'error')
    }
}else{
    Swal.fire('','La nueva contraseña y la de confirmacion no coinciden','error')
  }
}

let buscar=async()=>{
  let id = document.getElementById("id").value;
  let datos=new FormData();
  datos.append("id",id);

  let respuesta = await fetch("?controller=Atencion&action=buscar",{
    method: "POST",
    body: datos
  })
  let info = await respuesta.json();
  if(info.estado == 2){
    document.getElementById("ok").disabled = true;
    document.getElementById("nombres").value ="";
    document.getElementById("apellidos").value ="" ;
    document.getElementById("correo").value  ="";
    Swal.fire('','No hay aprendices con este ID','error')

  }else{
       document.getElementById("nombres").value = info.mensaje["Apre_Nom"];
       document.getElementById("apellidos").value = info.mensaje["Apre_Ape"];
       document.getElementById("correo").value = info.mensaje["Apre_Correo"];
       document.getElementById("ok").disabled = false;

  }
}

let deletePhoto = async (id) => {
  Swal.fire({
    title: '¿Seguro que deseas eliminar la foto?',
    text: "No podrás revertir esta acción.",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    cancelButtonText: 'Cancelar',
    confirmButtonText: 'Sí, eliminar'
  }).then((result) => {
    if (result.isConfirmed) {
      // Enviar solicitud para eliminar la foto
      let datos = new FormData();
      datos.append("id", id);
      datos.append("eliminar_foto", "1");

      // Actualizar la foto en la vista
      let imagenPorDefecto = "public/img/profile_photo_default.png";
      document.getElementById("img-profile").src = imagenPorDefecto;
    }
  });
}


let Eliminar1 =async(id) =>{
  Swal.fire({
    title: 'Seguro que deseas eliminar la información?',
    text: "No se podrá revertir la acción!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    cancelButtonText: 'Cancelar',
    confirmButtonText: 'Si, Eliminar!'
  }).then((result) => {
    if (result.isConfirmed) {
      window.location.href = "?controller=funcionarios&action=index";
          peticionEliminar(id);
    }
  })
}

let peticionEliminar = async(id) =>{
  let datos = new FormData();
  datos.append("id",id)
  let respuesta = await fetch("?controller=funcionarios&action=delete",{
    method: "POST",
    body: datos
  });
  let info = await respuesta.json();
  window.location.href = "?controller=funcionarios&action=index";
}



let buscar2 = async () => {
  let id = document.getElementById("id").value;
  let datos = new FormData();
  datos.append("id", id);

  let respuesta = await fetch("?controller=observaciones&action=buscar", {
    method: "POST",
    body: datos,
  });
  let info = await respuesta.json();
  if (info.estado == 2) {
    document.getElementById("nombres").value = "";
    document.getElementById("apellidos").value = "";
    document.getElementById("correo").value = "";
    document.getElementById("telefono").value = "";
    Swal.fire("", "No hay aprendices con este ID", "error");
  } else {
    document.getElementById("nombres").value = info.mensaje["Apre_Nom"];
    document.getElementById("apellidos").value = info.mensaje["Apre_Ape"];
    document.getElementById("correo").value = info.mensaje["Apre_Correo"];
    document.getElementById("telefono").value = info.mensaje["Apre_Tel"];
    document.getElementById("sexo").value=info.mensaje["Apre_Sexo"];

    let fichas = info.mensaje.fichas; // Obtener las fichas del aprendiz
    // Limpiar opciones existentes antes de agregar las nuevas
    let selectFichas = document.getElementById("fichas");
    selectFichas.innerHTML = "";
    
    // Generar opciones para cada ficha
    for (let i = 0; i < fichas.length; i++) {
      let option = document.createElement("option");
      option.value = fichas[i];
      option.text = fichas[i];
      selectFichas.appendChild(option);
    }
    
  }
};



let generarActas=async()=>{
  let fechaActa = document.getElementById("Bit_Fecha").value;
  let idAprendiz = document.getElementById("id").value;
  let nomAprendiz = document.getElementById("nombres").value;
  let apeAprendiz = document.getElementById("apellidos").value;
  let telAprendiz = document.getElementById("telefono").value;
  let corAprendiz = document.getElementById("correo").value;
  let fichaAprendiz = document.getElementById("fichas").value;
  let motRemision = document.getElementById("motivoRemision").value;
  let descargoApre = document.getElementById("descargoApre").value;
  let compromiso = document.getElementById("compromisos").value;
  let recomendaciones = document.getElementById("recomendaciones").value;
  if (fechaActa === '' || idAprendiz === ''|| nomAprendiz === '' || apeAprendiz === '' || telAprendiz === '' || corAprendiz === '' || motRemision === '' || compromiso === '' || recomendaciones === '' || fichaAprendiz==='' || descargoApre==='') {
    Swal.fire(
      '',
      'Por favor, completa todos los campos',
      'warning'
    );
    return; // 
  }
  if(motRemision === 'Otro'){
    let otro = document.getElementById("otroMotivoRemision").value;
    motRemision = otro;
  }
  let datos=new FormData();
  datos.append("fechaActa", fechaActa);
  datos.append("idAprendiz", idAprendiz);
  datos.append("nomAprendiz", nomAprendiz);
  datos.append("apeAprendiz", apeAprendiz);
  datos.append("telAprendiz", telAprendiz);
  datos.append("corAprendiz", corAprendiz);
  datos.append("fichaAprendiz", fichaAprendiz);
  datos.append("descargoApre", descargoApre);
  datos.append("motRemision", motRemision);
  datos.append("compromiso", compromiso);
  datos.append("recomendaciones", recomendaciones);
  try {
    let respuesta = await fetch("?controller=actas&action=registrar", {
      method: "POST",
      body: datos,
    });

    let info = await respuesta.json();

    Swal.fire("", info.mensaje, "success");
    document.getElementById("id").value = "";
    document.getElementById("nombres").value = "";
    document.getElementById("apellidos").value = "";
    document.getElementById("telefono").value = "";
    document.getElementById("correo").value = "";
    document.getElementById("fichas").value = "";
    document.getElementById("motivoRemision").value = "";
    document.getElementById("descargoApre").value = "";
    document.getElementById("compromisos").value = "";
    document.getElementById("recomendaciones").value = "";
  } catch (error) {
    Swal.fire("", "Error al registrar los datos", "error");
    console.log(error);
  }
}
let generarLlamadoDeAtencion=async()=>{
  let fechaLlamado = document.getElementById("fechaLlamado").value;
  let idAprendiz = document.getElementById("id").value;
  let nomAprendiz = document.getElementById("nombres").value;
  let apeAprendiz = document.getElementById("apellidos").value;
  let telAprendiz = document.getElementById("telefono").value;
  let corAprendiz = document.getElementById("correo").value;
  let fichaAprendiz = document.getElementById("fichas").value;
  let motRemision = document.getElementById("motivoRemision").value;
  let accionTomada = document.getElementById("accionTomada").value;
  if (fechaLlamado === '' || idAprendiz === ''|| nomAprendiz === '' || apeAprendiz === '' || telAprendiz === '' || corAprendiz === '' || motRemision === '' || accionTomada === '' || fichaAprendiz==='') {
    Swal.fire(
      '',
      'Por favor, completa todos los campos',
      'warning'
    );
    return; // 
  }
  if(motRemision === 'Otro'){
    let otro = document.getElementById("otroMotivoRemision").value;
    motRemision = otro;
  }
  if(accionTomada === 'Otro'){
    let otraAccion = document.getElementById("otroMotivoRemision").value;
    accionTomada = otraAccion;
  }
  let datos=new FormData();
  datos.append("fechaLlamado", fechaLlamado);
  datos.append("idAprendiz", idAprendiz);
  datos.append("nomAprendiz", nomAprendiz);
  datos.append("apeAprendiz", apeAprendiz);
  datos.append("telAprendiz", telAprendiz);
  datos.append("corAprendiz", corAprendiz);
  datos.append("fichaAprendiz", fichaAprendiz);
  datos.append("accionTomada", accionTomada);
  datos.append("motRemision", motRemision);
  try {
    let respuesta = await fetch("?controller=atencion&action=registrar", {
      method: "POST",
      body: datos,
    });

    let info = await respuesta.json();

    Swal.fire("", info.mensaje, "success");
    document.getElementById("id").value = "";
    document.getElementById("nombres").value = "";
    document.getElementById("apellidos").value = "";
    document.getElementById("telefono").value = "";
    document.getElementById("correo").value = "";
    document.getElementById("fichas").value = "";
    document.getElementById("motivoRemision").value = "";
    document.getElementById("accionTomada").value = "";
  } catch (error) {
    Swal.fire("", "Error al registrar los datos", "error");
    console.log(error);
  }
}
let regObservacion=async()=>{
  let fechaObservacion = document.getElementById("FechaObs").value;
  let idAprendiz = document.getElementById("id").value;
  let nomAprendiz = document.getElementById("nombres").value;
  let apeAprendiz = document.getElementById("apellidos").value;
  let fichaAprendiz = document.getElementById("fichas").value;
  let observacion = document.getElementById("observacion").value;
  let descripcion = document.getElementById("descripcion").value;
  if (fechaObservacion === '' || idAprendiz === ''|| nomAprendiz === '' || apeAprendiz === '' || observacion === '' || descripcion === '' || fichaAprendiz==='') {
    Swal.fire(
      '',
      'Por favor, completa todos los campos',
      'warning'
    );
    return; // 
  }
  let datos=new FormData();
  datos.append("fechaObservacion", fechaObservacion);
  datos.append("idAprendiz", idAprendiz);
  datos.append("nomAprendiz", nomAprendiz);
  datos.append("apeAprendiz", apeAprendiz);
  datos.append("fichaAprendiz", fichaAprendiz);
  datos.append("observacion", observacion);
  datos.append("descripcion", descripcion);
  try {
    let respuesta = await fetch("?controller=observaciones&action=registrar", {
      method: "POST",
      body: datos,
    });

    let info = await respuesta.json();

    Swal.fire("", info.mensaje, "success");
    document.getElementById("id").value = '';
    document.getElementById("nombres").value = '';
    document.getElementById("apellidos").value = '';
    document.getElementById("fichas").value = '';
    document.getElementById("observacion").value = '';
    document.getElementById("descripcion").value = '';
    
  } catch (error) {
    Swal.fire("", "Error al registrar los datos", "error");
    console.log(error);
  }
}
let eliminarObservacion =async(id) =>{
  Swal.fire({
    title: 'Seguro que deseas eliminar la información?',
    text: "No se podrá revertir la acción!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    cancelButtonText: 'Cancelar',
    confirmButtonText: 'Si, Eliminar!'
  }).then((result) => {
    if (result.isConfirmed) {
      window.location.href = "?controller=observaciones&action=index";
          eliminarObservacionConf(id);
    }
  })
}

let eliminarObservacionConf = async(id) =>{
  let datos = new FormData();
  datos.append("id",id)
  let respuesta = await fetch("?controller=observaciones&action=delete",{
    method: "POST",
    body: datos
  });
  let info = await respuesta.json();
  window.location.href = "?controller=observaciones&action=index";
}


let edtAprendiz = async () => {
  let id = document.getElementById("id").value;
  let nombres = document.getElementById("nombres").value;
  let apellidos = document.getElementById("apellidos").value;
  let telefono = document.getElementById("telefono").value;
  let correo = document.getElementById("correo").value;
  let sexo = document.getElementById("sexo").value;

  if (
    id === "" ||
    nombres === "" ||
    apellidos === "" ||
    telefono === "" ||
    correo === "" ||
    sexo === ""
  ) {
    Swal.fire("", "Por favor, completa todos los campos", "warning");
    return;
  }

  let datos = new FormData();
  datos.append("id", id);
  datos.append("nombres", nombres);
  datos.append("apellidos", apellidos);
  datos.append("telefono", telefono);
  datos.append("correo", correo);
  datos.append("sexo", sexo);

  try {
    let respuesta = await fetch("?controller=aprendices&action=edit", {
      method: "POST",
      body: datos,
    });

    let info = await respuesta.json();
    if (info.estado === 1) {
      Swal.fire("", info.mensaje, "success");
    } else {
      Swal.fire("", info.mensaje, "error");
    }
  } catch (error) {
    console.error(error);
    Swal.fire("", "Ocurrió un error al editar los datos", "error");
  }
};
let eliminarAprendiz = async (id) => {
  Swal.fire({
    title: 'Seguro que deseas eliminar la información?',
    text: "No se podrá revertir la acción!",
    icon: 'warning',
    showCancelButton: true,
    confirmButtonColor: '#3085d6',
    cancelButtonColor: '#d33',
    cancelButtonText: 'Cancelar',
    confirmButtonText: 'Si, Eliminar!'
  }).then((result) => {
    if (result.isConfirmed) {
      eliminarAprendizConf(id)
        .then(() => {
          window.location.href = "?controller=aprendices&action=index";
        })
        .catch((error) => {
          console.error(error);
        });
    }
  });
}

let eliminarAprendizConf = async (id) => {
  let datos = new FormData();
  datos.append("id", id);
  let respuesta = await fetch("?controller=aprendices&action=delete", {
    method: "POST",
    body: datos
  });
  let info = await respuesta.json();
  if (info.success) {
    return Promise.resolve();
  } else {
    return Promise.reject(new Error("Error en la eliminación del aprendiz"));
  }
}

let selectFiltros = async() =>{
  select = document.getElementById("filtro").value;
  input = document.getElementById("texto");
  switch (select) {
    case "Ficha de caracterización":
      input.setAttribute("type", "number");
      input.placeholder = "Dígite ficha de caracterización";
      break;
    case "ID de aprendiz":
      input.setAttribute("type", "number");
      input.placeholder = "Dígite ID del aprendiz";
      break;
    case "Fecha de creación":
      input.setAttribute("type", "date");
      break;
    case "":
      input.setAttribute("type", "hidden");
      break;
    default:
      break;
  }
}
let filtrar = () => {
  let select = document.getElementById("filtro").value;
  let input = document.getElementById("texto").value;
  
  // Realizar la petición AJAX al controlador
  fetch(`?controller=actas&action=filtros&filtro=${select}&texto=${input}`)
    .then(response => response.text())
    .then(data => {
      // Actualizar la tabla con los resultados obtenidos
      document.getElementById("dataTable").innerHTML = data;
    })
    .catch(error => console.error(error));
}
let mostrarInput = async() =>{
  select = document.getElementById("motivoRemision").value;
  input = document.getElementById("otroMotivoRemision");
  switch (select) {
    case "Otro":
      input.removeAttribute("hidden");
      break;
    default:
      input.setAttribute("hidden", "true");
      break;
  }
}

$(document).ready(function() {
  $('#dataTable').DataTable(
      {
      language: {
          url: "https://cdn.datatables.net/plug-ins/1.10.25/i18n/Spanish.json"
      },
      lengthMenu: [10, 15, 20, 25, 50]
  }
  );
});
function openModal(link) {
  var nombre = link.data('nombre');
  var ficha = link.data('ficha');
  var fecha = link.data('fecha');
  var titulo = link.data('titulo');
  var descripcion = link.data('descripcion');
  Swal.fire({
      title: 'Detalles de la observación',
      html: 'Cargando...',
      showCancelButton: false,
      showConfirmButton: false,
      allowOutsideClick: true,
      focusConfirm: false,
      customClass: {
          container: 'modal-container',
      },
      didOpen: () => {
          var modalContent = `
              <table class="table table-bordered">
                  <tr class="bg-gray-100 text-gray-900">
                      <td>Nombre completo:</td>
                  </tr>
                  <tr>
                      <td>${nombre}</td>
                  </tr>
                  <tr class="bg-gray-100 text-gray-900">
                      <td>Ficha del aprendiz:</td>
                  </tr>
                  <tr>
                      <td>${ficha}</td>
                  </tr>
                  <tr class="bg-gray-100 text-gray-900">
                      <td>Fecha de la observación:</td>
                  </tr>
                  <tr>
                      <td>${fecha}</td>
                  </tr>
                  <tr class="bg-gray-100 text-gray-900">
                      <td>Título de la observación:</td>
                  </tr>
                  <tr>
                      <td>${titulo}</td>
                  </tr>
                  <tr class="bg-gray-100 text-gray-900">
                      <td>Descripción de la observación:</td>
                  </tr>
                  <tr>
                      <td>${descripcion}</td>
                  </tr>
              </table>
          `;

          Swal.update({
              html: modalContent,
              showConfirmButton: true,
          });
      }
  });
}
$('.open-modal').on('click', function(e) {
  e.preventDefault();
  openModal($(this));
});