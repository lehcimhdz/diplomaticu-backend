from datetime import datetime
from app import db


class Curso(db.Model):
    __tablename__ = 'cursos'

    id_curso = db.Column(db.Integer, primary_key=True)
    nombre_curso = db.Column(db.Text, nullable=False)
    descripcion_curso = db.Column(db.Text, nullable=False)
    precio = db.Column(db.Numeric(10, 2))
    gratuito = db.Column(db.Boolean, default=False)
    duracion_horas = db.Column(db.Integer)
    activo = db.Column(db.Boolean, default=True)
    fecha_creacion = db.Column(db.DateTime(timezone=True), default=datetime.utcnow)
    fecha_actualizacion = db.Column(db.DateTime(timezone=True), default=datetime.utcnow,
                                    onupdate=datetime.utcnow)

    preguntas = db.relationship('Pregunta', backref='curso', cascade='all, delete-orphan')

    def to_dict(self):
        return {
            'id_curso': self.id_curso,
            'nombre_curso': self.nombre_curso,
            'descripcion_curso': self.descripcion_curso,
            'precio': float(self.precio) if self.precio is not None else None,
            'gratuito': self.gratuito,
            'duracion_horas': self.duracion_horas,
            'activo': self.activo,
            'fecha_creacion': self.fecha_creacion.isoformat() if self.fecha_creacion else None,
        }


class Pregunta(db.Model):
    __tablename__ = 'preguntas'

    id_pregunta = db.Column(db.Integer, primary_key=True)
    id_curso = db.Column(db.Integer, db.ForeignKey('cursos.id_curso', ondelete='CASCADE'),
                         nullable=False)
    leccion = db.Column(db.Integer, nullable=False)
    planteamiento = db.Column(db.Text, nullable=False)
    pregunta = db.Column(db.Text, nullable=False)
    opciones = db.Column(db.JSON, nullable=False)
    respuesta_correcta = db.Column(db.Text, nullable=False)
    referencia = db.Column(db.Text)
    explicacion = db.Column(db.Text)
    activa = db.Column(db.Boolean, default=True)
    fecha_creacion = db.Column(db.DateTime(timezone=True), default=datetime.utcnow)
    fecha_actualizacion = db.Column(db.DateTime(timezone=True), default=datetime.utcnow,
                                    onupdate=datetime.utcnow)

    def to_dict(self, include_answer=False):
        data = {
            'id_pregunta': self.id_pregunta,
            'id_curso': self.id_curso,
            'leccion': self.leccion,
            'planteamiento': self.planteamiento,
            'pregunta': self.pregunta,
            'opciones': self.opciones,
            'referencia': self.referencia,
            'explicacion': self.explicacion,
            'activa': self.activa,
        }
        if include_answer:
            data['respuesta_correcta'] = self.respuesta_correcta
        return data


class Inscripcion(db.Model):
    __tablename__ = 'inscripciones'

    id_inscripcion = db.Column(db.Integer, primary_key=True)
    usuario_id = db.Column(db.UUID(as_uuid=True), db.ForeignKey('usuarios.id', ondelete='CASCADE'),
                           nullable=False)
    curso_id = db.Column(db.Integer, db.ForeignKey('cursos.id_curso', ondelete='CASCADE'),
                         nullable=False)
    fecha_inscripcion = db.Column(db.DateTime(timezone=True), default=datetime.utcnow)
    activa = db.Column(db.Boolean, default=True)
    progreso = db.Column(db.Numeric(5, 2), default=0.00)
    fecha_ultima_actividad = db.Column(db.DateTime(timezone=True), default=datetime.utcnow)
    fecha_completado = db.Column(db.DateTime(timezone=True))

    __table_args__ = (db.UniqueConstraint('usuario_id', 'curso_id'),)

    curso = db.relationship('Curso', backref='inscripciones')

    def to_dict(self):
        return {
            'id_inscripcion': self.id_inscripcion,
            'curso_id': self.curso_id,
            'fecha_inscripcion': self.fecha_inscripcion.isoformat() if self.fecha_inscripcion else None,
            'activa': self.activa,
            'progreso': float(self.progreso) if self.progreso is not None else 0.0,
        }


class ProgresoUsuario(db.Model):
    __tablename__ = 'progreso_usuario'

    id = db.Column(db.Integer, primary_key=True)
    usuario_id = db.Column(db.UUID(as_uuid=True), db.ForeignKey('usuarios.id', ondelete='CASCADE'),
                           nullable=False)
    curso_id = db.Column(db.Integer, db.ForeignKey('cursos.id_curso', ondelete='CASCADE'),
                         nullable=False)
    lecciones_completadas = db.Column(db.Integer, default=0)
    preguntas_respondidas = db.Column(db.Integer, default=0)
    preguntas_correctas = db.Column(db.Integer, default=0)
    tiempo_total_estudio = db.Column(db.Integer, default=0)
    porcentaje_completado = db.Column(db.Numeric(5, 2), default=0.00)
    fecha_inicio = db.Column(db.DateTime(timezone=True), default=datetime.utcnow)
    fecha_ultima_actividad = db.Column(db.DateTime(timezone=True), default=datetime.utcnow)
    fecha_completado = db.Column(db.DateTime(timezone=True))

    __table_args__ = (db.UniqueConstraint('usuario_id', 'curso_id'),)

    curso = db.relationship('Curso')

    def to_dict(self):
        return {
            'id': self.id,
            'curso': self.curso_id,
            'curso_nombre': self.curso.nombre_curso if self.curso else None,
            'temas_completados': self.lecciones_completadas,
            'preguntas_respondidas': self.preguntas_respondidas,
            'preguntas_correctas': self.preguntas_correctas,
            'tiempo_total_estudio': self.tiempo_total_estudio,
            'porcentaje_completado': float(self.porcentaje_completado) if self.porcentaje_completado is not None else 0.0,
            'porcentaje_aciertos': (
                (self.preguntas_correctas / self.preguntas_respondidas * 100)
                if self.preguntas_respondidas else 0
            ),
            'fecha_inicio': self.fecha_inicio.isoformat() if self.fecha_inicio else None,
            'fecha_ultima_actividad': self.fecha_ultima_actividad.isoformat() if self.fecha_ultima_actividad else None,
        }


class RespuestaUsuario(db.Model):
    __tablename__ = 'respuestas_usuario'

    id_respuesta = db.Column(db.Integer, primary_key=True)
    id_pregunta = db.Column(db.Integer, db.ForeignKey('preguntas.id_pregunta', ondelete='CASCADE'),
                            nullable=False)
    id_usuario = db.Column(db.UUID(as_uuid=True), db.ForeignKey('usuarios.id', ondelete='CASCADE'),
                           nullable=False)
    respuesta_usuario = db.Column(db.Text, nullable=False)
    resultado = db.Column(db.Boolean, nullable=False)
    tiempo_respuesta = db.Column(db.Integer)
    fecha_respuesta = db.Column(db.DateTime(timezone=True), default=datetime.utcnow)

    __table_args__ = (db.UniqueConstraint('id_pregunta', 'id_usuario'),)

    pregunta = db.relationship('Pregunta')

    def to_dict(self):
        return {
            'id_respuesta': self.id_respuesta,
            'id_pregunta': self.id_pregunta,
            'respuesta_usuario': self.respuesta_usuario,
            'resultado': self.resultado,
            'tiempo_respuesta': self.tiempo_respuesta,
            'fecha_respuesta': self.fecha_respuesta.isoformat() if self.fecha_respuesta else None,
        }


class SesionEstudio(db.Model):
    __tablename__ = 'sesiones_estudio'

    id = db.Column(db.Integer, primary_key=True)
    usuario_id = db.Column(db.UUID(as_uuid=True), db.ForeignKey('usuarios.id', ondelete='CASCADE'),
                           nullable=False)
    curso_id = db.Column(db.Integer, db.ForeignKey('cursos.id_curso', ondelete='CASCADE'))
    leccion = db.Column(db.Integer)
    tipo_actividad = db.Column(db.String(50), default='general')
    estado = db.Column(db.String(50), default='activa')
    fecha_inicio = db.Column(db.DateTime(timezone=True), default=datetime.utcnow)
    fecha_fin = db.Column(db.DateTime(timezone=True))
    fecha_ultima_actividad = db.Column(db.DateTime(timezone=True), default=datetime.utcnow)
    duracion_total = db.Column(db.Integer, default=0)
    tiempo_activo = db.Column(db.Integer, default=0)
    preguntas_respondidas = db.Column(db.Integer, default=0)
    paginas_vistas = db.Column(db.Integer, default=0)
