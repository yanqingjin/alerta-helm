{{/*
Chart name, app name, namespace
*/}}
{{- define "alerta-helm.name" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- define "alerta-helm.appname" -}}
read: {{- .Values.read.name | trunc 63 | trimSuffix "-" }}
write: {{- .Values.write.name | trunc 63 | trimSuffix "-" }}
web: {{- .Values.web.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- define "alerta-helm.namespace" -}}
{{- .Values.namespace | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "alerta-helm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "alerta-helm.labels" -}}
helm.sh/chart: {{ include "alerta-helm.chart" . }}
{{ include "alerta-helm.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "alerta-helm.selectorLabels" -}}
app.kubernetes.io/name: {{ include "alerta-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{* {{/*
Create the name of the service account to use
*/}}
{{- define "alerta-helm.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "alerta-helm.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }} *}
