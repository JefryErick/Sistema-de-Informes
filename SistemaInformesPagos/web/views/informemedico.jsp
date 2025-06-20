<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formulario de Solicitud - Sector Salud</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.10.1/html2pdf.bundle.min.js"></script>
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
            border: 2px solid #2e8b57;
            box-shadow: 0 0 10px rgba(46,139,87,0.2);
        }

        input[type="text"] {
            border: none;
            border-bottom: 1px solid #2e8b57;
            font-size: 16px;
            font-family: 'Times New Roman', serif;
            padding: 2px 4px;
        }

        h2, h3 {
            text-align: center;
            margin: 0;
            color: #1a5d3a;
        }

        .titulo-superior {
            text-align: center;
            font-size: 14px;
            margin: 10px 0 20px;
            color: #2e8b57;
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
            background-color: #2e8b57;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        button:hover {
            background-color: #1a5d3a;
        }

        .encabezado {
            background-color: #2e8b57;
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

        .seccion-medica {
            background-color: #f0f8f0;
            padding: 15px;
            border-left: 4px solid #2e8b57;
            margin: 20px 0;
        }

        .campo-medico {
            margin: 10px 0;
        }

        select {
            border: 1px solid #2e8b57;
            font-size: 16px;
            font-family: 'Times New Roman', serif;
            padding: 4px;
            background-color: white;
        }

        .urgencia {
            color: #d2691e;
            font-weight: bold;
        }

    </style>
</head>
<body>

<div class="encabezado">
    <div class="logo-titulo">
        <div style="width: 60px; height: 60px; background-color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center;">
            <span style="color: #2e8b57; font-size: 24px; font-weight: bold;">+</span>
        </div>
        <div class="texto-encabezado">
            <h1>SISTEMA DE GESTIÓN SANITARIA</h1>
            <p>Solicitud de Servicios de Salud</p>
        </div>
    </div>
</div>

<div>
    <div id="contenedor-pdf" class="contenedor borde-visual">
        <form id="formularioPDF">

            <h2>(<input type="text" name="modelo" placeholder="SOLICITUD MÉDICA" style="text-align:center; width: 300px;">)</h2>
            <h3>PARA SOLICITAR <input type="text" name="titulo" placeholder="Ej. CITA ESPECIALIZADA / EXAMEN MÉDICO" style="width: 400px;"></h3>

            <p class="titulo-superior">"<input type="text" name="anio_lema" placeholder="AÑO DE LA SALUD INTEGRAL Y BIENESTAR" style="width: 500px;">"</p>

            <div class="seccion-medica">
                <p><strong>TIPO DE SOLICITUD:</strong> 
                <select name="tipo_solicitud" style="width: 200px;">
                    <option value="">Seleccionar</option>
                    <option value="cita_medica">Cita Médica</option>
                    <option value="examen_laboratorio">Examen de Laboratorio</option>
                    <option value="procedimiento">Procedimiento Médico</option>
                    <option value="certificado">Certificado Médico</option>
                    <option value="referencia">Referencia a Especialista</option>
                    <option value="medicamentos">Solicitud de Medicamentos</option>
                    <option value="otro">Otro</option>
                </select></p>

                <p><strong>PRIORIDAD:</strong> 
                <select name="prioridad" style="width: 150px;">
                    <option value="">Seleccionar</option>
                    <option value="normal">Normal</option>
                    <option value="urgente">Urgente</option>
                    <option value="emergencia">Emergencia</option>
                </select></p>
            </div>

            <p><strong>DIRIGIDO A:</strong></p>
            <p><strong>Dr./Dra.</strong> <input type="text" name="doctor" placeholder="Nombre del médico o director" style="width: 300px;"><br>
                <input type="text" name="cargo" placeholder="Ej. Director del Centro de Salud / Médico Especialista" style="width: 400px;"><br>
                <input type="text" name="establecimiento" placeholder="Nombre del establecimiento de salud" style="width: 400px;"></p>

            <div class="alineado">
                YO <input type="text" name="nombre" placeholder="Nombres y Apellidos completos" style="width: 300px;">, identificado con
                DNI N° <input type="text" name="dni" placeholder="DNI" style="width: 150px;">, con N° de Historia Clínica 
                <input type="text" name="historia_clinica" placeholder="N° Historia Clínica (si aplica)" style="width: 150px;">,<br><br>
                
                domiciliado en: <input type="text" name="domicilio" placeholder="Dirección actual" style="width: 350px;"><br>
                <input type="text" name="direccion" placeholder="Referencia de ubicación" style="width: 400px;">, del Centro Poblado
                <input type="text" name="centro_poblado" placeholder="Nombre del centro poblado" style="width: 250px;">,<br>
                Distrito de <input type="text" name="distrito" placeholder="Distrito" style="width: 200px;">, 
                Provincia y Departamento de <input type="text" name="provincia" placeholder="Provincia y Departamento" style="width: 250px;">,<br><br>

                <div class="seccion-medica">
                    <div class="campo-medico">
                        <strong>EDAD:</strong> <input type="text" name="edad" placeholder="Edad" style="width: 60px;"> años &nbsp;&nbsp;&nbsp;
                        <strong>SEXO:</strong> 
                        <select name="sexo" style="width: 100px;">
                            <option value="">---</option>
                            <option value="M">Masculino</option>
                            <option value="F">Femenino</option>
                        </select>
                    </div>
                    <div class="campo-medico">
                        <strong>TELÉFONO:</strong> <input type="text" name="telefono" placeholder="Número de contacto" style="width: 150px;"> &nbsp;&nbsp;&nbsp;
                        <strong>SEGURO:</strong> <input type="text" name="seguro" placeholder="SIS/EsSalud/Privado/Ninguno" style="width: 200px;">
                    </div>
                </div>

                ante Ud. con el debido respeto me presento y <span class="negrita">SOLICITO</span> lo siguiente:<br><br>

                Que, por motivos de salud y necesidad médica, <span class="negrita">REQUIERO</span> que se me brinde
                la atención solicitada, para lo cual me comprometo a cumplir con todos los requisitos
                y protocolos establecidos por el establecimiento de salud, así como a cancelar
                los derechos correspondientes si fuera el caso.<br><br>

                <!-- Textarea para detalles médicos -->
                <strong>DETALLES ADICIONALES / MOTIVO DE LA SOLICITUD:</strong><br>
                <textarea id="campoAmpliacion" rows="6" placeholder="Describa síntomas, antecedentes relevantes, motivo específico de la solicitud médica..." style="width: 100%; font-family: 'Times New Roman', serif; font-size: 16px; border: 1px solid #2e8b57; padding: 8px; resize: vertical;"></textarea>
                <!-- Div oculto que se usará solo al exportar -->
                <div id="ampliacionTexto" style="display:none; white-space:pre-wrap; font-family:'Times New Roman', serif; font-size: 16px; margin-top:10px;"></div>
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
                <span style="font-size: 12px; margin-top: 10px;">
                    <input type="text" name="huella" placeholder="HUELLA DIGITAL (si no sabe firmar)" style="width: 250px; font-size: 12px;">
                </span>
            </div>

            <div style="margin-top: 30px; font-size: 12px; color: #666;">
                <p><strong>NOTA:</strong> Esta solicitud debe ser presentada con los documentos requeridos según el tipo de servicio solicitado.</p>
                <p><strong>Para consultas de emergencia, acudir directamente al servicio de urgencias.</strong></p>
            </div>

        </form>
    </div>

    <div class="boton-exportar">
        <button onclick="exportarPDF()">Exportar a PDF</button>
    </div>
        
</div>

<script>
    function exportarPDF() {
        const contenedor = document.getElementById('contenedor-pdf');
        const textarea = document.getElementById('campoAmpliacion');
        const divTexto = document.getElementById('ampliacionTexto');
        
        // Copia el texto del textarea al div (limpio, sin bordes)
        divTexto.innerText = textarea.value;
        // Oculta el textarea, muestra el div
        textarea.style.display = 'none';
        divTexto.style.display = 'block';
        // Quitamos la clase del borde
        contenedor.classList.remove('borde-visual');

        // Esperamos a que se actualice el DOM
        setTimeout(() => {
            const opt = {
                margin: 0,
                filename: 'solicitud-salud.pdf',
                image: { type: 'jpeg', quality: 0.98 },
                html2canvas: { scale: 3 },
                jsPDF: { unit: 'pt', format: 'a4', orientation: 'portrait' }
            };

            html2pdf().from(contenedor).set(opt).save().then(() => {
                // Volvemos a agregar la clase del borde
                divTexto.style.display = 'none';
                textarea.style.display = 'block';
                contenedor.classList.add('borde-visual');
            });
        }, 100);
    }
</script>

</body>
</html>