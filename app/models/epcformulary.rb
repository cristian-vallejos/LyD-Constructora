class Epcformulary < ApplicationRecord
  belongs_to :asformulary
 

  after_create :crear_log_A
  after_update :crear_log_B

  def crear_log_A
  	log = Loga.new(
  		asocial_id: self.asformulary.id, 
  		epcformulary_id: self.id, 
  		user_name: self.asformulary.user.name,
      codigo_obra: self.asformulary.codigo_obra,
      rut_atendido: self.asformulary.rut_atendido,
      rut_atendido_epc: self.rut_atendido,
      nombre_atendido: self.asformulary.nombre_atendido,
      apellido_paterno_atendido: self.asformulary.apellido_paterno,
      apellido_materno_atendido: self.asformulary.apellido_materno,
      aspcategory_name: self.asformulary.aspcategory.nombre,
      solucion: self.asformulary.solucion,
      estado: self.asformulary.estado,
      subcontrato: self.asformulary.subcontrato,
      supervisor: self.asformulary.nombre_supervisor,
      descripcion: self.asformulary.descripcion,
      rut_pariente: self.rut_pariente,
      nombre_pariente: self.nombre_pariente,
      apellido_paterno_pariente: self.apellido_paterno_pariente,
      apellido_materno_pariente: self.apellido_materno_pariente,
      parentezco: self.parentesco,
      empresa: self.empresa,
      comentarios_caso: self.comentarios_caso,
      caso_amerita_epc: self.caso_amerita_epc,
      derivar_a: self.derivar_a,
      fecha_as: self.asformulary.created_at,
      fecha_epc: self.created_at,
      codigo_epc: self.codigo,
      telefono: self.asformulary.telefono)
  	log.save!
    #obra = Obra.new(nombre: self.asformulary.user.name, direccion: "direccion2")
    #obra.save!
  end
  def crear_log_B
    if(self.derivar_a == "cerrar")
      log = Loga.new(
        asocial_id: self.asformulary.id, 
        epcformulary_id: self.id, 
        user_name: self.asformulary.user.name,
        codigo_obra: self.asformulary.codigo_obra,
        rut_atendido: self.asformulary.rut_atendido,
        rut_atendido_epc: self.rut_atendido,
        nombre_atendido: self.asformulary.nombre_atendido,
        apellido_paterno_atendido: self.asformulary.apellido_paterno,
        apellido_materno_atendido: self.asformulary.apellido_materno,
        aspcategory_name: self.asformulary.aspcategory.nombre,
        solucion: self.asformulary.solucion,
        estado: self.asformulary.estado,
        subcontrato: self.asformulary.subcontrato,
        supervisor: self.asformulary.nombre_supervisor,
        descripcion: self.asformulary.descripcion,
        rut_pariente: self.rut_pariente,
        nombre_pariente: self.nombre_pariente,
        apellido_paterno_pariente: self.apellido_paterno_pariente,
        apellido_materno_pariente: self.apellido_materno_pariente,
        parentezco: self.parentesco,
        empresa: self.empresa,
        comentarios_caso: self.comentarios_caso,
        caso_amerita_epc: self.caso_amerita_epc,
        derivar_a: self.derivar_a,
        fecha_as: self.asformulary.created_at,
        fecha_epc: self.updated_at,
        codigo_epc: self.codigo,
        telefono: self.asformulary.telefono)
      log.save!
    end
    #obra = Obra.new(nombre: self.asformulary.user.name, direccion: "direccion2")
    #obra.save!
  end








end
