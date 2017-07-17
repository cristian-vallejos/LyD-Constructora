class Asformulary < ApplicationRecord
  belongs_to :user
  belongs_to :lyduser
  belongs_to :aspcategory
  belongs_to :benefit
  has_many :epcformularies, :dependent => :destroy 

  #before_create :set_atencion_id

  after_create :crear_log_A
  after_update :crear_log_B



  def set_atencion_id

    @AS = Asformulary.last

    if(@AS.atencion_id == nil)
      self.atencion_id = 1
      self.numero_atencion = 1
    else
    self.atencion_id = @AS.atencion_id + 1
    self.numero_atencion = 1
    end

  end



  def crear_log_A
  	log = Loga.new(
  		asocial_id: self.id,  
  		#user_name: self.user.name,
      user_name: self.lyduser.email,
      	codigo_obra: self.codigo_obra,
      	rut_atendido: self.rut_atendido,
      	nombre_atendido: self.nombre_atendido,
      	apellido_paterno_atendido: self.apellido_paterno,
      	apellido_materno_atendido: self.apellido_materno,
      	aspcategory_name: self.aspcategory.nombre,
      	solucion: self.solucion,
        beneficio: self.benefit.nombre,
      	estado: self.estado,
      	subcontrato: self.subcontrato,
      	supervisor: self.nombre_supervisor,
      	descripcion: self.descripcion,
      	fecha_as: self.created_at,
      	telefono: self.telefono)
  	log.save!
    #obra = Obra.new(nombre: self.asformulary.user.name, direccion: "direccion2")
    #obra.save!
  end
  def crear_log_B
    if(self.estado == true)
      log = Loga.new(
        asocial_id: self.id,  
  		user_name: self.user.name,
      	codigo_obra: self.codigo_obra,
      	rut_atendido: self.rut_atendido,
      	nombre_atendido: self.nombre_atendido,
      	apellido_paterno_atendido: self.apellido_paterno,
      	apellido_materno_atendido: self.apellido_materno,
      	aspcategory_name: self.aspcategory.nombre,
      	solucion: self.solucion,
        beneficio: self.benefit.nombre,
      	estado: self.estado,
      	subcontrato: self.subcontrato,
      	supervisor: self.nombre_supervisor,
      	descripcion: self.descripcion,
      	fecha_as: self.created_at,
      	telefono: self.telefono)
      log.save!
    end
    #obra = Obra.new(nombre: self.asformulary.user.name, direccion: "direccion2")
    #obra.save!
  end



end
