--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = mmov, pg_catalog;

--
-- Data for Name: bancos; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY bancos (idbancos, nombre_completo, nombre_abreviado, tipo_banco, tipo_capital, "año_fundacion", estatus) FROM stdin;
\.


--
-- Name: bancos_idbancos_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('bancos_idbancos_seq', 1, false);


--
-- Data for Name: cuentas_mmov; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY cuentas_mmov (idcuentas_mmov, bancos_idbancos, numero, tipo, titular, sucursal_apertura, fecha_apertura, estatus, nombre) FROM stdin;
\.


--
-- Data for Name: personas; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY personas (idpersonas, nombre, apellido, sexo, cedula, rif, nacionalidad, direccion, telefono) FROM stdin;
\.


--
-- Data for Name: dti; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY dti (iddti, personas_idpersonas) FROM stdin;
\.


--
-- Data for Name: rutas; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY rutas (idrutas, dti_personas_idpersonas, dti_iddti, nombre, codigo) FROM stdin;
\.


--
-- Data for Name: pdvs; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY pdvs (idpdvs, rutas_idrutas, nombre, direccion, tipo, responsable, telefono, rif) FROM stdin;
\.


--
-- Data for Name: cheques_devueltos; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY cheques_devueltos (idcheques_devueltos, cuentas_mmov_idcuentas_mmov, pdvs_idpdvs, bancos_idbancos, fecha_devolucion, num_cheque, monto) FROM stdin;
\.


--
-- Name: cheques_devueltos_idcheques_devueltos_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('cheques_devueltos_idcheques_devueltos_seq', 1, false);


--
-- Data for Name: fianza; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY fianza (idfianza, dti_personas_idpersonas, dti_iddti, limite_carga, limite_carga_asegurada, porcentaje_finaza, fianza_directa_sep) FROM stdin;
\.


--
-- Data for Name: comision_fianza; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY comision_fianza (idcomision_fianza, fianza_idfianza, comision, fecha) FROM stdin;
\.


--
-- Name: comision_fianza_idcomision_fianza_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('comision_fianza_idcomision_fianza_seq', 1, false);


--
-- Name: cuentas_mmov_idcuentas_mmov_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('cuentas_mmov_idcuentas_mmov_seq', 1, false);


--
-- Data for Name: empleados; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY empleados (idempleados, personas_idpersonas, fecha_ingreso, salario_mensual, cargo) FROM stdin;
\.


--
-- Data for Name: supervisor; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY supervisor (idsupervisor, empleados_personas_idpersonas, empleados_idempleados) FROM stdin;
\.


--
-- Data for Name: supervision; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY supervision (idsupervision, supervisor_empleados_idempleados, supervisor_empleados_personas_idpersonas, supervisor_idsupervisor, rutas_idrutas, fecha, ciudad, sector) FROM stdin;
\.


--
-- Data for Name: pdvs_has_supervision; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY pdvs_has_supervision (pdvs_idpdvs, supervision_idsupervision, fecha_ult_sup, fecha_ult_venta, monto_ult_venta) FROM stdin;
\.


--
-- Data for Name: productos; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY productos (idproductos, nombre, descripccion, tipo, monto_facial) FROM stdin;
\.


--
-- Data for Name: disponibilidad_supervision; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY disponibilidad_supervision (iddisponibilidad_supervision, pdvs_has_supervision_supervision_idsupervision, pdvs_has_supervision_pdvs_idpdvs, productos_idproductos, fecha_carga) FROM stdin;
\.


--
-- Name: disponibilidad_supervision_iddisponibilidad_supervision_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('disponibilidad_supervision_iddisponibilidad_supervision_seq', 1, false);


--
-- Name: dti_iddti_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('dti_iddti_seq', 1, false);


--
-- Data for Name: tipos_items; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY tipos_items (idtipos_items, item, descripcion, estatus) FROM stdin;
1	General	todos	A
\.


--
-- Data for Name: egresos; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY egresos (idegresos, tipos_items_idtipos_items, fecha_egreso, monto, fecha_carga, concepto) FROM stdin;
\.


--
-- Data for Name: egresos_administrativos; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY egresos_administrativos (idegresos_administrativos, cuentas_mmov_idcuentas_mmov, tipos_items_idtipos_items, fecha, monto, concepto, num_cheque, a_nombre, emisor) FROM stdin;
\.


--
-- Name: egresos_administrativos_idegresos_administrativos_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('egresos_administrativos_idegresos_administrativos_seq', 1, false);


--
-- Name: egresos_idegresos_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('egresos_idegresos_seq', 1, false);


--
-- Name: empleados_idempleados_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('empleados_idempleados_seq', 1, false);


--
-- Name: fianza_idfianza_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('fianza_idfianza_seq', 1, false);


--
-- Data for Name: formas_pago; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY formas_pago (idformas_pago, forma_pago, estatus) FROM stdin;
\.


--
-- Name: formas_pago_idformas_pago_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('formas_pago_idformas_pago_seq', 1, false);


--
-- Data for Name: reposicion_caja_chica; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY reposicion_caja_chica (idreposicion_caja_chica, fecha, estatus) FROM stdin;
1	2015-01-01	A
2	2015-01-01	A
3	2015-01-01	A
4	2015-01-01	A
6	2015-01-01	A
8	2015-01-01	A
10	2015-01-01	A
\.


--
-- Data for Name: gastos_caja_chica; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY gastos_caja_chica (idgastos_caja_chica, reposicion_caja_chica_idreposicion_caja_chica, tipos_items_idtipos_items, fecha, num_factura, concepto, monto, exento, base, iva) FROM stdin;
7	6	1	2015-03-03	Nota_1	a	100	100	0	0
9	8	1	2015-03-03	Fact_1	ab	123	0	108.239999999999995	14.7599999999999998
11	10	1	2015-03-03	Nota_123	ade	100	100	0	0
\.


--
-- Name: gastos_caja_chica_idgastos_caja_chica_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('gastos_caja_chica_idgastos_caja_chica_seq', 11, true);


--
-- Data for Name: ingresos; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY ingresos (idingresos, cuentas_mmov_idcuentas_mmov, fecha_ingreso, numero_ingreso, comisionista, ruta, operacion, cheque, efectivo, monto, fecha_carga, banco) FROM stdin;
\.


--
-- Name: ingresos_idingresos_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('ingresos_idingresos_seq', 1, false);


--
-- Data for Name: movimientos_bancos; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY movimientos_bancos (idmovimientos_bancos, cuentas_mmov_idcuentas_mmov, fecha, cod_descrip, descripcion, referencia, tipo_movimiento, monto) FROM stdin;
\.


--
-- Name: movimientos_bancos_idmovimientos_bancos_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('movimientos_bancos_idmovimientos_bancos_seq', 1, false);


--
-- Data for Name: pasivos_laborales; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY pasivos_laborales (idpasivos_laborales, empleados_personas_idpersonas, empleados_idempleados, fecha, sueldos, comisiones, bono_vacacional, utilidades, dias_salario) FROM stdin;
\.


--
-- Name: pasivos_laborales_idpasivos_laborales_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('pasivos_laborales_idpasivos_laborales_seq', 1, false);


--
-- Name: pdvs_idpdvs_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('pdvs_idpdvs_seq', 1, false);


--
-- Name: personas_idpersonas_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('personas_idpersonas_seq', 1, false);


--
-- Name: productos_idproductos_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('productos_idproductos_seq', 1, false);


--
-- Data for Name: ventas_telecard; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY ventas_telecard (idegresos_telecard, num_venta, vendedor, fecha, fecha_carga, cantidad_productos, monto) FROM stdin;
\.


--
-- Data for Name: productos_venta; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY productos_venta (idproductos_venta, ventas_telecard_idegresos_telecard, cantidad, producto, monto) FROM stdin;
\.


--
-- Name: productos_venta_idproductos_venta_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('productos_venta_idproductos_venta_seq', 1, false);


--
-- Name: reposicion_caja_chica_idreposicion_caja_chica_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('reposicion_caja_chica_idreposicion_caja_chica_seq', 1, false);


--
-- Data for Name: reposicion_cheques; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY reposicion_cheques (idrecuperacion_cheques, formas_pago_idformas_pago, cuentas_mmov_idcuentas_mmov, bancos_idbancos, cheques_devueltos_idcheques_devueltos, fecha_recuperacion, monto, referencia, tipo_reposicion, num_cheque_repo) FROM stdin;
\.


--
-- Name: reposicion_cheques_idrecuperacion_cheques_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('reposicion_cheques_idrecuperacion_cheques_seq', 1, false);


--
-- Name: rutas_idrutas_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('rutas_idrutas_seq', 1, false);


--
-- Data for Name: saldos_bancos; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY saldos_bancos (idsaldos_bancos, cuentas_mmov_idcuentas_mmov, disponible, fecha, diferido, bloqueado, fecha_carga) FROM stdin;
\.


--
-- Name: saldos_bancos_idsaldos_bancos_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('saldos_bancos_idsaldos_bancos_seq', 1, false);


--
-- Data for Name: saldos_telecard; Type: TABLE DATA; Schema: mmov; Owner: mmov
--

COPY saldos_telecard (idsaldos_telecard, cuentas_mmov_idcuentas_mmov, fecha, monto, banco, fecha_carga) FROM stdin;
\.


--
-- Name: saldos_telecard_idsaldos_telecard_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('saldos_telecard_idsaldos_telecard_seq', 1, false);


--
-- Name: supervision_idsupervision_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('supervision_idsupervision_seq', 1, false);


--
-- Name: supervisor_idsupervisor_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('supervisor_idsupervisor_seq', 1, false);


--
-- Name: tipos_items_idtipos_items_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('tipos_items_idtipos_items_seq', 1, true);


--
-- Name: ventas_telecard_idegresos_telecard_seq; Type: SEQUENCE SET; Schema: mmov; Owner: mmov
--

SELECT pg_catalog.setval('ventas_telecard_idegresos_telecard_seq', 1, false);


--
-- PostgreSQL database dump complete
--

