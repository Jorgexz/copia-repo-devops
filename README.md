# 🚀 Proyecto DevOps: Pipeline CI/CD, Contenerización y Orquestación (Evaluación Parcial N°2)

**Asignatura:** Ingeniería DevOps (DOY0101)  
**Institución:** Duoc UC  

---

## 📋 Tabla de Contenidos
1. [Descripción del Proyecto](#1-descripción-del-proyecto)
2. [Estrategia de Contenerización (IE1)](#2-estrategia-de-contenización-ie1)
3. [Pruebas Automatizadas y Políticas de Calidad (IE2)](#3-pruebas-automatizadas-y-políticas-de-calidad-ie2)
4. [Seguridad, Gobernanza y Bloqueos (IE3)](#4-seguridad-gobernanza-y-bloqueos-ie3)
5. [Despliegue Automático y Trazabilidad (IE4)](#5-despliegue-automatico-y-trazabilidad-ie4)
6. [Orquestación de Contenedores (IE5)](#6-orquestación-de-contenedores-ie5)
7. [Instrucciones de Ejecución Local](#7-instrucciones-de-ejecución-local)
8. [Declaración Ética de Uso de IA y Reflexiones Personales](#8-declaración-ética-de-uso-de-ia-y-reflexiones-personal)

---

## 1. Descripción del Proyecto
Este repositorio contiene la implementación integral del ciclo de vida de desarrollo automatizado (CI/CD) para el microservicio web del curso. La solución migra la aplicación hacia una arquitectura basada en contenedores modernos, garantizando alta disponibilidad, pruebas automatizadas de integración, análisis continuo de vulnerabilidades en la cadena de suministro de software y trazabilidad de extremo a extremo.

---

## 2. Estrategia de Contenerización (IE1)
Para cumplir con el uso eficaz de contenedores e imágenes optimizadas:
* **Imagen Base:** Se implementó **`nginx:alpine`**, una distribución ultraligera basada en Alpine Linux que minimiza el tamaño de almacenamiento de la imagen, optimiza los tiempos de transferencia en red y reduce drásticamente la superficie de ataque frente a vulnerabilidades.
* **Dockerfile:** Encapsula de forma limpia los elementos estáticos del microservicio hacia el directorio raíz de Nginx (`/usr/share/nginx/html`) y expone el puerto estándar HTTP (80).

---

## 3. Pruebas Automatizadas y Políticas de Calidad (IE2)
El pipeline de Integración Continua (CI) ejecuta validaciones estrictas antes de aprobar el empaquetado:
* **Validación Estática:** Comprobación automatizada de la existencia e integridad estructural del archivo `index.html`.
* **Smoke Test (Prueba Funcional):** El runner de GitHub Actions levanta la imagen recién construida en un entorno aislado y ejecuta una petición HTTP automatizada (`curl`). Si la aplicación no responde con un código de éxito **HTTP 200 OK**, el pipeline emite un error (`exit 1`) y se bloquea de inmediato.

---

## 4. Seguridad, Gobernanza y Bloqueos (IE3)
Para asegurar el cumplimiento de los estándares de seguridad en entornos con contenedores:
* **Dependabot:** Activado de forma nativa en GitHub para el monitoreo continuo y alertas automáticas de dependencias.
* **Análisis de Seguridad con Snyk:** Integrado dentro del pipeline de CI/CD analizando directamente la imagen de Docker mediante `snyk/actions/docker`. Está configurado con un umbral estricto (`--severity-threshold=high`) y políticas de bloqueo activo (`continue-on-error: false`) para impedir el paso de artefactos vulnerables.

---

## 5. Despliegue Automático y Trazabilidad (IE4)
El flujo automatiza la gestión de versiones y auditoría:
* **Trazabilidad por Commit:** Cada imagen generada es etiquetada unívocamente utilizando el hash SHA del commit (`${{ github.sha }}`) además de la etiqueta `latest`, lo que permite conocer con precisión milimétrica qué versión exacta del código fuente originó cada contenedor.

---

## 6. Orquestación de Contenedores (IE5)
Para gestionar soluciones escalables y asegurar la estabilidad operativa mediante **Docker Compose**:
* **Alta Disponibilidad:** Configuración de políticas de recuperación automática ante fallos (`restart: always`).
* **Verificaciones de Salud (Healthcheck):** Monitoreo continuo del estado operativo del servidor Nginx dentro del contenedor.
* **Límites de Recursos:** Restricciones estrictas de hardware (`deploy.resources.limits`) para CPU y memoria RAM, asegurando un desempeño eficiente y controlado.

---

## 7. Instrucciones de Ejecución Local
Para desplegar y verificar la solución en un entorno local:

1. Clonar el repositorio:
   ```bash
   git clone <url-del-repositorio>
   cd <nombre-de-la-carpeta>