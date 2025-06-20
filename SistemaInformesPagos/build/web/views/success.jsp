<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Informe Generado</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
</head>
<body>
    <div class="success-message">
        <h1>¡Informe de Pago Generado Exitosamente!</h1>
        <p>Su informe de pago ha sido creado y está listo para descargar.</p>
    </div>
    
    <a href="${pageContext.request.contextPath}/assets/pdfs/${pdfNombre}" 
       class="download-btn" download>Descargar Informe PDF</a>
    <br><br>
    <a href="${pageContext.request.contextPath}/pago">Volver al formulario</a>
</body>
</html>