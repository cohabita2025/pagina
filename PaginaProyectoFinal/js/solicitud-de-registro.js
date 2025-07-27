

function desplegar(familiar){

    /* CAMBIAR DESACTIVAR Y ACTIVAR DISPLAY DE INFORMACION DETALLADA Y BASICA*/ 

    const desplegable=document.getElementById(familiar);/* agarra el ID del familiar en que se presiono el boton desplegar*/

    const informacion_basica=desplegable.querySelector('.informacion-basica');/*agarra el elemento informacion basica hijo mas cercano a familiar*/ 
    const informacion_detallada=desplegable.querySelector('.informacion-detallada');/*agarra el elemento informacion detallada hijo mas cercano a familiar*/ 

    const display_informacion_basica = window.getComputedStyle(informacion_basica).display;/* guarda el estilo del display en este caso*/

    if (display_informacion_basica === 'flex') {
        informacion_basica.style.display = 'none'; /*cambia el estilo de display a none*/ 
        informacion_detallada.style.display = 'flex'; /*cambia el estilo de display a flex*/ 
    } else {
      informacion_basica.style.display = 'flex';
      informacion_detallada.style.display = 'none';
    }

    /* PONER INFORMACION DE NOMBRE EN INFORMACION BASICA*/

    const nombre = informacion_detallada.querySelector('.nombre'); 
    const primer_apellido = informacion_detallada.querySelector('.primer-apellido');
    const segundo_apellido = informacion_detallada.querySelector('.segundo-apellido');

    let nombre_simple = informacion_basica.querySelector('.nombre').querySelector('p');

    nombre_simple.innerHTML= nombre.value + " " + primer_apellido.value +" " +segundo_apellido.value; // cambia el contenido de nombre_simple por los valores de nombre primer y segundo apellido

}

function eliminarFamiliar(idFamiliar){
    console.log(idFamiliar);
    const familiar = document.getElementById(idFamiliar);
    familiar.remove();
}
var numFamiliar = 1;
function agregarFamiliar(){
numFamiliar = numFamiliar + 1;
console.log(numFamiliar); 
   document.querySelector('.familiares').insertAdjacentHTML('afterbegin', `
    <div class="familiar" id="familiar${numFamiliar}">
    <div class="informacion">
    <div class="informacion-basica">
    <div class="foto">
    <img src="" alt="">
    </div>
    <div class="nombre">
    <p></p>
    </div>
    <div class="boton-borrar">
    <button type="button" onclick="eliminarFamiliar('familiar${numFamiliar}')"></button>
    </div>
    </div>
    <div class="informacion-detallada">
    <div class="foto">
    <img src="" alt="">
    <input type="file" name="foto-familiar" class="foto-familiar">
    </div>
    <div class="datos">
    <input type="text" name="nombre" class="dato nombre" placeholder="hombre" required>
    <input type="text" name="primer-apellido" class="dato primer-apellido" placeholder="primer-apellido" required>
    <input type="text" name="segundo-apellido" class="dato segundo-apellido" placeholder="segundo-apellido">
    <input type="text" name="cedula" class="dato cedula" placeholder="cedula" required>
    <input type="date" name="fecha-nacimiento" class="dato fecha-nacimiento" required>
    <input type="email" name="gmail" class="dato email" placeholder="gmail@example.com">
    <input type="text" name="telefono" class="dato telefono" placeholder="telefono">
    <select name="rol-ante-titular" class="dato rol-ante-titular"  required>
    <option value="" disabled selected>rol</option>
    <option value="madre">madre</option>
    <option value="padre">padre</option>
    <option value="hijo/a">hijo/a</option>
    <option value="sobrino/a">sobrino/a</option>
    <option value="tio/a">tio/a</option>
    </select>
    <select name="" id="" class="dato genero">
    <option value="" disabled selected>genero</option>
    <option value="hombre">hombre</option>
    <option value="mujer">mujer</option>
    </select>
    <input type="file" name="copia-cedula" class="dato copia-cedula">
    <input type="file" name="comprobante-ingresos" class="dato copia-cedula">
    <input type="file" name="declaracion-no-vivienda" class="dato declaracion-no-vivienda">
    </div>
    </div>
    </div>
    <div class="desplegar">
    <button onclick="desplegar('familiar${numFamiliar}')" id="desplegar-familiar" class="boton-desplegar" type="button">
    <p>desplegar</p>
    </button>
    </div>
    </div>
    `);
}

function cambiarInput(input){
    const valor =  document.getElementById(input);
    if(valor.type == "text"){
        valor.type="password"
    }else if(valor.type == "password"){
        valor.type="text"
    }
}