-- Taller Servicios SIG
-- Vista espacial de puntos administrativos
-- Sistema de referencia de salida: MAGNA-SIRGAS (EPSG:4686)
-- Conserva la tabla original con SRID 900914.

CREATE OR REPLACE VIEW public.puntos_administrativos_4686 AS
SELECT
    gid,
    nombre_geo,
    codigo_nom,
    symbol,
    proyecto,
    fecha,
    escala,
    ST_Force2D(
        ST_Transform(geom, 4686)
    )::geometry(Point, 4686) AS geom
FROM public.puntos_administrativos;