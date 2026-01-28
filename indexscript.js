// Esperamos a que el documento esté listo
document.addEventListener('DOMContentLoaded', () => {
    
    // Seleccionamos el botón y los campos
    const botonLogin = document.querySelector('.btn-login');
    const emailInput = document.querySelector('input[type="email"]');
    const passwordInput = document.querySelector('input[type="password"]');

    // Escuchamos el clic en el botón
    botonLogin.addEventListener('click', (e) => {
        // Evitamos que el formulario se envíe solo
        e.preventDefault();

        // Obtenemos los valores y quitamos espacios extra
        const email = emailInput.value.trim();
        const password = passwordInput.value.trim();

        // Validación básica
        if (email === "" || password === "") {
            alert("⚠️ Por favor, completa todos los campos.");
            return;
        }

        // Validación de formato de correo simple
        if (!email.includes("@")) {
            alert("⚠️ Ingresa un correo electrónico válido.");
            return;
        }

        // Simulación de inicio de sesión
        console.log("Datos enviados:", { email, password });
        alert("✅ ¡Bienvenido al Sistema de Peticiones de Grupo Roca!");
        
        // Aquí podrías redireccionar a otra página:
        // window.location.href = "inicio.html";
    });
});