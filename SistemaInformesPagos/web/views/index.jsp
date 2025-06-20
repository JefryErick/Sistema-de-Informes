<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Sistema de Informes de Pago y documentos oficiales">
    <meta name="theme-color" content="#1a73e8">
    <!-- Favicon -->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/views/favicon.png">
    <title>Sistema de Gestion de Informes</title>
    <!-- Font Awesome con versión específica, cargado con defer para mejor rendimiento -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer">
    <!-- Preconectar a dominios externos para mejorar el rendimiento -->
    <link rel="preconnect" href="https://cdnjs.cloudflare.com">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/styles.css">
    <!-- Meta para prevenir almacenamiento en caché en páginas sensibles -->
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
</head>
<body>
    <header class="header">
        <div class="container">
            <div class="logo-container">
                <img src="${pageContext.request.contextPath}/views/InformesLogo.png" alt="Logo del Sistema de Informes" class="logo" width="50" height="50">
                <h1>SISTEMA DE GESTION DE INFORMES</h1>
            </div>
            <button type="button" class="menu-toggle" id="mobile-menu" aria-label="Menú" aria-expanded="false">
                <span class="bar"></span>
                <span class="bar"></span>
                <span class="bar"></span>
            </button>
            <nav class="menu" aria-label="Menú principal">
                <div class="menu-container">
                    <div class="menu-rows">
                        <ul class="menu-row">
                            <li><a href="${pageContext.request.contextPath}/views/pagos.jsp" class="active"><i class="fas fa-file-invoice-dollar"></i> INFORME DE PAGOS</a></li>
                            <li><a href="${pageContext.request.contextPath}/views/solicitud.jsp"><i class="fas fa-file-signature"></i> SOLICITUD</a></li>
                            <li><a href="${pageContext.request.contextPath}/views/carta_recomendacion.jsp"><i class="fas fa-envelope-open-text"></i> CARTA RECOMENDACIÓN</a></li>
                            <li><a href="${pageContext.request.contextPath}/views/reclamo.jsp"><i class="fas fa-exclamation-triangle"></i> RECLAMO</a></li>
                        </ul>
                        <ul class="menu-row">
                            <li><a href="${pageContext.request.contextPath}/views/carta_parcticas.jsp"><i class="fas fa-briefcase"></i> CARTA PRÁCTICAS</a></li>
                            <li><a href="${pageContext.request.contextPath}/views/acta_comp.jsp"><i class="fas fa-handshake"></i> ACTA COMPROMISO</a></li>
                            <li><a href="${pageContext.request.contextPath}/views/licen_func.jsp"><i class="fas fa-building"></i> LICENCIA FUNCIONAMIENTO</a></li>
                            <li><a href="${pageContext.request.contextPath}/views/informemedico.jsp"><i class="fas fa-file-medical-alt"></i> FORMATO ESSALUD</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    
    <main class="main-content">
        <div class="login-container">
            <div class="login-box">
                <div class="login-header">
                    <i class="fas fa-shield-alt user-icon" aria-hidden="true"></i>
                    <h2>Acceso Seguro</h2>
                    <p class="login-subtitle">Ingresa con tu correo y código de verificación</p>
                </div>
                
                <% if(request.getAttribute("error") != null) { %>
                <div class="alert alert-error" role="alert">
                    <i class="fas fa-exclamation-circle" aria-hidden="true"></i> ${error}
                </div>
                <% } %>
                
                <% if(request.getAttribute("success") != null) { %>
                <div class="alert alert-success" role="alert">
                    <i class="fas fa-check-circle" aria-hidden="true"></i> ${success}
                </div>
                <% } %>
                
                <!-- Paso 1: Solicitud de correo -->
                <div id="email-step" class="login-step active">
                    <form id="email-form" action="${pageContext.request.contextPath}/sendOTP" method="POST" novalidate>
                        <div class="input-group">
                            <label for="email" class="visually-hidden">Correo electrónico</label>
                            <div class="input-icon">
                                <i class="fas fa-envelope" aria-hidden="true"></i>
                                <input type="email" id="email" name="email" placeholder="Ingrese su correo electrónico" required 
                                       aria-required="true" autocomplete="email" spellcheck="false">
                            </div>
                            <div id="email-error" class="error-message" aria-live="polite"></div>
                        </div>
                        <button type="submit" class="btn-login">
                            <i class="fas fa-paper-plane" aria-hidden="true"></i> Enviar Código de Verificación
                        </button>
                    </form>
                </div>
                
                <!-- Paso 2: Verificación de código OTP -->
                <div id="otp-step" class="login-step">
                    <form id="otp-form" action="${pageContext.request.contextPath}/verifyOTP" method="POST">
                        <input type="hidden" id="email-confirm" name="email" value="">
                        
                        <div class="input-group">
                            <label for="otp-box">Ingrese el código enviado a su correo:</label>
                            <div id="otp-box" class="otp-container">
                                <input type="text" maxlength="1" class="otp-input" data-index="1" aria-label="Primer dígito" inputmode="numeric" pattern="[0-9]">
                                <input type="text" maxlength="1" class="otp-input" data-index="2" aria-label="Segundo dígito" inputmode="numeric" pattern="[0-9]">
                                <input type="text" maxlength="1" class="otp-input" data-index="3" aria-label="Tercer dígito" inputmode="numeric" pattern="[0-9]">
                                <input type="text" maxlength="1" class="otp-input" data-index="4" aria-label="Cuarto dígito" inputmode="numeric" pattern="[0-9]">
                                <input type="text" maxlength="1" class="otp-input" data-index="5" aria-label="Quinto dígito" inputmode="numeric" pattern="[0-9]">
                                <input type="text" maxlength="1" class="otp-input" data-index="6" aria-label="Sexto dígito" inputmode="numeric" pattern="[0-9]">
                                <input type="hidden" id="otp-code" name="otpCode">
                            </div>
                            <div id="otp-error" class="error-message" aria-live="polite"></div>
                        </div>
                        
                        <div class="otp-timer" aria-live="polite">
                            <p>El código expira en: <span id="countdown">05:00</span></p>
                        </div>
                        
                        <div class="otp-actions">
                            <button type="submit" class="btn-login">
                                <i class="fas fa-lock-open" aria-hidden="true"></i> Verificar e Ingresar
                            </button>
                            <button type="button" id="resend-btn" class="btn-secondary" disabled>
                                <i class="fas fa-sync-alt" aria-hidden="true"></i> Reenviar Código <span id="resend-timer">(60s)</span>
                            </button>
                        </div>
                    </form>
                    <div class="back-to-email">
                        <a href="#" id="back-btn"><i class="fas fa-arrow-left" aria-hidden="true"></i> Cambiar correo electrónico</a>
                    </div>
                </div>
            </div>
        </div>
    </main>
    
    <footer class="footer">
        <div class="container">
            <div class="footer-content">
                <div class="contact-info">
                    <h3><i class="fas fa-address-book" aria-hidden="true"></i> Contactos</h3>
                    <p><i class="fas fa-phone" aria-hidden="true"></i> Teléfono: <a href="https://wa.me/51931113015">976969824</a></p>
                    <p><i class="fas fa-envelope" aria-hidden="true"></i> Email: <a href="mailto:jefryerickq@gmail.com">jefryerickq@gmail.com</a></p>
                    <p><i class="fas fa-map-marker-alt" aria-hidden="true"></i> Dirección: <a href="https://www.google.com/maps/place/Universidad+Nacional+del+Altiplano+Puno/@-15.8243786,-70.0523891,14z/data=!4m10!1m2!2m1!1sunap!3m6!1s0x915d69babb63e6cf:0xf24057bf79de0852!8m2!3d-15.8243805!4d-70.0162544!15sCgR1bmFwIgOIAQGSARFwdWJsaWNfdW5pdmVyc2l0eaoBSAoNL2cvMTFoMTV4cXZyZgoLL2cvMTIzYjQzX3EQATIeEAEiGrOmLCQKkqfXLZDVmMSVR3KnwjjaTsjeO651MggQAiIEdW5hcOABAA!16s%2Fg%2F123b43_q?hl=es&entry=ttu&g_ep=EgoyMDI1MDUxNS4xIKXMDSoASAFQAw%3D%3D" target="_blank" rel="noopener">Unap, Puno</a></p>
                </div>
                <div class="social-media">
                    <h3>Síguenos</h3>
                    <div class="social-icons">
                        <a href="https://www.facebook.com/share/1BpmQADY3m/" class="social-icon" aria-label="Facebook"><i class="fab fa-facebook-f" aria-hidden="true"></i></a>
                        <a href="https://x.com/informes33" class="social-icon" aria-label="Twitter"><i class="fab fa-twitter" aria-hidden="true"></i></a>
                        <a href="https://www.linkedin.com/in/sistema-de-informes-empresa-5b5840370/" class="social-icon" aria-label="LinkedIn"><i class="fab fa-linkedin-in" aria-hidden="true"></i></a>
                    </div>
                </div>
            </div>
            <div class="copyright">
                <p>&copy; <span id="current-year">2023</span> Sistema de Informes. Todos los derechos reservados.</p>
            </div>
        </div>
    </footer>
    
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // Actualizar el año en el copyright automáticamente
            document.getElementById('current-year').textContent = new Date().getFullYear();

            const emailStep = document.getElementById('email-step');
            const otpStep = document.getElementById('otp-step');
            const emailForm = document.getElementById('email-form');
            const emailInput = document.getElementById('email');
            const emailConfirm = document.getElementById('email-confirm');
            const backBtn = document.getElementById('back-btn');
            const resendBtn = document.getElementById('resend-btn');
            const otpInputs = document.querySelectorAll('.otp-input');
            const otpCodeInput = document.getElementById('otp-code');
            const emailError = document.getElementById('email-error');
            const otpError = document.getElementById('otp-error');
            const mobileMenu = document.getElementById('mobile-menu');
            const menu = document.querySelector('.menu');
            
            // Manejar menú móvil
            mobileMenu.addEventListener('click', function() {
                this.classList.toggle('active');
                menu.classList.toggle('active');
                
                // Actualizar el estado de aria-expanded
                const expanded = this.getAttribute('aria-expanded') === 'true' || false;
                this.setAttribute('aria-expanded', !expanded);
            });
            
            // Validación del email
            function validateEmail(email) {
                const re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
                return re.test(String(email).toLowerCase());
            }
            
            // Validación de formulario de correo
            emailForm.addEventListener('submit', function(e) {
                // Validar el correo antes de enviar
                if (!validateEmail(emailInput.value)) {
                    e.preventDefault();
                    emailError.textContent = 'Por favor, ingrese un correo electrónico válido';
                    emailInput.classList.add('input-error');
                    emailInput.focus();
                    return false;
                } else {
                    emailError.textContent = '';
                    emailInput.classList.remove('input-error');
                    
                    // Guardar el email para el paso OTP
                    emailConfirm.value = emailInput.value;
                    
                    // Mostrar un indicador de carga
                    const submitBtn = this.querySelector('button[type="submit"]');
                    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Enviando...';
                    submitBtn.disabled = true;
                    
                    // En un entorno real, el servidor respondería y mostraría el paso OTP
                    // Para fines de demostración, simulamos la transición
                    // Comentar estas líneas en producción
                    /*
                    e.preventDefault();
                    setTimeout(() => {
                        emailStep.classList.remove('active');
                        otpStep.classList.add('active');
                        startCountdown();
                        startResendTimer();
                        otpInputs[0].focus();
                        submitBtn.innerHTML = '<i class="fas fa-paper-plane"></i> Enviar Código de Verificación';
                        submitBtn.disabled = false;
                    }, 1500);
                    */
                }
            });
            
            // Evento para regresar al paso de email
            backBtn.addEventListener('click', function(e) {
                e.preventDefault();
                otpStep.classList.remove('active');
                emailStep.classList.add('active');
                
                // Limpiar los campos OTP
                otpInputs.forEach(input => {
                    input.value = '';
                });
                otpCodeInput.value = '';
                otpError.textContent = '';
                
                // Enfocar el campo de email
                emailInput.focus();
            });
            
            // Mejorar la entrada de OTP
            otpInputs.forEach(input => {
                // Aceptar solo números
                input.addEventListener('input', function(e) {
                    // Reemplazar cualquier caracter no numérico
                    this.value = this.value.replace(/[^0-9]/g, '');
                    
                    const index = parseInt(this.getAttribute('data-index'));
                    
                    // Mover al siguiente campo cuando hay un valor
                    if (this.value && index < 6) {
                        otpInputs[index].focus();
                    }
                    
                    // Actualizar el valor OTP completo
                    updateOtpValue();
                });
                
                input.addEventListener('keydown', function(e) {
                    const index = parseInt(this.getAttribute('data-index'));
                    
                    // Si se presiona retroceso en un campo vacío, enfocar el campo anterior
                    if (e.key === 'Backspace' && !this.value && index > 1) {
                        otpInputs[index - 2].focus();
                        e.preventDefault();
                    }
                    
                    // Si se presiona la flecha izquierda, moverse al campo anterior
                    if (e.key === 'ArrowLeft' && index > 1) {
                        otpInputs[index - 2].focus();
                        e.preventDefault();
                    }
                    
                    // Si se presiona la flecha derecha, moverse al campo siguiente
                    if (e.key === 'ArrowRight' && index < 6) {
                        otpInputs[index].focus();
                        e.preventDefault();
                    }
                });
                
                // Permitir el pegado del código completo
                input.addEventListener('paste', function(e) {
                    e.preventDefault();
                    const pasteData = e.clipboardData.getData('text').trim();
                    
                    // Verificar si los datos pegados son números y tienen el largo adecuado
                    if (pasteData.length >= 6 && /^\d+$/.test(pasteData)) {
                        for (let i = 0; i < 6; i++) {
                            if (i < pasteData.length) {
                                otpInputs[i].value = pasteData.charAt(i);
                            }
                        }
                        updateOtpValue();
                        otpInputs[5].focus();
                    }
                });
            });
            
            // Función para actualizar el valor OTP completo
            function updateOtpValue() {
                let otp = '';
                let isComplete = true;
                
                otpInputs.forEach(input => {
                    otp += input.value;
                    if (!input.value) {
                        isComplete = false;
                    }
                });
                
                otpCodeInput.value = otp;
                
                // Aplicar validación visual
                if (isComplete) {
                    otpError.textContent = '';
                    otpInputs.forEach(input => input.classList.remove('input-error'));
                }
                
                return isComplete;
            }
            
            // Validación del formulario OTP
            document.getElementById('otp-form').addEventListener('submit', function(e) {
                if (!updateOtpValue() || otpCodeInput.value.length !== 6) {
                    e.preventDefault();
                    otpError.textContent = 'Por favor, complete todos los dígitos del código';
                    otpInputs.forEach(input => {
                        if (!input.value) {
                            input.classList.add('input-error');
                        }
                    });
                    otpInputs[0].focus();
                    return false;
                }
                
                // Mostrar indicador de carga
                const submitBtn = this.querySelector('button[type="submit"]');
                submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Verificando...';
                submitBtn.disabled = true;
            });
            
            // Temporizador de cuenta regresiva mejorado
            function startCountdown() {
                let totalSeconds = 5 * 60; // 5 minutos
                const countdownEl = document.getElementById('countdown');
                const warningTime = 60; // Segundos para mostrar advertencia
                
                const interval = setInterval(function() {
                    totalSeconds--;
                    
                    if (totalSeconds <= 0) {
                        clearInterval(interval);
                        countdownEl.textContent = "Expirado";
                        countdownEl.classList.add('expired');
                        
                        // Deshabilitar los campos OTP y el botón de envío
                        otpInputs.forEach(input => {
                            input.disabled = true;
                        });
                        document.querySelector('#otp-form button[type="submit"]').disabled = true;
                        
                        // Mensaje de expiración
                        otpError.textContent = 'El código ha expirado. Por favor, solicite uno nuevo.';
                        
                        // Habilitar el botón de reenvío
                        resendBtn.disabled = false;
                        document.getElementById('resend-timer').textContent = '';
                        
                        return;
                    }
                    
                    // Mostrar advertencia cuando queda poco tiempo
                    if (totalSeconds <= warningTime && !countdownEl.classList.contains('warning')) {
                        countdownEl.classList.add('warning');
                    }
                    
                    // Formatear tiempo
                    const minutes = Math.floor(totalSeconds / 60).toString().padStart(2, '0');
                    const seconds = (totalSeconds % 60).toString().padStart(2, '0');
                    countdownEl.textContent = `${minutes}:${seconds}`;
                }, 1000);
                
                // Almacenar el ID del intervalo para limpiarlo si es necesario
                window.countdownInterval = interval;
            }
            
            // Temporizador para habilitar el botón de reenvío
            function startResendTimer() {
                let seconds = 60;
                const timerEl = document.getElementById('resend-timer');
                
                resendBtn.disabled = true;
                
                const interval = setInterval(function() {
                    seconds--;
                    
                    if (seconds <= 0) {
                        clearInterval(interval);
                        timerEl.textContent = '';
                        resendBtn.disabled = false;
                        return;
                    }
                    
                    timerEl.textContent = `(${seconds}s)`;
                }, 1000);
                
                // Almacenar el ID del intervalo
                window.resendInterval = interval;
                
                // Manejar el reenvío
                resendBtn.addEventListener('click', function() {
                    if (!this.disabled) {
                        // Mostrar indicador de carga
                        this.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Enviando...';
                        this.disabled = true;
                        
                        // Aquí iría la lógica para reenviar el código
                        // Para la demostración, simulamos el reenvío
                        setTimeout(() => {
                            this.innerHTML = '<i class="fas fa-sync-alt"></i> Reenviar Código <span id="resend-timer">(60s)</span>';
                            
                            // Reiniciar campos OTP
                            otpInputs.forEach(input => {
                                input.value = '';
                                input.disabled = false;
                            });
                            otpCodeInput.value = '';
                            
                            // Reiniciar el temporizador de cuenta regresiva
                            if (window.countdownInterval) {
                                clearInterval(window.countdownInterval);
                            }
                            startCountdown();
                            
                            // Reiniciar el temporizador de reenvío
                            startResendTimer();
                            
                            // Restablecer el botón de envío y quitar el error
                            document.querySelector('#otp-form button[type="submit"]').disabled = false;
                            otpError.textContent = '';
                            
                            // Mostrar mensaje de éxito temporal
                            const successMsg = document.createElement('div');
                            successMsg.className = 'alert alert-success';
                            successMsg.innerHTML = '<i class="fas fa-check-circle"></i> Nuevo código enviado correctamente.';
                            successMsg.setAttribute('role', 'alert');
                            document.querySelector('.login-header').insertAdjacentElement('afterend', successMsg);
                            
                            // Eliminar el mensaje después de unos segundos
                            setTimeout(() => {
                                successMsg.remove();
                            }, 5000);
                            
                            // Enfocar el primer campo OTP
                            otpInputs[0].focus();
                        }, 1500);
                    }
                });
            }
            
            // Detectar inactividad y cerrar sesión después de cierto tiempo
            let inactivityTime = function() {
                let time;
                const resetTimer = function() {
                    clearTimeout(time);
                    time = setTimeout(logout, 30 * 60 * 1000); // 30 minutos de inactividad
                };
                
                const logout = function() {
                    // Redirigir a la página de cierre de sesión
                    // window.location.href = '${pageContext.request.contextPath}/logout';
                    alert('Su sesión ha expirado por inactividad. Por favor, inicie sesión nuevamente.');
                    location.reload();
                };
                
                // Eventos para reiniciar el temporizador
                window.onload = resetTimer;
                document.onmousemove = resetTimer;
                document.onkeypress = resetTimer;
                document.onclick = resetTimer;
                document.ontouchstart = resetTimer;
            };
            
            // Iniciar el temporizador de inactividad
            inactivityTime();
        });
    </script>
</body>
</html>