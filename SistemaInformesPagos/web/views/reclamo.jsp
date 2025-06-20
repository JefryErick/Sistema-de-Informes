<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formato de Reclamo</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf-lib/1.17.1/pdf-lib.min.js"></script>
    <style>
        body {
            font-family: 'Times New Roman', serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: block;
        }
        
        .contenedor {
            width: 794px;
            background-color: white;
            padding: 40px;
            box-sizing: border-box;
            margin: 0 auto;
            position: relative;
        }

        .borde-visual {
            border: 2px solid black;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        input[type="text"], input[type="checkbox"] {
            border: none;
            border-bottom: 1px solid #000;
            font-size: 16px;
            font-family: 'Times New Roman', serif;
            padding: 2px 4px;
        }

        input[type="checkbox"] {
            border: 1px solid #000;
            border-radius: 0;
            width: 15px;
            height: 15px;
        }

        h2, h3, h4 {
            text-align: center;
            margin: 10px 0;
        }

        h4 {
            text-align: left;
            font-size: 16px;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .alineado {
            text-align: justify;
            margin-top: 20px;
        }

        .firma {
            margin-top: 60px;
            text-align: center;
        }

        .firma span {
            display: block;
            margin: 5px 0;
        }

        .negrita {
            font-weight: bold;
        }

        .boton-exportar {
            margin-top: 20px;
            text-align: center;
        }

        button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #333;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #555;
        }

        .encabezado {
            background-color: #003366;
            color: white;
            padding: 20px 30px;
            border-radius: 8px;
            margin-bottom: 30px;
            width: 100%;
            box-sizing: border-box;
            font-family: 'Times New Roman', serif;
        }

        .logo-titulo {
            display: flex;
            align-items: center;
            gap: 20px;
        }

        .logo {
            height: 60px;
            width: auto;
        }

        .texto-encabezado h1 {
            font-size: 20px;
            margin: 0;
        }

        .texto-encabezado p {
            font-size: 14px;
            margin: 5px 0 0;
        }

        .campo-grupo {
            margin-bottom: 15px;
        }

        .checkbox-group {
            display: flex;
            gap: 30px;
            align-items: center;
            margin: 10px 0;
        }

        .checkbox-item {
            display: flex;
            align-items: center;
            gap: 8px;
        }
    </style>
</head>
<body>

<div class="encabezado">
    <div class="logo-titulo">
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/5a/Seal_of_Peru.svg/120px-Seal_of_Peru.svg.png" alt="Logo" class="logo">
        <div class="texto-encabezado">
            <h1>generador de informes</h1>
            <p>...</p>
        </div>
    </div>
</div>

<div>
    <div id="contenedor-pdf" class="contenedor borde-visual">
        <form id="formularioPDF">
            <h2>FORMATO DE RECLAMO</h2>
            <h3>LIBRO DE RECLAMACIONES</h3>

            <div class="campo-grupo">
                <p><strong>FECHA:</strong> <input type="text" name="fecha_reclamo" placeholder="DD/MM/AAAA" style="width: 150px;"></p>
                <p><strong>N° DE RECLAMO:</strong> <input type="text" name="numero_reclamo" placeholder="Número de reclamo" style="width: 150px;"></p>
            </div>

            <div class="alineado">
                <h4>DATOS DEL RECLAMANTE:</h4>
                <p>Nombres y Apellidos: <input type="text" name="nombre_reclamante" placeholder="Nombres y apellidos completos" style="width: 400px;"></p>
                
                <div class="checkbox-group">
                    <div class="checkbox-item">
                        <input type="checkbox" name="tipo_doc" value="dni" id="dni">
                        <label for="dni">DNI</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" name="tipo_doc" value="ce" id="ce">
                        <label for="ce">C.E.</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" name="tipo_doc" value="pasaporte" id="pasaporte">
                        <label for="pasaporte">Pasaporte</label>
                    </div>
                </div>
                
                <p>N° de Documento: <input type="text" name="num_documento" placeholder="Número de documento" style="width: 200px;"> 
                   Teléfono: <input type="text" name="telefono_reclamante" placeholder="Teléfono de contacto" style="width: 200px;"></p>
                
                <p>Dirección: <input type="text" name="direccion_reclamante" placeholder="Dirección completa" style="width: 500px;"></p>
                
                <p>Email: <input type="text" name="email_reclamante" placeholder="Correo electrónico" style="width: 350px;"></p>

                <h4>TIPO DE RECLAMO:</h4>
                <div class="checkbox-group">
                    <div class="checkbox-item">
                        <input type="checkbox" name="tipo_reclamo" value="servicio" id="servicio">
                        <label for="servicio">Deficiencia en el servicio</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" name="tipo_reclamo" value="atencion" id="atencion">
                        <label for="atencion">Mala atención</label>
                    </div>
                </div>
                
                <div class="checkbox-group">
                    <div class="checkbox-item">
                        <input type="checkbox" name="tipo_reclamo" value="demora" id="demora">
                        <label for="demora">Demora excesiva</label>
                    </div>
                    <div class="checkbox-item">
                        <input type="checkbox" name="tipo_reclamo" value="otro" id="otro">
                        <label for="otro">Otro</label>
                    </div>
                </div>
                
                <p>Especificar otro: <input type="text" name="otro_reclamo" placeholder="Especificar otro tipo de reclamo" style="width: 400px;"></p>

                <h4>BIEN O SERVICIO CONTRATADO:</h4>
                <p>Descripción: <input type="text" name="servicio_contratado" placeholder="Describe el servicio o trámite" style="width: 450px;"></p>
                <p>Monto pagado: S/. <input type="text" name="monto_pagado" placeholder="0.00" style="width: 100px;"></p>

                <h4>DETALLE DEL RECLAMO:</h4>
                <textarea id="campoDetalle" rows="10" placeholder="Describa detalladamente su reclamo, incluyendo:
- Fecha y hora en que ocurrieron los hechos
- Lugar donde sucedió
- Personas involucradas (nombres, cargos)
- Descripción de los hechos
- Cualquier información relevante que ayude a entender su reclamo" style="width: 100%; font-family: 'Times New Roman', serif; font-size: 16px; border: 1px solid #000; padding: 8px; resize: vertical;"></textarea>
                <div id="detalleTexto" style="display:none; white-space:pre-wrap; font-family:'Times New Roman', serif; font-size: 16px; margin-top:10px;"></div>

                <h4>SOLUCIÓN SOLICITADA:</h4>
                <textarea id="campoSolucion" rows="4" placeholder="Indique qué solución espera para resolver su reclamo. Por ejemplo:
- Corrección del servicio
- Reembolso
- Disculpas públicas
- Mejora en la atención
- Otra solución específica" style="width: 100%; font-family: 'Times New Roman', serif; font-size: 16px; border: 1px solid #000; padding: 8px; resize: vertical;"></textarea>
                <div id="solucionTexto" style="display:none; white-space:pre-wrap; font-family:'Times New Roman', serif; font-size: 16px; margin-top:10px;"></div>

                <h4>OBSERVACIONES Y ACCIONES ADOPTADAS POR EL PROVEEDOR:</h4>
                <p>(Para uso del proveedor)</p>
                <div style="border: 1px solid #000; height: 80px; width: 100%; margin-top: 10px;"></div>
            </div>

            <div class="firma">
                <div style="display: flex; justify-content: space-between; margin-top: 40px;">
                    <div style="text-align: center; width: 45%;">
                        <span>_________________________________</span><br>
                        <span><strong>FIRMA DEL RECLAMANTE</strong></span><br>
                        <span><input type="text" name="nombre_firma_cliente" placeholder="NOMBRES Y APELLIDOS" style="width: 250px;"></span><br>
                        <span>Fecha: ___/___/______</span>
                    </div>
                    <div style="text-align: center; width: 45%;">
                        <span>_________________________________</span><br>
                        <span><strong>FIRMA DEL PROVEEDOR</strong></span><br>
                        <span>MUNICIPALIDAD DISTRITAL DE CORRALES</span><br>
                        <span>Fecha: ___/___/______</span>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <div class="boton-exportar">
        <button onclick="exportarPDF()">Exportar a PDF</button>
    </div>
    
    <div class="boton-exportar">
        <label for="archivoPDF" style="display: inline-block; padding: 10px 20px; font-size: 16px; background-color: #333; color: white; border-radius: 5px; cursor: pointer;">
            Subir archivo PDF
        </label>
        <input type="file" id="archivoPDF" accept=".pdf" style="display: none;">
    </div>

    <div id="lista-archivos" style="margin-top: 20px; text-align: center; font-family: 'Times New Roman', serif;">
        <h4 style="margin-bottom: 10px;">Archivos PDF Subidos:</h4>
        <ul id="lista-pdf" style="list-style-type: none; padding: 0;"></ul>
    </div>
</div>

<script>
    const inputPDF = document.getElementById('archivoPDF');
    const listaPDF = document.getElementById('lista-pdf');
    let archivosSubidos = [];

    function renderizarLista() {
        listaPDF.innerHTML = "";
        archivosSubidos.forEach((archivo, index) => {
            const item = document.createElement('li');
            item.style.margin = "5px 0";

            const enlace = document.createElement('a');
            enlace.href = URL.createObjectURL(archivo);
            enlace.textContent = `${index + 1}. ${archivo.name}`;
            enlace.target = "_blank";
            enlace.style.color = "#003366";
            enlace.style.textDecoration = "underline";
            enlace.style.fontSize = "16px";
            enlace.style.marginRight = "10px";

            const botonEliminar = document.createElement('button');
            botonEliminar.textContent = "❌";
            botonEliminar.style.marginLeft = "10px";
            botonEliminar.style.backgroundColor = "transparent";
            botonEliminar.style.border = "none";
            botonEliminar.style.color = "red";
            botonEliminar.style.cursor = "pointer";
            botonEliminar.style.fontSize = "16px";

            botonEliminar.addEventListener('click', () => {
                archivosSubidos.splice(index, 1);
                renderizarLista();
            });

            item.appendChild(enlace);
            item.appendChild(botonEliminar);
            listaPDF.appendChild(item);
        });
    }

    inputPDF.addEventListener('change', function () {
        const nuevosArchivos = Array.from(this.files);
        archivosSubidos.push(...nuevosArchivos);
        renderizarLista();
        this.value = "";
    });

    async function exportarPDF() {
        const contenedor = document.getElementById('contenedor-pdf');
        const textareaDetalle = document.getElementById('campoDetalle');
        const divDetalle = document.getElementById('detalleTexto');
        const textareaSolucion = document.getElementById('campoSolucion');
        const divSolucion = document.getElementById('solucionTexto');

        // Reemplazar textareas con divs para la exportación
        divDetalle.innerText = textareaDetalle.value;
        textareaDetalle.style.display = 'none';
        divDetalle.style.display = 'block';

        divSolucion.innerText = textareaSolucion.value;
        textareaSolucion.style.display = 'none';
        divSolucion.style.display = 'block';

        contenedor.classList.remove('borde-visual');

        // Espera al renderizado DOM
        setTimeout(async () => {
            const opt = {
                margin: 0,
                filename: 'formato_reclamo.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 3 },
                jsPDF: { unit: 'pt', format: 'a4', orientation: 'portrait' }
            };

            // Paso 1: genera el PDF del formulario
            const pdfBlob = await html2pdf().from(contenedor).set(opt).outputPdf('blob');

            // Paso 2: crea un nuevo PDF combinado
            const mergedPdf = await PDFLib.PDFDocument.create();

            // Agrega el formulario al PDF combinado
            const formPdf = await PDFLib.PDFDocument.load(await pdfBlob.arrayBuffer());
            const formPages = await mergedP