CREATE TABLE productos (
  idproductos SERIAL  NOT NULL ,
  nombre VARCHAR    ,
  descripccion VARCHAR    ,
  tipo VARCHAR    ,
  monto_facial INTEGER      ,
PRIMARY KEY(idproductos));




CREATE TABLE formas_pago (
  idformas_pago SERIAL  NOT NULL ,
  forma_pago VARCHAR    ,
  estatus CHAR  DEFAULT 'A'    ,
PRIMARY KEY(idformas_pago));




CREATE TABLE personas (
  idpersonas SERIAL  NOT NULL ,
  nombre VARCHAR    ,
  apellido VARCHAR    ,
  sexo VARCHAR    ,
  cedula INTEGER    ,
  rif VARCHAR    ,
  nacionalidad VARCHAR    ,
  direccion VARCHAR    ,
  telefono INTEGER      ,
PRIMARY KEY(idpersonas));




CREATE TABLE reposicion_caja_chica (
  idreposicion_caja_chica SERIAL  NOT NULL ,
  fecha DATE    ,
  estatus CHAR      ,
PRIMARY KEY(idreposicion_caja_chica));




CREATE TABLE bancos (
  idbancos SERIAL  NOT NULL ,
  nombre_completo VARCHAR   NOT NULL ,
  nombre_abreviado VARCHAR    ,
  tipo_banco VARCHAR    ,
  tipo_capital VARCHAR    ,
  año_fundacion VARCHAR    ,
  estatus CHAR  DEFAULT 'A'    ,
PRIMARY KEY(idbancos));




CREATE TABLE ventas_telecard (
  idegresos_telecard SERIAL  NOT NULL ,
  num_venta INTEGER    ,
  vendedor VARCHAR    ,
  fecha DATE    ,
  fecha_carga TIMESTAMP  DEFAULT CURRENT_DATE  ,
  cantidad_productos INTEGER    ,
  monto FLOAT      ,
PRIMARY KEY(idegresos_telecard));




CREATE TABLE tipos_items (
  idtipos_items SERIAL  NOT NULL ,
  item VARCHAR    ,
  descripcion VARCHAR    ,
  estatus CHAR      ,
PRIMARY KEY(idtipos_items));




CREATE TABLE productos_venta (
  idproductos_venta SERIAL  NOT NULL ,
  ventas_telecard_idegresos_telecard INTEGER   NOT NULL ,
  cantidad INTEGER    ,
  producto VARCHAR    ,
  monto FLOAT      ,
PRIMARY KEY(idproductos_venta)  ,
  FOREIGN KEY(ventas_telecard_idegresos_telecard)
    REFERENCES ventas_telecard(idegresos_telecard));


CREATE INDEX productos_venta_FKIndex1 ON productos_venta (ventas_telecard_idegresos_telecard);


CREATE INDEX IFK_Rel_16 ON productos_venta (ventas_telecard_idegresos_telecard);


CREATE TABLE DTI (
  idDTI SERIAL  NOT NULL ,
  personas_idpersonas INTEGER   NOT NULL   ,
PRIMARY KEY(idDTI, personas_idpersonas)  ,
  FOREIGN KEY(personas_idpersonas)
    REFERENCES personas(idpersonas));


CREATE INDEX DTI_FKIndex1 ON DTI (personas_idpersonas);


CREATE INDEX IFK_Rel_10 ON DTI (personas_idpersonas);


CREATE TABLE egresos (
  idegresos SERIAL  NOT NULL ,
  tipos_items_idtipos_items INTEGER   NOT NULL ,
  fecha_egreso INTEGER    ,
  monto FLOAT    ,
  fecha_carga TIMESTAMP  DEFAULT CURRENT_DATE  ,
  concepto VARCHAR      ,
PRIMARY KEY(idegresos)  ,
  FOREIGN KEY(tipos_items_idtipos_items)
    REFERENCES tipos_items(idtipos_items));


CREATE INDEX egresos_FKIndex1 ON egresos (tipos_items_idtipos_items);


CREATE INDEX IFK_Rel_14 ON egresos (tipos_items_idtipos_items);


CREATE TABLE cuentas_mmov (
  idcuentas_mmov SERIAL  NOT NULL ,
  bancos_idbancos INTEGER   NOT NULL ,
  numero NUMERIC    ,
  tipo VARCHAR    ,
  titular VARCHAR    ,
  sucursal_apertura VARCHAR    ,
  fecha_apertura DATE    ,
  estatus CHAR  DEFAULT 'A'  ,
  nombre VARCHAR      ,
PRIMARY KEY(idcuentas_mmov)  ,
  FOREIGN KEY(bancos_idbancos)
    REFERENCES bancos(idbancos));


CREATE INDEX cuentas_mmov_FKIndex1 ON cuentas_mmov (bancos_idbancos);


CREATE INDEX IFK_Rel_18 ON cuentas_mmov (bancos_idbancos);


CREATE TABLE Fianza (
  idFianza SERIAL  NOT NULL ,
  DTI_personas_idpersonas INTEGER   NOT NULL ,
  DTI_idDTI INTEGER   NOT NULL ,
  limite_carga FLOAT    ,
  limite_carga_asegurada FLOAT    ,
  porcentaje_finaza NUMERIC  DEFAULT 67  ,
  fianza_directa_sep FLOAT      ,
PRIMARY KEY(idFianza)  ,
  FOREIGN KEY(DTI_idDTI, DTI_personas_idpersonas)
    REFERENCES DTI(idDTI, personas_idpersonas));


CREATE INDEX Fianza_FKIndex1 ON Fianza (DTI_idDTI, DTI_personas_idpersonas);


CREATE INDEX IFK_Rel_34 ON Fianza (DTI_idDTI, DTI_personas_idpersonas);


CREATE TABLE empleados (
  idempleados SERIAL  NOT NULL ,
  personas_idpersonas INTEGER   NOT NULL ,
  fecha_ingreso DATE    ,
  salario_mensual FLOAT    ,
  cargo VARCHAR      ,
PRIMARY KEY(idempleados, personas_idpersonas)  ,
  FOREIGN KEY(personas_idpersonas)
    REFERENCES personas(idpersonas));


CREATE INDEX empleados_FKIndex1 ON empleados (personas_idpersonas);


CREATE INDEX IFK_Rel_14 ON empleados (personas_idpersonas);


CREATE TABLE ingresos (
  idingresos SERIAL  NOT NULL ,
  cuentas_mmov_idcuentas_mmov INTEGER   NOT NULL ,
  fecha_ingreso DATE    ,
  numero_ingreso NUMERIC    ,
  comisionista VARCHAR    ,
  ruta VARCHAR    ,
  operacion VARCHAR    ,
  cheque FLOAT    ,
  efectivo FLOAT    ,
  monto FLOAT    ,
  fecha_carga TIMESTAMP  DEFAULT CURRENT_DATE NOT NULL ,
  banco VARCHAR      ,
PRIMARY KEY(idingresos)  ,
  FOREIGN KEY(cuentas_mmov_idcuentas_mmov)
    REFERENCES cuentas_mmov(idcuentas_mmov));


CREATE INDEX ingresos_FKIndex1 ON ingresos (cuentas_mmov_idcuentas_mmov);


CREATE INDEX IFK_Rel_22 ON ingresos (cuentas_mmov_idcuentas_mmov);


CREATE TABLE gastos_caja_chica (
  idgastos_caja_chica SERIAL  NOT NULL ,
  reposicion_caja_chica_idreposicion_caja_chica INTEGER   NOT NULL ,
  tipos_items_idtipos_items INTEGER   NOT NULL ,
  fecha DATE    ,
  num_factura VARCHAR   NOT NULL ,
  concepto VARCHAR    ,
  monto FLOAT    ,
  exento FLOAT    ,
  base FLOAT    ,
  iva FLOAT      ,
PRIMARY KEY(idgastos_caja_chica)      ,
  FOREIGN KEY(tipos_items_idtipos_items)
    REFERENCES tipos_items(idtipos_items),
  FOREIGN KEY(reposicion_caja_chica_idreposicion_caja_chica)
    REFERENCES reposicion_caja_chica(idreposicion_caja_chica));


CREATE INDEX gastos_caja_chica_FKIndex1 ON gastos_caja_chica (tipos_items_idtipos_items);
CREATE INDEX gastos_caja_chica_FKIndex2 ON gastos_caja_chica (reposicion_caja_chica_idreposicion_caja_chica);
CREATE UNIQUE INDEX gastos_caja_chica_num_fact ON gastos_caja_chica (num_factura);


CREATE INDEX IFK_Rel_10 ON gastos_caja_chica (tipos_items_idtipos_items);
CREATE INDEX IFK_Rel_11 ON gastos_caja_chica (reposicion_caja_chica_idreposicion_caja_chica);


CREATE TABLE egresos_administrativos (
  idegresos_administrativos SERIAL  NOT NULL ,
  cuentas_mmov_idcuentas_mmov INTEGER   NOT NULL ,
  tipos_items_idtipos_items INTEGER   NOT NULL ,
  fecha DATE    ,
  monto FLOAT    ,
  concepto VARCHAR    ,
  num_cheque INTEGER   NOT NULL ,
  a_nombre VARCHAR    ,
  emisor VARCHAR    ,
  estatus CHAR  DEFAULT 'P'    ,
PRIMARY KEY(idegresos_administrativos)      ,
  FOREIGN KEY(tipos_items_idtipos_items)
    REFERENCES tipos_items(idtipos_items),
  FOREIGN KEY(cuentas_mmov_idcuentas_mmov)
    REFERENCES cuentas_mmov(idcuentas_mmov));


CREATE INDEX egresos_administrativos_FKIndex1 ON egresos_administrativos (tipos_items_idtipos_items);
CREATE UNIQUE INDEX egresos_administrativos_num_cheque_idx ON egresos_administrativos (num_cheque);
CREATE INDEX egresos_administrativos_FKIndex3 ON egresos_administrativos (cuentas_mmov_idcuentas_mmov);


CREATE INDEX IFK_Rel_17 ON egresos_administrativos (tipos_items_idtipos_items);
CREATE INDEX IFK_Rel_21 ON egresos_administrativos (cuentas_mmov_idcuentas_mmov);


CREATE TABLE Pasivos_laborales (
  idPasivos_laborales SERIAL  NOT NULL ,
  empleados_personas_idpersonas INTEGER   NOT NULL ,
  empleados_idempleados INTEGER   NOT NULL ,
  fecha DATE    ,
  sueldos FLOAT    ,
  comisiones FLOAT    ,
  bono_vacacional FLOAT    ,
  utilidades FLOAT    ,
  dias_salario INTEGER      ,
PRIMARY KEY(idPasivos_laborales)  ,
  FOREIGN KEY(empleados_idempleados, empleados_personas_idpersonas)
    REFERENCES empleados(idempleados, personas_idpersonas));


CREATE INDEX Pasivos_laborales_FKIndex1 ON Pasivos_laborales (empleados_idempleados, empleados_personas_idpersonas);


CREATE INDEX IFK_Rel_32 ON Pasivos_laborales (empleados_idempleados, empleados_personas_idpersonas);


CREATE TABLE Supervisor (
  idSupervisor SERIAL  NOT NULL ,
  empleados_personas_idpersonas INTEGER   NOT NULL ,
  empleados_idempleados INTEGER   NOT NULL   ,
PRIMARY KEY(idSupervisor, empleados_personas_idpersonas, empleados_idempleados)  ,
  FOREIGN KEY(empleados_idempleados, empleados_personas_idpersonas)
    REFERENCES empleados(idempleados, personas_idpersonas));


CREATE INDEX Supervisor_FKIndex1 ON Supervisor (empleados_idempleados, empleados_personas_idpersonas);


CREATE INDEX IFK_Rel_25 ON Supervisor (empleados_idempleados, empleados_personas_idpersonas);


CREATE TABLE saldos_telecard (
  idsaldos_telecard SERIAL  NOT NULL ,
  cuentas_mmov_idcuentas_mmov INTEGER   NOT NULL ,
  fecha DATE    ,
  monto FLOAT    ,
  banco VARCHAR    ,
  fecha_carga TIMESTAMP  DEFAULT CURRENT_DATE    ,
PRIMARY KEY(idsaldos_telecard)  ,
  FOREIGN KEY(cuentas_mmov_idcuentas_mmov)
    REFERENCES cuentas_mmov(idcuentas_mmov));


CREATE INDEX saldos_telecard_FKIndex1 ON saldos_telecard (cuentas_mmov_idcuentas_mmov);


CREATE INDEX IFK_Rel_19 ON saldos_telecard (cuentas_mmov_idcuentas_mmov);


CREATE TABLE rutas (
  idrutas SERIAL  NOT NULL ,
  DTI_personas_idpersonas INTEGER   NOT NULL ,
  DTI_idDTI INTEGER   NOT NULL ,
  nombre VARCHAR    ,
  codigo VARCHAR      ,
PRIMARY KEY(idrutas)  ,
  FOREIGN KEY(DTI_idDTI, DTI_personas_idpersonas)
    REFERENCES DTI(idDTI, personas_idpersonas));


CREATE INDEX rutas_FKIndex1 ON rutas (DTI_idDTI, DTI_personas_idpersonas);


CREATE INDEX IFK_Rel_08 ON rutas (DTI_idDTI, DTI_personas_idpersonas);


CREATE TABLE saldos_bancos (
  idsaldos_bancos SERIAL  NOT NULL ,
  cuentas_mmov_idcuentas_mmov INTEGER   NOT NULL ,
  disponible FLOAT    ,
  fecha DATE    ,
  diferido FLOAT    ,
  bloqueado FLOAT    ,
  fecha_carga TIMESTAMP  DEFAULT CURRENT_DATE    ,
PRIMARY KEY(idsaldos_bancos)  ,
  FOREIGN KEY(cuentas_mmov_idcuentas_mmov)
    REFERENCES cuentas_mmov(idcuentas_mmov));


CREATE INDEX saldos_bancos_FKIndex1 ON saldos_bancos (cuentas_mmov_idcuentas_mmov);


CREATE INDEX IFK_Rel_20 ON saldos_bancos (cuentas_mmov_idcuentas_mmov);


CREATE TABLE movimientos_bancos (
  idmovimientos_bancos SERIAL  NOT NULL ,
  cuentas_mmov_idcuentas_mmov INTEGER   NOT NULL ,
  fecha DATE    ,
  cod_descrip VARCHAR    ,
  descripcion VARCHAR    ,
  referencia INTEGER    ,
  tipo_movimiento VARCHAR    ,
  monto FLOAT      ,
PRIMARY KEY(idmovimientos_bancos)  ,
  FOREIGN KEY(cuentas_mmov_idcuentas_mmov)
    REFERENCES cuentas_mmov(idcuentas_mmov));


CREATE INDEX movimientos_bancos_FKIndex1 ON movimientos_bancos (cuentas_mmov_idcuentas_mmov);


CREATE INDEX IFK_Rel_17 ON movimientos_bancos (cuentas_mmov_idcuentas_mmov);


CREATE TABLE chequeras (
  idchequeras SERIAL  NOT NULL ,
  cuentas_mmov_idcuentas_mmov INTEGER   NOT NULL ,
  chequera INTEGER    ,
  inicial INTEGER    ,
  final INTEGER    ,
  ultimo_utilizado INTEGER    ,
  estatus CHAR      ,
PRIMARY KEY(idchequeras)  ,
  FOREIGN KEY(cuentas_mmov_idcuentas_mmov)
    REFERENCES cuentas_mmov(idcuentas_mmov));


CREATE INDEX chequeras_FKIndex1 ON chequeras (cuentas_mmov_idcuentas_mmov);


CREATE INDEX IFK_Rel_34 ON chequeras (cuentas_mmov_idcuentas_mmov);


CREATE TABLE cheques_anulados (
  idcheques_anulados SERIAL  NOT NULL ,
  chequeras_idchequeras INTEGER   NOT NULL ,
  num_cheque INTEGER    ,
  fecha TIMESTAMP  DEFAULT CURRENT_DATE    ,
PRIMARY KEY(idcheques_anulados)  ,
  FOREIGN KEY(chequeras_idchequeras)
    REFERENCES chequeras(idchequeras));


CREATE INDEX cheques_anulados_FKIndex1 ON cheques_anulados (chequeras_idchequeras);


CREATE INDEX IFK_Rel_35 ON cheques_anulados (chequeras_idchequeras);


CREATE TABLE Comision_Fianza (
  idComision_Fianza SERIAL  NOT NULL ,
  Fianza_idFianza INTEGER   NOT NULL ,
  Comision FLOAT    ,
  fecha DATE      ,
PRIMARY KEY(idComision_Fianza)  ,
  FOREIGN KEY(Fianza_idFianza)
    REFERENCES Fianza(idFianza));


CREATE INDEX Comision_Fianza_FKIndex2 ON Comision_Fianza (Fianza_idFianza);


CREATE INDEX IFK_Rel_35 ON Comision_Fianza (Fianza_idFianza);


CREATE TABLE Supervision (
  idSupervision SERIAL  NOT NULL ,
  Supervisor_empleados_idempleados INTEGER   NOT NULL ,
  Supervisor_empleados_personas_idpersonas INTEGER   NOT NULL ,
  Supervisor_idSupervisor INTEGER   NOT NULL ,
  rutas_idrutas INTEGER   NOT NULL ,
  fecha DATE    ,
  ciudad VARCHAR    ,
  sector VARCHAR      ,
PRIMARY KEY(idSupervision)    ,
  FOREIGN KEY(rutas_idrutas)
    REFERENCES rutas(idrutas),
  FOREIGN KEY(Supervisor_idSupervisor, Supervisor_empleados_personas_idpersonas, Supervisor_empleados_idempleados)
    REFERENCES Supervisor(idSupervisor, empleados_personas_idpersonas, empleados_idempleados));


CREATE INDEX Supervision_FKIndex1 ON Supervision (rutas_idrutas);
CREATE INDEX Supervision_FKIndex2 ON Supervision (Supervisor_idSupervisor, Supervisor_empleados_personas_idpersonas, Supervisor_empleados_idempleados);


CREATE INDEX IFK_Rel_23 ON Supervision (rutas_idrutas);
CREATE INDEX IFK_Rel_26 ON Supervision (Supervisor_idSupervisor, Supervisor_empleados_personas_idpersonas, Supervisor_empleados_idempleados);


CREATE TABLE PDVS (
  idPDVS SERIAL  NOT NULL ,
  rutas_idrutas INTEGER   NOT NULL ,
  nombre VARCHAR    ,
  direccion VARCHAR    ,
  tipo VARCHAR    ,
  responsable VARCHAR    ,
  telefono INTEGER    ,
  rif INTEGER      ,
PRIMARY KEY(idPDVS)  ,
  FOREIGN KEY(rutas_idrutas)
    REFERENCES rutas(idrutas));


CREATE INDEX PDVS_FKIndex2 ON PDVS (rutas_idrutas);


CREATE INDEX IFK_Rel_07 ON PDVS (rutas_idrutas);


CREATE TABLE terminales_cheques (
  idterminales_cheques SERIAL  NOT NULL ,
  chequeras_idchequeras INTEGER   NOT NULL ,
  numero_terminal INTEGER   NOT NULL ,
  estatus CHAR      ,
PRIMARY KEY(idterminales_cheques)  ,
  FOREIGN KEY(chequeras_idchequeras)
    REFERENCES chequeras(idchequeras));


CREATE INDEX terminales_cheques_FKIndex1 ON terminales_cheques (chequeras_idchequeras);


CREATE INDEX IFK_Rel_33 ON terminales_cheques (chequeras_idchequeras);


CREATE TABLE PDVS_has_Supervision (
  PDVS_idPDVS INTEGER   NOT NULL ,
  Supervision_idSupervision INTEGER   NOT NULL ,
  fecha_ult_sup DATE    ,
  fecha_ult_venta DATE    ,
  monto_ult_venta FLOAT      ,
PRIMARY KEY(PDVS_idPDVS, Supervision_idSupervision)    ,
  FOREIGN KEY(PDVS_idPDVS)
    REFERENCES PDVS(idPDVS),
  FOREIGN KEY(Supervision_idSupervision)
    REFERENCES Supervision(idSupervision));


CREATE INDEX PDVS_has_Supervision_FKIndex1 ON PDVS_has_Supervision (PDVS_idPDVS);
CREATE INDEX PDVS_has_Supervision_FKIndex2 ON PDVS_has_Supervision (Supervision_idSupervision);


CREATE INDEX IFK_Rel_27 ON PDVS_has_Supervision (PDVS_idPDVS);
CREATE INDEX IFK_Rel_28 ON PDVS_has_Supervision (Supervision_idSupervision);


CREATE TABLE cheques_devueltos (
  idcheques_devueltos SERIAL  NOT NULL ,
  cuentas_mmov_idcuentas_mmov INTEGER   NOT NULL ,
  PDVS_idPDVS INTEGER   NOT NULL ,
  bancos_idbancos INTEGER   NOT NULL ,
  fecha_devolucion DATE    ,
  num_cheque INTEGER    ,
  monto FLOAT      ,
PRIMARY KEY(idcheques_devueltos)      ,
  FOREIGN KEY(bancos_idbancos)
    REFERENCES bancos(idbancos),
  FOREIGN KEY(PDVS_idPDVS)
    REFERENCES PDVS(idPDVS),
  FOREIGN KEY(cuentas_mmov_idcuentas_mmov)
    REFERENCES cuentas_mmov(idcuentas_mmov));


CREATE INDEX cheques_devueltos_FKIndex1 ON cheques_devueltos (bancos_idbancos);
CREATE INDEX cheques_devueltos_FKIndex3 ON cheques_devueltos (PDVS_idPDVS);
CREATE INDEX cheques_devueltos_FKIndex3 ON cheques_devueltos (cuentas_mmov_idcuentas_mmov);


CREATE INDEX IFK_Rel_02 ON cheques_devueltos (bancos_idbancos);
CREATE INDEX IFK_Rel_04 ON cheques_devueltos (PDVS_idPDVS);
CREATE INDEX IFK_Rel_21 ON cheques_devueltos (cuentas_mmov_idcuentas_mmov);


CREATE TABLE reposicion_cheques (
  idrecuperacion_cheques SERIAL  NOT NULL ,
  formas_pago_idformas_pago INTEGER   NOT NULL ,
  cuentas_mmov_idcuentas_mmov INTEGER   NOT NULL ,
  bancos_idbancos INTEGER   NOT NULL ,
  cheques_devueltos_idcheques_devueltos INTEGER   NOT NULL ,
  fecha_recuperacion DATE    ,
  monto FLOAT    ,
  referencia INTEGER    ,
  tipo_reposicion VARCHAR    ,
  num_cheque_repo INTEGER      ,
PRIMARY KEY(idrecuperacion_cheques)        ,
  FOREIGN KEY(cheques_devueltos_idcheques_devueltos)
    REFERENCES cheques_devueltos(idcheques_devueltos),
  FOREIGN KEY(bancos_idbancos)
    REFERENCES bancos(idbancos),
  FOREIGN KEY(cuentas_mmov_idcuentas_mmov)
    REFERENCES cuentas_mmov(idcuentas_mmov),
  FOREIGN KEY(formas_pago_idformas_pago)
    REFERENCES formas_pago(idformas_pago));


CREATE INDEX reposicion_cheques_FKIndex1 ON reposicion_cheques (cheques_devueltos_idcheques_devueltos);
CREATE INDEX reposicion_cheques_FKIndex2 ON reposicion_cheques (bancos_idbancos);
CREATE INDEX reposicion_cheques_FKIndex3 ON reposicion_cheques (cuentas_mmov_idcuentas_mmov);
CREATE INDEX reposicion_cheques_FKIndex4 ON reposicion_cheques (formas_pago_idformas_pago);


CREATE INDEX IFK_Rel_01 ON reposicion_cheques (cheques_devueltos_idcheques_devueltos);
CREATE INDEX IFK_Rel_05 ON reposicion_cheques (bancos_idbancos);
CREATE INDEX IFK_Rel_22 ON reposicion_cheques (cuentas_mmov_idcuentas_mmov);
CREATE INDEX IFK_Rel_23 ON reposicion_cheques (formas_pago_idformas_pago);


CREATE TABLE disponibilidad_supervision (
  iddisponibilidad_supervision SERIAL  NOT NULL ,
  PDVS_has_Supervision_Supervision_idSupervision INTEGER   NOT NULL ,
  PDVS_has_Supervision_PDVS_idPDVS INTEGER   NOT NULL ,
  productos_idproductos INTEGER   NOT NULL ,
  fecha_carga TIMESTAMP  DEFAULT CURRENT_DATE  ,
  cantidad INTEGER      ,
PRIMARY KEY(iddisponibilidad_supervision)    ,
  FOREIGN KEY(productos_idproductos)
    REFERENCES productos(idproductos),
  FOREIGN KEY(PDVS_has_Supervision_PDVS_idPDVS, PDVS_has_Supervision_Supervision_idSupervision)
    REFERENCES PDVS_has_Supervision(PDVS_idPDVS, Supervision_idSupervision));


CREATE INDEX disponibilidad_supervision_FKIndex1 ON disponibilidad_supervision (productos_idproductos);
CREATE INDEX disponibilidad_supervision_FKIndex2 ON disponibilidad_supervision (PDVS_has_Supervision_PDVS_idPDVS, PDVS_has_Supervision_Supervision_idSupervision);


CREATE INDEX IFK_Rel_28 ON disponibilidad_supervision (productos_idproductos);
CREATE INDEX IFK_Rel_29 ON disponibilidad_supervision (PDVS_has_Supervision_PDVS_idPDVS, PDVS_has_Supervision_Supervision_idSupervision);




