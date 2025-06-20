<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Carta de Recomendación</title>
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
            <h2>CARTA DE RECOMENDACIÓN</h2>

            <div class="ubicacion-fecha">
                <input type="text" name="lugar" placeholder="Corrales" style="width: 150px;">, 
                <input type="text" name="dia" placeholder="Día" style="width: 40px;"> de 
                <input type="text" name="mes" placeholder="Mes" style="width: 120px;"> del 20<input type="text" name="anio" placeholder="Año" style="width: 40px;">
            </div>

            <div class="alineado">
                <p><strong>A QUIEN CORRESPONDA:</strong></p>
                
                <p>Por medio de la presente, yo <input type="text" name="recomendante" placeholder="Nombre del recomendante" style="width: 300px;">, 
                con DNI N° <input type="text" name="dni_recomendante" placeholder="DNI" style="width: 150px;">, 
                en mi calidad de <input type="text" name="cargo_recomendante" placeholder="Cargo o profesión" style="width: 250px;">,</p>
                
                <p><strong>RECOMIENDO</strong> ampliamente a <input type="text" name="recomendado" placeholder="Nombre del recomendado" style="width: 300px;">, 
                identificado con DNI N° <input type="text" name="dni_recomendado" placeholder="DNI" style="width: 150px;">,</p>
                
                <p>por su <input type="text" name="cualidades" placeholder="responsabilidad, honestidad, capacidad profesional" style="width: 400px;">, 
                durante el tiempo que he tenido el gusto de conocerlo/a en <input type="text" name="contexto" placeholder="contexto donde se conocieron" style="width: 300px;">.</p>
                
                <p>Específicamente, puedo destacar las siguientes cualidades y logros:</p>
                
                <textarea id="campoAmpliacion" rows="8" placeholder="Detalle las cualidades específicas, logros y razones por las cuales recomienda a la persona. Por ejemplo:
- Excelente desempeño profesional
- Capacidad de liderazgo
- Responsabilidad y puntualidad
- Habilidades técnicas específicas
- Trabajos o proyectos destacados
- Cualidades personales relevantes" style="width: 100%; font-family: 'Times New Roman', serif; font-size: 16px; border: 1px solid #000; padding: 8px; resize: vertical;"></textarea>
                <div id="ampliacionTexto" style="display:none; white-space:pre-wrap; font-family:'Times New Roman', serif; font-size: 16px; margin-top:10px;"></div>
                
                <p>Por lo anteriormente expuesto, considero que <input type="text" name="nombre_recomendado_2" placeholder="nombre del recomendado" style="width: 250px;"> 
                será un valioso aporte para cualquier organización o institución que requiera sus servicios.</p>
                
                <p>Sin otro particular, y quedando a su disposición para cualquier información adicional que requieran, me despido de ustedes.</p>
                
                <p>Atentamente,</p>
            </div>

            <div class="firma">
                <span>_______________________________________</span>
                <span><input type="text" name="nombre_firma" placeholder="NOMBRES Y APELLIDOS" style="width: 300px;"></span>
                <span>DNI. N° <input type="text" name="dni_firma" placeholder="DNI" style="width: 150px;"></span>
                <span><input type="text" name="cargo_firma" placeholder="Cargo o Profesión" style="width: 250px;"></span>
                <span>Teléfono: <input type="text" name="telefono" placeholder="Número de contacto" style="width: 200px;"></span>
                <span>Email: <input type="text" name="email" placeholder="Correo electrónico" style="width: 250px;"></span>
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

        // Reemplazar textarea con div para la exportación
        divTexto.innerText = textarea.value;
        textarea.style.display = 'none';
        divTexto.style.display = 'block';
        contenedor.classList.remove('borde-visual');

        // Espera al renderizado DOM
        setTimeout(async () => {
            const opt = {
                margin: 0,
                filename: 'carta_recomendacion.pdf',
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
            link.download = 'carta_recomendacion_con_adjuntos.pdf';
            document.body.appendChild(link);
            link.click();
            document.body.removeChild(link);

            // Restaurar visualmente
            divTexto.style.display = 'none';
            textarea.style.display = 'block';
            contenedor.classList.add('borde-visual');
        }, 100);
    }
</script>

</body>
</html>