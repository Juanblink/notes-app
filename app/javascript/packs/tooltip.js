document.addEventListener('DOMContentLoaded', function() {
    // Inicializar tooltip
    const elems = document.querySelectorAll('.tooltipped');
    const instances = M.Tooltip.init(elems);
  
    // Activar y desactivar el tooltip automáticamente cada segundo
    setInterval(() => {
      instances.forEach(instance => {
        instance.open();  // Mostrar el tooltip
        setTimeout(() => instance.close(), 500);  // Ocultar después de 500 ms
      });
    }, 1000);  // Repetir cada 1 segundo
  });