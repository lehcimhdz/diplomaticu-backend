import uuid
from datetime import datetime, date
from app import db


class User(db.Model):
    __tablename__ = 'usuarios'

    id = db.Column(db.UUID(as_uuid=True), primary_key=True, default=uuid.uuid4)
    email = db.Column(db.String(255), unique=True, nullable=False)
    password_hash = db.Column(db.String(255), nullable=False)
    first_name = db.Column(db.String(100))
    last_name = db.Column(db.String(100))
    activo = db.Column(db.Boolean, default=True)
    fecha_registro = db.Column(db.DateTime(timezone=True), default=datetime.utcnow)
    ultima_actividad = db.Column(db.DateTime(timezone=True), default=datetime.utcnow)

    perfil = db.relationship('PerfilUsuario', backref='user', uselist=False,
                             cascade='all, delete-orphan')
    nivel = db.relationship('NivelUsuario', backref='user', uselist=False,
                            cascade='all, delete-orphan')

    def to_dict(self):
        return {
            'id': str(self.id),
            'email': self.email,
            'first_name': self.first_name,
            'last_name': self.last_name,
            'fecha_registro': self.fecha_registro.isoformat() if self.fecha_registro else None,
        }


class PerfilUsuario(db.Model):
    __tablename__ = 'perfiles_usuario'

    id = db.Column(db.UUID(as_uuid=True), db.ForeignKey('usuarios.id', ondelete='CASCADE'),
                   primary_key=True)
    telefono = db.Column(db.String(20))
    fecha_nacimiento = db.Column(db.Date)
    pais = db.Column(db.String(100), default='México')
    estado = db.Column(db.String(100))
    ciudad = db.Column(db.String(100))
    nivel_educativo = db.Column(db.String(100))
    universidad = db.Column(db.String(200))
    carrera = db.Column(db.String(200))
    tipo_suscripcion = db.Column(db.String(50), default='gratuito')
    fecha_inicio_suscripcion = db.Column(db.DateTime(timezone=True))
    fecha_fin_suscripcion = db.Column(db.DateTime(timezone=True))
    objetivo_estudio = db.Column(db.Text)
    tiempo_estudio_diario = db.Column(db.Integer)

    def to_dict(self):
        return {
            'id': str(self.id),
            'telefono': self.telefono,
            'fecha_nacimiento': self.fecha_nacimiento.isoformat() if self.fecha_nacimiento else None,
            'pais': self.pais,
            'estado': self.estado,
            'ciudad': self.ciudad,
            'nivel_educativo': self.nivel_educativo,
            'universidad': self.universidad,
            'carrera': self.carrera,
            'tipo_suscripcion': self.tipo_suscripcion,
            'objetivo_estudio': self.objetivo_estudio,
            'tiempo_estudio_diario': self.tiempo_estudio_diario,
        }


class NivelUsuario(db.Model):
    __tablename__ = 'niveles_usuario'

    id = db.Column(db.Integer, primary_key=True)
    usuario_id = db.Column(db.UUID(as_uuid=True), db.ForeignKey('usuarios.id', ondelete='CASCADE'),
                           unique=True, nullable=False)
    nivel_actual = db.Column(db.Integer, default=1)
    puntos_totales = db.Column(db.Integer, default=0)
    racha_dias = db.Column(db.Integer, default=0)
    fecha_ultima_actividad = db.Column(db.Date, default=date.today)

    def to_dict(self):
        return {
            'nivel_actual': self.nivel_actual,
            'puntos_totales': self.puntos_totales,
            'racha_dias': self.racha_dias,
            'fecha_ultima_actividad': self.fecha_ultima_actividad.isoformat() if self.fecha_ultima_actividad else None,
        }


class LogroUsuario(db.Model):
    __tablename__ = 'logros_usuario'

    id = db.Column(db.Integer, primary_key=True)
    usuario_id = db.Column(db.UUID(as_uuid=True), db.ForeignKey('usuarios.id', ondelete='CASCADE'),
                           nullable=False)
    tipo = db.Column(db.String(100), nullable=False)
    titulo = db.Column(db.String(200), nullable=False)
    descripcion = db.Column(db.Text, nullable=False)
    icono = db.Column(db.String(50), default='trophy')
    puntos_otorgados = db.Column(db.Integer, default=0)
    fecha_obtenido = db.Column(db.DateTime(timezone=True), default=datetime.utcnow)

    __table_args__ = (db.UniqueConstraint('usuario_id', 'tipo', 'titulo'),)

    def to_dict(self):
        return {
            'id': self.id,
            'tipo': self.tipo,
            'titulo': self.titulo,
            'descripcion': self.descripcion,
            'icono': self.icono,
            'puntos_otorgados': self.puntos_otorgados,
            'fecha_obtenido': self.fecha_obtenido.isoformat() if self.fecha_obtenido else None,
        }


class RetoUsuario(db.Model):
    __tablename__ = 'retos_usuario'

    id = db.Column(db.Integer, primary_key=True)
    usuario_id = db.Column(db.UUID(as_uuid=True), db.ForeignKey('usuarios.id', ondelete='CASCADE'),
                           nullable=False)
    tipo = db.Column(db.String(100), nullable=False)
    titulo = db.Column(db.String(200), nullable=False)
    descripcion = db.Column(db.Text, nullable=False)
    objetivo = db.Column(db.Integer, nullable=False)
    progreso_actual = db.Column(db.Integer, default=0)
    puntos_recompensa = db.Column(db.Integer, nullable=False)
    estado = db.Column(db.String(50), default='activo')
    fecha_inicio = db.Column(db.DateTime(timezone=True), default=datetime.utcnow)
    fecha_limite = db.Column(db.DateTime(timezone=True), nullable=False)
    fecha_completado = db.Column(db.DateTime(timezone=True))

    def to_dict(self):
        return {
            'id': self.id,
            'tipo': self.tipo,
            'titulo': self.titulo,
            'descripcion': self.descripcion,
            'objetivo': self.objetivo,
            'progreso_actual': self.progreso_actual,
            'puntos_recompensa': self.puntos_recompensa,
            'estado': self.estado,
            'fecha_inicio': self.fecha_inicio.isoformat() if self.fecha_inicio else None,
            'fecha_limite': self.fecha_limite.isoformat() if self.fecha_limite else None,
            'fecha_completado': self.fecha_completado.isoformat() if self.fecha_completado else None,
        }
