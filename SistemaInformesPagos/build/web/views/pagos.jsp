<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Informe de Pagos</title>
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
            width: 794px;   /* A4 width in px at 96dpi */
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

        input[type="text"], input[type="number"], input[type="date"] {
            border: none;
            border-bottom: 1px solid #000;
            font-size: 16px;
            font-family: 'Times New Roman', serif;
            padding: 2px 4px;
        }

        h1, h2, h3 {
            text-align: center;
            margin: 10px 0;
        }

        .titulo-superior {
            text-align: center;
            font-size: 14px;
            margin: 10px 0 20px;
            color: #555;
        }

        .seccion {
            margin: 20px 0;
            padding: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        .fila {
            display: flex;
            justify-content: space-between;
            margin: 10px 0;
            align-items: center;
        }

        .fila label {
            font-weight: bold;
            min-width: 150px;
        }

        .tabla-pagos {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
        }

        .tabla-pagos th, .tabla-pagos td {
            border: 1px solid #000;
            padding: 8px;
            text-align: center;
        }

        .tabla-pagos th {
            background-color: #f0f0f0;
            font-weight: bold;
        }

        .tabla-pagos input {
            width: 100%;
            border: none;
            text-align: center;
            font-family: 'Times New Roman', serif;
        }

        .resumen {
            margin-top: 30px;
            padding: 20px;
            background-color: #f9f9f9;
            border: 2px solid #333;
        }

        .firma {
            margin-top: 60px;
            text-align: center;
        }

        .firma span {
            display: block;
            margin: 5px 0;
        }

        .ubicacion-fecha {
            margin-top: 40px;
            text-align: right;
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
            margin: 5px;
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

        .observaciones {
            width: 100%;
            font-family: 'Times New Roman', serif;
            font-size: 16px;
            border: 1px solid #000;
            padding: 8px;
            resize: vertical;
            min-height: 100px;
        }

        .total-general {
            font-size: 18px;
            font-weight: bold;
            text-align: right;
            margin-top: 15px;
            color: #003366;
        }
    </style>
</head>
<body>

<div class="encabezado">
    <div class="logo-titulo">
        <div style="width: 60px; height: 60px; background-color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-weight: bold; color: #003366;">LOGO</div>
        <div class="texto-encabezado">
            <h1>Informe de Pagos</h1>
            <p>Sistema de Gestión Financiera</p>
        </div>
    </div>
</div>

<div>
    <div id="contenedor-pdf" class="contenedor borde-visual">
        <form id="formularioInforme">
            
            <h2>INFORME DE PAGOS</h2>
            <h3>PERÍODO: <input type="date" name="fecha_inicio" style="width: 150px;"> al <input type="date" name="fecha_fin" style="width: 150px;"></h3>

            <p class="titulo-superior">
                "Año <input type="text" name="anio_fiscal" placeholder="2024" style="width: 60px;"> - 
                <input type="text" name="lema_anio" placeholder="Año de la Consolidación..." style="width: 400px;">"
            </p>

            <!-- Información del Informante -->
            <div class="seccion">
                <h4>DATOS DEL INFORMANTE</h4>
                <div class="fila">
                    <label>Nombre Completo:</label>
                    <input type="text" name="nombre_informante" placeholder="Nombres y Apellidos" style="width: 400px;">
                </div>
                <div class="fila">
                    <label>Cargo:</label>
                    <input type="text" name="cargo_informante" placeholder="Ej. Tesorero Municipal" style="width: 400px;">
                </div>
                <div class="fila">
                    <label>Dependencia:</label>
                    <input type="text" name="dependencia" placeholder="Ej. Municipalidad Distrital de..." style="width: 400px;">
                </div>
                <div class="fila">
                    <label>Fecha del Informe:</label>
                    <input type="date" name="fecha_informe" style="width: 200px;">
                </div>
            </div>

            <!-- Destinatario -->
            <div class="seccion">
                <h4>DIRIGIDO A</h4>
                <div class="fila">
                    <label>Sr(a):</label>
                    <input type="text" name="destinatario" placeholder="Nombre del destinatario" style="width: 400px;">
                </div>
                <div class="fila">
                    <label>Cargo:</label>
                    <input type="text" name="cargo_destinatario" placeholder="Ej. Alcalde Municipal" style="width: 400px;">
                </div>
            </div>

            <!-- Tabla de Pagos -->
            <div class="seccion">
                <h4>DETALLE DE PAGOS REALIZADOS</h4>
                <table class="tabla-pagos" id="tablaPagos">
                    <thead>
                        <tr>
                            <th style="width: 80px;">N°</th>
                            <th style="width: 120px;">Fecha</th>
                            <th style="width: 200px;">Concepto</th>
                            <th style="width: 150px;">Beneficiario</th>
                            <th style="width: 120px;">N° Documento</th>
                            <th style="width: 100px;">Monto (S/)</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td><input type="date" name="fecha_1"></td>
                            <td><input type="text" name="concepto_1" placeholder="Concepto del pago"></td>
                            <td><input type="text" name="beneficiario_1" placeholder="Nombre del beneficiario"></td>
                            <td><input type="text" name="documento_1" placeholder="N° comprobante"></td>
                            <td><input type="number" name="monto_1" placeholder="0.00" step="0.01" onchange="calcularTotal()"></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td><input type="date" name="fecha_2"></td>
                            <td><input type="text" name="concepto_2" placeholder="Concepto del pago"></td>
                            <td><input type="text" name="beneficiario_2" placeholder="Nombre del beneficiario"></td>
                            <td><input type="text" name="documento_2" placeholder="N° comprobante"></td>
                            <td><input type="number" name="monto_2" placeholder="0.00" step="0.01" onchange="calcularTotal()"></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td><input type="date" name="fecha_3"></td>
                            <td><input type="text" name="concepto_3" placeholder="Concepto del pago"></td>
                            <td><input type="text" name="beneficiario_3" placeholder="Nombre del beneficiario"></td>
                            <td><input type="text" name="documento_3" placeholder="N° comprobante"></td>
                            <td><input type="number" name="monto_3" placeholder="0.00" step="0.01" onchange="calcularTotal()"></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td><input type="date" name="fecha_4"></td>
                            <td><input type="text" name="concepto_4" placeholder="Concepto del pago"></td>
                            <td><input type="text" name="beneficiario_4" placeholder="Nombre del beneficiario"></td>
                            <td><input type="text" name="documento_4" placeholder="N° comprobante"></td>
                            <td><input type="number" name="monto_4" placeholder="0.00" step="0.01" onchange="calcularTotal()"></td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td><input type="date" name="fecha_5"></td>
                            <td><input type="text" name="concepto_5" placeholder="Concepto del pago"></td>
                            <td><input type="text" name="beneficiario_5" placeholder="Nombre del beneficiario"></td>
                            <td><input type="text" name="documento_5" placeholder="N° comprobante"></td>
                            <td><input type="number" name="monto_5" placeholder="0.00" step="0.01" onchange="calcularTotal()"></td>
                        </tr>
                    </tbody>
                </table>
                
                <div class="total-general">
                    TOTAL GENERAL: S/ <span id="totalGeneral">0.00</span>
                </div>

                <button type="button" onclick="agregarFila()" style="background-color: #28a745;">Agregar Fila</button>
                <button type="button" onclick="eliminarUltimaFila()" style="background-color: #dc3545;">Eliminar Última Fila</button>
            </div>

            <!-- Resumen -->
            <div class="resumen">
                <h4>RESUMEN EJECUTIVO</h4>
                <div class="fila">
                    <label>Total de Pagos Realizados:</label>
                    <span id="totalPagos" class="negrita">S/ 0.00</span>
                </div>
                <div class="fila">
                    <label>Cantidad de Operaciones:</label>
                    <span id="cantidadOperaciones" class="negrita">0</span>
                </div>
                <div class="fila">
                    <label>Estado del Informe:</label>
                    <select name="estado_informe" style="padding: 5px; font-family: 'Times New Roman', serif;">
                        <option value="PRELIMINAR">PRELIMINAR</option>
                        <option value="FINAL">FINAL</option>
                        <option value="COMPLEMENTARIO">COMPLEMENTARIO</option>
                    </select>
                </div>
            </div>

            <!-- Observaciones -->
            <div class="seccion">
                <h4>OBSERVACIONES Y COMENTARIOS</h4>
                <textarea id="campoObservaciones" class="observaciones" placeholder="Escriba aquí cualquier observación relevante sobre los pagos realizados, irregularidades encontradas, o comentarios adicionales..."></textarea>
                <div id="observacionesTexto" style="display:none; white-space:pre-wrap; font-family:'Times New Roman', serif; font-size: 16px; margin-top:10px;"></div>
            </div>

            <div class="ubicacion-fecha">
                <input type="text" name="lugar" placeholder="Ciudad" style="width: 150px;">, 
                <input type="text" name="dia" placeholder="Día" style="width: 40px;"> de 
                <input type="text" name="mes" placeholder="Mes" style="width: 120px;"> del 20<input type="text" name="anio" placeholder="Año" style="width: 40px;">
            </div>

            <div class="firma">
                <span>_______________________________________</span>
                <span><input type="text" name="nombre_firma" placeholder="NOMBRES Y APELLIDOS" style="width: 300px;"></span>
                <span><input type="text" name="cargo_firma" placeholder="CARGO" style="width: 300px;"></span>
                <span>DNI N° <input type="text" name="dni_firma" placeholder="DNI" style="width: 150px;"></span>
            </div>

        </form>
    </div>

    <div class="boton-exportar">
        <button onclick="exportarPDF()">Exportar a PDF</button>
    </div>
    
    <div class="boton-exportar">
        <label for="archivoPDF" style="display: inline-block; padding: 10px 20px; font-size: 16px; background-color: #333; color: white; border-radius: 5px; cursor: pointer;">
            Subir Documentos de Respaldo (PDF)
        </label>
        <input type="file" id="archivoPDF" accept=".pdf" multiple style="display: none;">
    </div>

    <!-- Lista de archivos PDF subidos -->
    <div id="lista-archivos" style="margin-top: 20px; text-align: center; font-family: 'Times New Roman', serif;">
        <h4 style="margin-bottom: 10px;">Documentos de Respaldo Adjuntos:</h4>
        <ul id="lista-pdf" style="list-style-type: none; padding: 0;"></ul>
    </div>
</div>

<script>
    const inputPDF = document.getElementById('archivoPDF');
    const listaPDF = document.getElementById('lista-pdf');
    let archivosSubidos = [];
    let contadorFilas = 5;

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
            botonEliminar.textContent = "?";
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

    function calcularTotal() {
        let total = 0;
        let operaciones = 0;
        
        for (let i = 1; i <= contadorFilas; i++) {
            const montoInput = document.querySelector(`input[name="monto_${i}"]`);
            if (montoInput && montoInput.value) {
                const monto = parseFloat(montoInput.value) || 0;
                total += monto;
                if (monto > 0) operaciones++;
            }
        }
        
        document.getElementById('totalGeneral').textContent = total.toFixed(2);
        document.getElementById('totalPagos').textContent = 'S/ ' + total.toFixed(2);
        document.getElementById('cantidadOperaciones').textContent = operaciones;
    }

    function agregarFila() {
        contadorFilas++;
        const tabla = document.querySelector('#tablaPagos tbody');
        const nuevaFila = document.createElement('tr');
        
        nuevaFila.innerHTML = `
            <td>${contadorFilas}</td>
            <td><input type="date" name="fecha_${contadorFilas}"></td>
            <td><input type="text" name="concepto_${contadorFilas}" placeholder="Concepto del pago"></td>
            <td><input type="text" name="beneficiario_${contadorFilas}" placeholder="Nombre del beneficiario"></td>
            <td><input type="text" name="documento_${contadorFilas}" placeholder="N° comprobante"></td>
            <td><input type="number" name="monto_${contadorFilas}" placeholder="0.00" step="0.01" onchange="calcularTotal()"></td>
        `;
        
        tabla.appendChild(nuevaFila);
    }

    function eliminarUltimaFila() {
        if (contadorFilas > 1) {
            const tabla = document.querySelector('#tablaPagos tbody');
            tabla.removeChild(tabla.lastChild);
            contadorFilas--;
            calcularTotal();
        }
    }

    async function exportarPDF() {
        const contenedor = document.getElementById('contenedor-pdf');
        const textarea = document.getElementById('campoObservaciones');
        const divTexto = document.getElementById('observacionesTexto');

        // Reemplazar textarea con div para la exportación
        divTexto.innerText = textarea.value;
        textarea.style.display = 'none';
        divTexto.style.display = 'block';
        contenedor.classList.remove('borde-visual');

        // Espera al renderizado DOM
        setTimeout(async () => {
            const opt = {
                margin: 0,
                filename: 'informe_pagos.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 2, useCORS: true },
                jsPDF: { unit: 'pt', format: 'a4', orientation: 'portrait' }
            };

            // Paso 1: genera el PDF del formulario
            const pdfBlob = await html2pdf().from(contenedor).set(opt).outputPdf('blob');

            // Paso 2: crea un nuevo PDF combinado
            const mergedPdf = await PDFLib.PDFDocument.create();

            // Agrega el formulario al PDF combinado
            const formPdf = await PDFLib.PDFDocument.load(await pdfBlob.arrayBuffer());
            const formPages = await mergedPdf.copyPages(formPdf, formPdf.getPageIndices());
            formPages.forEach(page => mergedPdf.addPage(page));

            // Agrega cada PDF subido
            for (const archivo of archivosSubidos) {
                const buffer = await archivo.arrayBuffer();
                const otroPDF = await PDFLib.PDFDocument.load(buffer);
                const paginas = await mergedPdf.copyPages(otroPDF, otroPDF.getPageIndices());
                paginas.forEach(p => mergedPdf.addPage(p));
            }

            // Paso 3: guarda el PDF final combinado
            const pdfFinalBytes = await mergedPdf.save();
            const blobFinal = new Blob([pdfFinalBytes], { type: 'application/pdf' });
            const urlFinal = URL.createObjectURL(blobFinal);
            const link = document.createElement('a');
            link.href = urlFinal;
            link.download = 'informe_pagos_con_adjuntos.pdf';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);

            // Restaurar visualmente
            divTexto.style.display = 'none';
            textarea.style.display = 'block';
            contenedor.classList.add('borde-visual');
        }, 100);
    }

    // Inicializar cálculo
    calcularTotal();
</script>

</body>
</html>