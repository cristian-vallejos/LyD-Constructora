json.extract! logloan, :id, :rut_solicitante, :nombre_solicitante, :obra, :cargo, :monto_solicitado, :numero_cuotas, :monto_pagado, :por_pagar, :motivo_solicitud, :comentarios, :estado, :created_at, :updated_at
json.url logloan_url(logloan, format: :json)
