<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Carta para Prácticas</title>
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

            <h2>CARTA DE SOLICITUD</h2>
            <h3>PARA PRÁCTICAS PROFESIONALES / PRE-PROFESIONALES</h3>

            <p class="titulo-superior">"<input type="text" name="anio_lema" placeholder="AÑO DE LA CONSOLIDACIÓN DEL BICENTENARIO" style="width: 500px;">"</p>

            <p><strong>SOLICITA:</strong> <input type="text" name="tipo_practica" placeholder="Prácticas Profesionales / Pre-profesionales" style="width: 400px;"></p>

            <p><strong>Sr(a).</strong> <input type="text" name="autoridad" placeholder="Nombre de la autoridad" style="width: 300px;"><br>
                <input type="text" name="cargo" placeholder="Ej. Alcalde(sa) del Distrito de Corrales" style="width: 400px;"></p>

            <div class="alineado">
                Yo, <input type="text" name="nombre" placeholder="Nombres y Apellidos completos" style="width: 300px;">, identificado(a) con
                DNI N° <input type="text" name="dni" placeholder="DNI" style="width: 120px;">, estudiante de la carrera de 
                <input type="text" name="carrera" placeholder="Nombre de la carrera" style="width: 300px;"> de la 
                <input type="text" name="universidad" placeholder="Universidad/Instituto" style="width: 300px;">, 
                con domicilio en <input type="text" name="domicilio" placeholder="Dirección completa" style="width: 400px;">, 
                ante Usted respetuosamente me presento y expongo:<br><br>

                Que, encontrándome cursando el <input type="text" name="ciclo" placeholder="ciclo académico" style="width: 100px;"> 
                ciclo de mi carrera profesional, y siendo requisito indispensable para mi formación académica el realizar 
                <input type="text" name="horas_practicas" placeholder="número de horas" style="width: 80px;"> horas de 
                prácticas <input type="text" name="modalidad_practica" placeholder="profesionales/pre-profesionales" style="width: 200px;"> 
                en el área de <input type="text" name="area_practica" placeholder="área específica" style="width: 200px;">, 
                <span class="negrita">SOLICITO</span> a su despacho tenga a bien autorizar mi ingreso para realizar dichas prácticas
                en esta prestigiosa institución.<br><br>

                Las prácticas tendrían una duración de <input type="text" name="duracion" placeholder="período de duración" style="width: 200px;">
                y estarían supervisadas por <input type="text" name="supervisor" placeholder="nombre del supervisor académico" style="width: 300px;">
                de mi casa de estudios.<br><br>

                <!-- Textarea para información adicional -->
                <textarea id="campoAmpliacion" rows="4" placeholder="Información adicional sobre las prácticas, horarios, objetivos específicos..." style="width: 100%; font-family: 'Times New Roman', serif; font-size: 16px; border: 1px solid #000; padding: 8px; resize: vertical;"></textarea>
                <div id="ampliacionTexto" style="display:none; white-space:pre-wrap; font-family:'Times New Roman', serif; font-size: 16px; margin-top:10px;"></div>
                    
                Me comprometo a cumplir con todas las normas y reglamentos de la institución, así como a mantener 
                la confidencialidad de la información a la que pudiera tener acceso durante el desarrollo de mis prácticas.<br><br>
                
                Por lo expuesto, pido a Usted acceder a mi solicitud por ser de justicia y necesidad académica.<br><br>
                Adjunto los documentos requeridos.
            </div>

            <div class="ubicacion-fecha">
                <input type="text" name="lugar" placeholder="Lugar" style="width: 150px;">, 
                <input type="text" name="dia" placeholder="Día" style="width: 40px;"> de 
                <input type="text" name="mes" placeholder="Mes" style="width: 120px;"> del 20<input type="text" name="anio" placeholder="Año" style="width: 40px;">
            </div>

            <div class="firma">
                <span>_______________________________________</span>
                <span><input type="text" name="nombres_apellidos" placeholder="NOMBRES Y APELLIDOS" style="width: 300px;"></span>
                <span>DNI N° <input type="text" name="firma_dni" placeholder="DNI" style="width: 150px;"></span>
                <span>Estudiante de <input type="text" name="carrera_firma" placeholder="Carrera" style="width: 200px;"></span>
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
        const textarea = document.getElementById('campoAmpliacion');
        const divTexto = document.getElementById('ampliacionTexto');

        divTexto.innerText = textarea.value;
        textarea.style.display = 'none';
        divTexto.style.display = 'block';
        contenedor.classList.remove('borde-visual');

        setTimeout(async () => {
            const opt = {
                margin: 0,
                filename: 'carta_practicas.pdf',
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
            link.download = 'carta_practicas_con_adjuntos.pdf';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);

            divTexto.style.display = 'none';
            textarea.style.display = 'block';
            contenedor.classList.add('borde-visual');
        }, 100);
    }
</script>

</body>
</html>