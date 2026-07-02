<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>SignLearn — Registro</title>
  <link rel="preconnect" href="https://fonts.googleapis.com" />
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet" />
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    :root {
      --azul: #1e40af;
      --azul-claro: #3b82f6;
      --amarillo: #f0b100;
      --texto: #1e293b;
      --suave: #64748b;
      --fondo: #f8fafc;
      --borde: #e2e8f0;
    }
    body { font-family: "Inter", sans-serif; background: var(--fondo); color: var(--texto); min-height: 100vh; display: flex; flex-direction: column; }
    header { background: var(--azul); padding: 16px 24px; display: flex; justify-content: space-between; align-items: center; }
    .logo { color: white; font-size: 20px; font-weight: 800; }
    .badge { color: var(--amarillo); font-size: 12px; font-weight: 600; border: 1px solid var(--amarillo); padding: 4px 12px; border-radius: 20px; }
    main { flex: 1; display: flex; align-items: center; justify-content: center; padding: 40px 20px; }
    .card { background: white; border-radius: 24px; box-shadow: 0 8px 30px rgba(0,0,0,0.08); padding: 36px; width: 100%; max-width: 480px; }
    .card h2 { font-size: 22px; font-weight: 800; text-align: center; color: var(--texto); }
    .card p { text-align: center; color: var(--suave); font-size: 14px; margin-top: 6px; margin-bottom: 24px; }
    .input-group { margin-bottom: 16px; }
    .input-group label { display: block; font-size: 13px; font-weight: 600; margin-bottom: 6px; color: var(--texto); }
    .input-group input { width: 100%; padding: 12px 14px; border: 1px solid var(--borde); border-radius: 10px; font-size: 14px; font-family: "Inter", sans-serif; outline: none; transition: border-color 0.2s; }
    .input-group input:focus { border-color: var(--azul-claro); }
    .btn { width: 100%; padding: 14px; background: var(--azul); color: white; border: none; border-radius: 10px; font-size: 15px; font-weight: 700; cursor: pointer; margin-top: 8px; font-family: "Inter", sans-serif; transition: background 0.2s; }
    .btn:hover { background: #1e3a8a; }
    .mensaje { margin-top: 16px; padding: 12px 16px; border-radius: 10px; font-size: 14px; text-align: center; display: none; }
    .exito { background: #dcfce7; color: #166534; display: block; }
    .error { background: #fee2e2; color: #991b1b; display: block; }
    footer { background: var(--texto); padding: 16px; text-align: center; color: rgba(255,255,255,0.6); font-size: 12px; }
  </style>
</head>
<body>
  <header>
    <div class="logo">👋 SignLearn</div>
    <span class="badge">Registro de usuarios</span>
  </header>
  <main>
    <div class="card">
      <h2>Crear cuenta</h2>
      <p>Completa el formulario para registrarte en SignLearn</p>
      <% if (request.getAttribute("mensaje") != null) { %>
        <div class="mensaje <%= (Boolean)request.getAttribute("exito") ? "exito" : "error" %>">
          <%= request.getAttribute("mensaje") %>
        </div>
      <% } %>
      <form action="registro" method="POST">
        <div class="input-group">
          <label>Documento de Identidad</label>
          <input type="text" name="documento" placeholder="Ej: 1234567890" required />
        </div>
        <div class="input-group">
          <label>Nombres</label>
          <input type="text" name="nombres" placeholder="Tus nombres" required />
        </div>
        <div class="input-group">
          <label>Apellidos</label>
          <input type="text" name="apellidos" placeholder="Tus apellidos" required />
        </div>
        <div class="input-group">
          <label>Correo Electrónico</label>
          <input type="email" name="correo" placeholder="tu@correo.com" required />
        </div>
        <div class="input-group">
          <label>Teléfono de Contacto</label>
          <input type="tel" name="telefono" placeholder="Ej: 3001234567" required />
        </div>
        <button type="submit" class="btn">Registrarme</button>
      </form>
    </div>
  </main>
  <footer>© 2026 SignLearn · Alfred Vásquez · GA7-220501096-AA2-EV01</footer>
</body>
</html>
