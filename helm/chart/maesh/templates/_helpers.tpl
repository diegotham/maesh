{{/* vim: set filetype=mustache: */}}

{{/*
Define the Chart version Label.
*/}}
{{- define "maesh.chartLabel" -}}
    {{- printf "%s-%s" .Chart.Name .Chart.Version -}}
{{- end -}}

{{/*
Define the templated image with tag.
*/}}
{{- define "maesh.controllerImage" -}}
    {{- printf "%s:%s" .Values.controller.image.name ( .Values.controller.image.tag | default .Chart.AppVersion ) -}}
{{- end -}}

{{/*
Define the templated mesh image with tag.
*/}}
{{- define "maesh.meshImage" -}}
    {{- printf "%s:%s" .Values.mesh.image.name ( .Values.mesh.image.tag | default "v2.3" ) -}}
{{- end -}}

{{/*
Define the watchNamespaces List.
*/}}
{{- define "maesh.controllerWatchNamespaces" -}}
    --watchNamespaces=
    {{- range $idx, $ns := .Values.controller.watchNamespaces }}
        {{- if $idx }},{{ end }}
            {{- $ns }}
    {{- end -}}
{{- end -}}

{{/*
Define the ignoreNamespaces List.
*/}}
{{- define "maesh.controllerIgnoreNamespaces" -}}
    --ignoreNamespaces=
    {{- range $idx, $ns := .Values.controller.ignoreNamespaces }}
        {{- if $idx }},{{ end }}
            {{- $ns }}
    {{- end -}}
{{- end -}}
