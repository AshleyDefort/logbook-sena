
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
console.log(foto);

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
if (foto) {
  datos.append("foto", foto);
}

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

let edtFuncionario=async()=>{
  let doc=document.getElementById("doc").value;
  let id=document.getElementById("id").value;
  let nombres=document.getElementById("nombres").value;
  let apellidos=document.getElementById("apellidos").value;
  let telefono=document.getElementById("telefono").value;
  let correo=document.getElementById("correo").value;
  let direccion=document.getElementById("direccion").value;
  let rol=document.getElementById("rol").value;
  
  
  
  
  let datos=new FormData();
  datos.append("doc", doc);
  datos.append("id", id);
  datos.append("nombres", nombres);
  datos.append("apellidos", apellidos);
  datos.append("telefono", telefono);
  datos.append("correo", correo);
  datos.append("direccion", direccion);
  datos.append("rol", rol);
 
  
  
  
  let respuesta=await fetch("?controller=funcionarios&action=edit", {
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
  swal.fire('',info.mensaje,'error')
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
    Swal.fire('','El password nuevo y el de confirmacion no coinciden','error')
  }
}
  

// funciones sincronicas ó async son las que esperan a que una funcion termine de cargarse para ejecutarse