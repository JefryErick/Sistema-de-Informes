<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario de Licencia de Funcionamiento</title>
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

        .seccion-datos {
            margin: 20px 0;
            padding: 15px;
            border: 1px solid #ccc;
            background-color: #f9f9f9;
        }

        .datos-negocio {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 15px;
            margin: 15px 0;
        }

        .campo-completo {
            grid-column: 1 / -1;
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

            <h2>SOLICITUD DE LICENCIA DE FUNCIONAMIENTO</h2>
            <h3>PARA ESTABLECIMIENTOS COMERCIALES</h3>

            <p class="titulo-superior">"<input type="text" name="anio_lema" placeholder="AÑO DE LA CONSOLIDACIÓN..." style="width: 500px;">"</p>

            <p><strong>SOLICITA:</strong> Licencia de Funcionamiento</p>

            <p><strong>Señor(a):</strong> <input type="text" name="autoridad" placeholder="Nombre de la autoridad" style="width: 300px;"><br>
                <input type="text" name="cargo_autoridad" placeholder="Alcalde(sa) del Distrito de Corrales" style="width: 400px;"></p>

            <div class="alineado">
                <div class="seccion-datos">
                    <h4><strong>I. DATOS DEL SOLICITANTE</strong></h4>
                    <p>Yo, <input type="text" name="nombre_solicitante" placeholder="Nombres y Apellidos completos" style="width: 350px;">, 
                    identificado(a) con DNI N° <input type="text" name="dni_solicitante" placeholder="DNI" style="width: 150px;">,</p>
                    
                    <p>Con domicilio en: <input type="text" name="domicilio_solicitante" placeholder="Dirección de domicilio" style="width: 400px;"></p>
                    
                    <p>Teléfono: <input type="text" name="telefono" placeholder="Número de teléfono" style="width: 200px;"> 
                    Email: <input type="text" name="email" placeholder="Correo electrónico" style="width: 250px;"></p>
                </div>

                <div class="seccion-datos">
                    <h4><strong>II. DATOS DEL ESTABLECIMIENTO</strong></h4>
                    <div class="datos-negocio">
                        <div>
                            <p><strong>Razón Social/Nombre Comercial:</strong></p>
                            <input type="text" name="razon_social" placeholder="Nombre del negocio" style="width: 100%;">
                        </div>
                        <div>
                            <p><strong>RUC N°:</strong></p>
                            <input type="text" name="ruc" placeholder="Número de RUC" style="width: 100%;">
                        </div>
                        <div class="campo-completo">
                            <p><strong>Dirección del Establecimiento:</strong></p>
                            <input type="text" name="direccion_establecimiento" placeholder="Dirección exacta del local" style="width: 100%;">
                        </div>
                        <div>
                            <p><strong>Distrito:</strong></p>
                            <input type="text" name="distrito" placeholder="Distrito" style="width: 100%;">
                        </div>
                        <div>
                            <p><strong>Provincia:</strong></p>
                            <input type="text" name="provincia" placeholder="Provincia" style="width: 100%;">
                        </div>
                        <div>
                            <p><strong>Área del Local (m²):</strong></p>
                            <input type="text" name="area_local" placeholder="Área en m²" style="width: 100%;">
                        </div>
                        <div>
                            <p><strong>N° de Trabajadores:</strong></p>
                            <input type="text" name="num_trabajadores" placeholder="Cantidad" style="width: 100%;">
                        </div>
                    </div>
                </div>

                <div class="seccion-datos">
                    <h4><strong>III. GIRO DEL NEGOCIO</strong></h4>
                    <p><strong>Actividad Económica Principal:</strong></p>
                    <textarea id="actividadEconomica" rows="3" placeholder="Describa detalladamente la actividad comercial que realizará..." style="width: 100%; font-family: 'Times New Roman', serif; font-size: 16px; border: 1px solid #000; padding: 8px; resize: vertical;"></textarea>
                    <div id="actividadEconomicaTexto" style="display:none; white-space:pre-wrap; font-family:'Times New Roman', serif; font-size: 16px; margin-top:10px;"></div>
                    
                    <p><strong>Código CIIU:</strong> <input type="text" name="codigo_ciiu" placeholder="Código de clasificación" style="width: 200px;"></p>
                </div>

                <div class="seccion-datos">
                    <h4><strong>IV. TIPO DE LICENCIA SOLICITADA</strong></h4>
                    <p>☐ Licencia de Funcionamiento Temporal (hasta 12 meses)</p>
                    <p>☐ Licencia de Funcionamiento Definitiva</p>
                    <p>☐ Renovación de Licencia de Funcionamiento</p>
                </div>

                <p>Ante Usted, con el debido respeto me presento y expongo:</p>
                
                <p>Que, teniendo la intención de iniciar actividades comerciales en el establecimiento antes mencionado, 
                <span class="negrita">SOLICITO</span> se me otorgue la correspondiente Licencia de Funcionamiento, 
                para lo cual adjunto la documentación requerida según la normativa vigente.</p>

                <p>Asimismo, me comprometo a cumplir con todas las disposiciones municipales, normas de seguridad, 
                salubridad y medio ambiente aplicables a mi actividad comercial.</p>

                <div class="seccion-datos">
                    <h4><strong>V. INFORMACIÓN ADICIONAL</strong></h4>
                    <textarea id="informacionAdicional" rows="4" placeholder="Agregue cualquier información adicional relevante..." style="width: 100%; font-family: 'Times New Roman', serif; font-size: 16px; border: 1px solid #000; padding: 8px; resize: vertical;"></textarea>
                    <div id="informacionAdicionalTexto" style="display:none; white-space:pre-wrap; font-family:'Times New Roman', serif; font-size: 16px; margin-top:10px;"></div>
                </div>

                <p>Por lo expuesto, solicito acceder a mi petición por ser de justicia.</p>
            </div>

            <div class="ubicacion-fecha">
                <input type="text" name="lugar" placeholder="Lugar (Ej. Corrales)" style="width: 150px;">, 
                <input type="text" name="dia" placeholder="Día" style="width: 40px;"> de 
                <input type="text" name="mes" placeholder="Mes" style="width: 120px;"> del 20<input type="text" name="anio" placeholder="Año" style="width: 40px;">
            </div>

            <div class="firma">
                <span>_______________________________________</span>
                <span><strong>SOLICITANTE</strong></span>
                <span><input type="text" name="nombres_firma" placeholder="NOMBRES Y APELLIDOS" style="width: 300px;"></span>
                <span>DNI N° <input type="text" name="dni_firma" placeholder="DNI" style="width: 150px;"></span>
                <span>Firma: ________________________</span>
                <span>Huella Digital</span>
            </div>

            <div style="margin-top: 40px; border-top: 2px solid #000; padding-top: 20px;">
                <h4><strong>PARA USO EXCLUSIVO DE LA MUNICIPALIDAD</strong></h4>
                <p>Expediente N°: _____________ Fecha de Recepción: ___/___/______</p>
                <p>Funcionario Receptor: ________________________________</p>
                <p>Observaciones: ________________________________________________</p>
                <p>___________________________________________________________</p>
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
            {textarea: document.getElementById('actividadEconomica'), div: document.getElementById('actividadEconomicaTexto')},
            {textarea: document.getElementById('informacionAdicional'), div: document.getElementById('informacionAdicionalTexto')}
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
                filename: 'licencia_funcionamiento.pdf',
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
            link.download = 'licencia_funcionamiento_con_adjuntos.pdf';
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