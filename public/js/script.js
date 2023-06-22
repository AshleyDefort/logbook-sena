
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

let regFichas=async()=>{
  let ficha = document.getElementById("ficha").value;
  let desc = document.getElementById("desc").value;
  let cod_prog = document.getElementById("cod_prog").value;
  let fech_inic = document.getElementById("fech_inic").value;
  let fech_fin = document.getElementById("fech_fin").value;


let datos = new FormData();
datos.append("ficha", ficha);
datos.append("desc", desc);
datos.append("cod_prog", cod_prog);
datos.append("fech_inic", fech_inic);
datos.append("fech_fin", fech_fin);

let respuesta=await fetch("?controller=programas&action=registrar", {
  method: "POST",
  body: datos
});

let info= await respuesta.json();
Swal.fire(
  '', 
  info.mensaje,
  'success'
  
)

}
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



let login=async()=>{
  let doc = document.getElementById("doc").value;
  let id = document.getElementById("id").value;
  let password = document.getElementById("password").value;
  let datos = new FormData();
  datos.append("doc",doc);
  datos.append("id",id);
  datos.append("password",password);

  let respuesta=await fetch("?controller=funcionarios&action=validar", {
    method: "POST",
    body: datos
});

let info = await respuesta.json();
if(info.estado == 1){
  window.location.href = info.url;

}else{
  Swal.fire('',info.mensaje,'error')
}
}

  let CambiarPass=async()=>{
    let password = document.getElementById("password").value;
    let Npassword = document.getElementById("Npassword").value;
    let NCpassword = document.getElementById("NCpassword").value;
    let datos = new FormData();
    datos.append("password",password);
    datos.append("Npassword",Npassword);
    datos.append("NCpassword",NCpassword);
    
  if(Npassword == NCpassword){
      let respuesta=await fetch("?controller=funcionarios&action=CambiarPassword", {
        method: "POST",
        body: datos
    });
    let info = await respuesta.json();
    if(info.estado == 1){
      Swal.fire('',info.mensaje,'succes')
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
    title: 'Seguro que deseas eliminar?',
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
    
  } catch (error) {
    Swal.fire("", "Error al registrar los datos", "error");
    console.log(error);
  }
}

// funciones sincronicas ó async son las que esperan a que una funcion termine de cargarse para ejecutarse