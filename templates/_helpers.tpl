{{/*
Expand the name of the chart.
*/}}
{{- define "alerta-helm.chartName" -}}
{{- .Chart.Name | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified appname and namespace.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "alerta-helm.name" -}}
{{- .Values.name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- define "alerta-helm.namespace" -}}
{{- .Values.namespace | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "alerta-helm.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- define "alerta-helm.labels" -}}
app: {{ include "alerta-helm.name" . }}
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
app: {{ include "alerta-helm.name" . }}
app.kubernetes.io/name: {{ include "alerta-helm.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "alerta-helm.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "alerta-helm.name" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
