{{- define "istio-acl.getEnv" -}}
{{- if not .Values.env }}
{{- fail ".Values.env is required (e.g., 'staging' or 'production')" }}
{{- end }}
{{- .Values.env }}
{{- end }}
