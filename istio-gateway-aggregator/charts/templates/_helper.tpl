# templates/_helpers.tpl

{{- define "istio-gateway-aggregator.getEnv" -}}
{{- if not .Values.env }}
{{- fail ".Values.env is required (e.g., 'staging' or 'production')" }}
{{- end }}
{{- .Values.env }}
{{- end }}

{{- define "istio-gateway-aggregator.prefixedHost" -}}
{{- $env := include "istio-gateway-aggregator.getEnv" . -}}
{{- $prefix := ternary "staging." "" (ne $env "production") -}}
{{- printf "%s%s" $prefix .hostname -}}
{{- end }}