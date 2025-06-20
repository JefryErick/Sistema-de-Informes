<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario de Acta de Compromiso</title>
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

        input[type="text"] {
            border: none;
            border-bottom: 1px solid #000;
            font-size: 16px;
            font-family: 'Times New Roman', serif;
            padding: 2px 4px;
        }

        h2, h3 {
            text-align: center;
            margin: 0;
        }

        .titulo-superior {
            text-align: center;
            font-size: 14px;
            margin: 10px 0 20px;
            color: #555;
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

        .firmas-multiples {
            display: flex;
            justify-content: space-between;
            margin-top: 60px;
        }

        .firma-individual {
            text-align: center;
            width: 45%;
        }

        .compromisos {
            margin: 20px 0;
            padding: 15px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
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

            <h2>ACTA DE COMPROMISO</h2>
            <h3>PARA <input type="text" name="motivo" placeholder="Ej. CUMPLIMIENTO DE NORMAS DE CONSTRUCCIÓN" style="width: 400px;"></h3>

            <p class="titulo-superior">"<input type="text" name="anio_lema" placeholder="AÑO DE LA CONSOLIDACIÓN..." style="width: 500px;">"</p>

            <div class="alineado">
                <p><strong>PARTES INTERVINIENTES:</strong></p>
                
                <p><strong>PRIMERA PARTE (SOLICITANTE):</strong><br>
                Yo, <input type="text" name="nombre_solicitante" placeholder="Nombres y Apellidos del solicitante" style="width: 300px;">, 
                identificado con DNI N° <input type="text" name="dni_solicitante" placeholder="DNI" style="width: 150px;">, 
                domiciliado en <input type="text" name="domicilio_solicitante" placeholder="Dirección del solicitante" style="width: 300px;">.</p>

                <p><strong>SEGUNDA PARTE (MUNICIPALIDAD):</strong><br>
                <input type="text" name="representante_municipal" placeholder="Nombre del representante municipal" style="width: 300px;">, 
                en representación de la Municipalidad Distrital de Corrales, identificado con DNI N° 
                <input type="text" name="dni_representante" placeholder="DNI del representante" style="width: 150px;">.</p>

                <p><strong>OBJETO DEL COMPROMISO:</strong></p>
                <div class="compromisos">
                    <textarea id="objetoCompromiso" rows="4" placeholder="Describa el objeto principal del compromiso..." style="width: 100%; font-family: 'Times New Roman', serif; font-size: 16px; border: 1px solid #000; padding: 8px; resize: vertical;"></textarea>
                    <div id="objetoTexto" style="display:none; white-space:pre-wrap; font-family:'Times New Roman', serif; font-size: 16px; margin-top:10px;"></div>
                </div>

                <p><strong>COMPROMISOS ESPECÍFICOS:</strong></p>
                <div class="compromisos">
                    <p><strong>Del solicitante:</strong></p>
                    <textarea id="compromisossolicitante" rows="5" placeholder="1. Cumplir con todas las normas técnicas...\n2. Realizar las obras según los planos aprobados...\n3. Permitir las inspecciones municipales..." style="width: 100%; font-family: 'Times New Roman', serif; font-size: 16px; border: 1px solid #000; padding: 8px; resize: vertical;"></textarea>
                    <div id="compromisosSolicitanteTexto" style="display:none; white-space:pre-wrap; font-family:'Times New Roman', serif; font-size: 16px; margin-top:10px;"></div>
                    
                    <p><strong>De la municipalidad:</strong></p>
                    <textarea id="compromisosMunicipalidad" rows="3" placeholder="1. Brindar asesoría técnica cuando sea requerida...\n2. Realizar inspecciones en los plazos establecidos..." style="width: 100%; font-family: 'Times New Roman', serif; font-size: 16px; border: 1px solid #000; padding: 8px; resize: vertical;"></textarea>
                    <div id="compromisosMunicipalidadTexto" style="display:none; white-space:pre-wrap; font-family:'Times New Roman', serif; font-size: 16px; margin-top:10px;"></div>
                </div>

                <p><strong>PLAZO:</strong> El presente compromiso tendrá una vigencia de 
                <input type="text" name="plazo" placeholder="Ej. 12 meses" style="width: 150px;"> 
                a partir de la fecha de suscripción.</p>

                <p><strong>SANCIONES:</strong> En caso de incumplimiento, se aplicarán las sanciones establecidas en la normativa municipal vigente.</p>

                <textarea id="clausulasAdicionales" rows="4" placeholder="Agregue cláusulas adicionales si es necesario..." style="width: 100%; font-family: 'Times New Roman', serif; font-size: 16px; border: 1px solid #000; padding: 8px; resize: vertical;"></textarea>
                <div id="clausulasAdicionalesTexto" style="display:none; white-space:pre-wrap; font-family:'Times New Roman', serif; font-size: 16px; margin-top:10px;"></div>
            </div>

            <div class="ubicacion-fecha">
                <input type="text" name="lugar" placeholder="Lugar (Ej. Corrales)" style="width: 150px;">, 
                <input type="text" name="dia" placeholder="Día" style="width: 40px;"> de 
                <input type="text" name="mes" placeholder="Mes" style="width: 120px;"> del 20<input type="text" name="anio" placeholder="Año" style="width: 40px;">
            </div>

            <div class="firmas-multiples">
                <div class="firma-individual">
                    <span>_______________________________________</span>
                    <span><strong>PRIMERA PARTE</strong></span>
                    <span><input type="text" name="nombre_firma_solicitante" placeholder="NOMBRES Y APELLIDOS" style="width: 250px;"></span>
                    <span>DNI N° <input type="text" name="dni_firma_solicitante" placeholder="DNI" style="width: 100px;"></span>
                </div>

                <div class="firma-individual">
                    <span>_______________________________________</span>
                    <span><strong>SEGUNDA PARTE</strong></span>
                    <span><input type="text" name="nombre_firma_representante" placeholder="NOMBRES Y APELLIDOS" style="width: 250px;"></span>
                    <span>Representante Municipal</span>
                    <span>DNI N° <input type="text" name="dni_firma_representante" placeholder="DNI" style="width: 100px;"></span>
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
        
        // Reemplazar todos los textareas con divs para la exportación
        const textareas = [
            {textarea: document.getElementById('objetoCompromiso'), div: document.getElementById('objetoTexto')},
            {textarea: document.getElementById('compromisossolicitante'), div: document.getElementById('compromisosSolicitanteTexto')},
            {textarea: document.getElementById('compromisosMunicipalidad'), div: document.getElementById('compromisosMunicipalidadTexto')},
            {textarea: document.getElementById('clausulasAdicionales'), div: document.getElementById('clausulasAdicionalesTexto')}
        ];

        textareas.forEach(({textarea, div}) => {
            div.innerText = textarea.value;
            textarea.style.display = 'none';
            div.style.display = 'block';
        });

        contenedor.classList.remove('borde-visual');

        setTimeout(async () => {
            const opt = {
                margin: 0,
                filename: 'acta_compromiso.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 3 },
                jsPDF: { unit: 'pt', format: 'a4', orientation: 'portrait' }
            };

            const pdfBlob = await html2pdf().from(contenedor).set(opt).outputPdf('blob');
            const mergedPdf = await PDFLib.PDFDocument.create();

            const formPdf = await PDFLib.PDFDocument.load(await pdfBlob.arrayBuffer());
            const formPages = await mergedPdf.copyPages(formPdf, formPdf.getPageIndices());
            formPages.forEach(page => mergedPdf.addPage(page));

            for (const archivo of archivosSubidos) {
                const buffer = await archivo.arrayBuffer();
                const otroPDF = await PDFLib.PDFDocument.load(buffer);
                const paginas = await mergedPdf.copyPages(otroPDF, otroPDF.getPageIndices());
                paginas.forEach(p => mergedPdf.addPage(p));
            }

            const pdfFinalBytes = await mergedPdf.save();
            const blobFinal = new Blob([pdfFinalBytes], { type: 'application/pdf' });
            const urlFinal = URL.createObjectURL(blobFinal);
            const link = document.createElement('a');
            link.href = urlFinal;
            link.download = 'acta_compromiso_con_adjuntos.pdf';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);

            // Restaurar visualmente
            textareas.forEach(({textarea, div}) => {
                div.style.display = 'none';
                textarea.style.display = 'block';
            });
            contenedor.classList.add('borde-visual');
        }, 100);
    }
</script>

</body>
</html>