CREATE OR REPLACE PROCEDURE VITALIS_SCHEMA.enviar_comprobante_brevo (
    p_pld_id          IN NUMBER,
    p_nombre_completo IN VARCHAR2,
    p_email           IN VARCHAR2,
    p_periodo         IN VARCHAR2,
    p_ingresos        IN NUMBER,
    p_deducciones     IN NUMBER,
    p_neto            IN NUMBER
) AS
    v_subject   VARCHAR2(200);
    v_body_html CLOB;
BEGIN
    -- Asunto del correo
    v_subject := 'Comprobante de Pago - Periodo ' || p_periodo;

    -- Cuerpo HTML (puedes personalizarlo más adelante)
    v_body_html := '
    <html>
      <head>
        <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f6f8fa;
            color: #333;
            padding: 20px;
          }
          .card {
            background: #fff;
            border-radius: 10px;
            padding: 25px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            max-width: 600px;
            margin: auto;
          }
          h2 {
            color: #0069c0;
          }
          table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
          }
          th, td {
            text-align: left;
            padding: 8px;
          }
          th {
            background-color: #e3f2fd;
          }
          tr:nth-child(even) {
            background-color: #f2f2f2;
          }
          .footer {
            font-size: 12px;
            color: #777;
            margin-top: 20px;
            text-align: center;
          }
        </style>
      </head>
      <body>
        <div class="card">
          <h2>Comprobante de Pago</h2>
          <p>Estimado(a) <strong>'||p_nombre_completo||'</strong>,</p>
          <p>Le informamos que se ha generado su comprobante correspondiente al periodo <strong>'||p_periodo||'</strong>.</p>
          <table>
            <tr><th>Ingresos Totales</th><td>'||TO_CHAR(p_ingresos,'999G999G999D00')||' Colones</td></tr>
            <tr><th>Deducciones</th><td>'||TO_CHAR(p_deducciones,'999G999G999D00')||' Colones</td></tr>
            <tr><th>Neto a Recibir</th><td><strong>'||TO_CHAR(p_neto,'999G999G999D00')||' Colones</strong></td></tr>
          </table>
          <p>Gracias por su labor y compromiso con VITALIS.</p>
          <div class="footer">
            '||TO_CHAR(SYSDATE,'YYYY')||' VITALIS. Este mensaje fue generado automáticamente.
          </div>
        </div>
      </body>
    </html>';

    -- Enviar correo usando el package existente
    VITALIS_SCHEMA.PKG_BREVO_MAIL.send_mail(
        p_to        => p_email,
        p_subject   => v_subject,
        p_body_html => v_body_html
    );

    DBMS_OUTPUT.put_line('Comprobante enviado a ' || p_email || ' (pld_id='||p_pld_id||')');

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.put_line(' Error al enviar comprobante ('||p_email||'): '||SQLERRM);
        RAISE;
END enviar_comprobante_brevo;
/
