class Asformulary < ApplicationRecord
  #belongs_to :user
  belongs_to :lyduser
  belongs_to :aspcategory
  belongs_to :benefit
  has_many :epcformularies, :dependent => :destroy 

  #before_create :set_atencion_id

  
  validate :input_atributos



  after_create :crear_log_A
  after_update :crear_log_B

  def self.search(search)
    if search
      where('nombre_atendido LIKE ? or apellido_paterno LIKE ? or apellido_materno LIKE ? or rut_atendido LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%","%#{search}%")
    else
      where('nombre_atendido LIKE ?', nil)
    end
  end




  def input_atributos
    if rut_atendido.present?
      dv = [*0..9,'K'][rut_atendido[0...-2].to_s.reverse.chars.inject([0,0]){|(i,a),n|[i+1,a-n.to_i*(i%6+2)]}[1]%11]
      #if Integer(rut_atendido[-1]) != dv
       # errors.add(:rut_atendido, "Formato de rut mal ingresado")
      #end
        if rut_atendido[0...-2].size != rut_atendido[0...-2].count("0-9")
          #puts "el rut se debe ingresar sin puntos y con guión"
          errors.add(:rut_atendido, "el RUT se debe ingresar sin puntos y con guión")


        else
         #verificado antes del guion

            if rut_atendido.count("k,K") > 1
            
            errors.add(:rut_atendido, "Formato de rut mal ingresado. Verificar1.")
            
            else

              if dv == 'K'
                if rut_atendido[-1] != 'K' && rut_atendido[-1] != 'k'
                  errors.add(:rut_atendido, "Formato de rut mal ingresado. Verificar2.")
                end
              else
                if rut_atendido[-1] != 'K' && rut_atendido[-1] != 'k'
                  if Integer(rut_atendido[-1]) != dv
                    errors.add(:rut_atendido, "Formato de rut mal ingresado. Verificar3.")
                  end
                else
                  errors.add(:rut_atendido, "Formato de rut mal ingresado. Verificar4.")
                end
              end



            end



          end
    end

    if aspcategory.present? == false
      errors.add(" ", "Complete el campo tipo consulta")
    end

    if codigo_obra.present? == false
      errors.add(" ", "Ingrese una obra")
    end

    if solucion.present? == false
      errors.add(" ", "Complete el campo solucion")
    end

    if descripcion.present? == false
      errors.add(" ", "Complete el campo descripcion")
    end


  end






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
      	estado: self.estado,
      	subcontrato: self.subcontrato,
      	supervisor: self.nombre_supervisor,
      	descripcion: self.descripcion,
      	telefono: self.telefono)
  	log.save!
    #obra = Obra.new(nombre: self.asformulary.user.name, direccion: "direccion2")
    #obra.save!
  end
  def crear_log_B
    if(self.estado == true)
      log = Loga.new(
        asocial_id: self.id,  
  		user_name: self.lyduser.email,
      	codigo_obra: self.codigo_obra,
      	rut_atendido: self.rut_atendido,
      	nombre_atendido: self.nombre_atendido,
      	apellido_paterno_atendido: self.apellido_paterno,
      	apellido_materno_atendido: self.apellido_materno,
      	aspcategory_name: self.aspcategory.nombre,
      	solucion: self.solucion,
      	estado: self.estado,
      	subcontrato: self.subcontrato,
      	supervisor: self.nombre_supervisor,
      	descripcion: self.descripcion,
      	telefono: self.telefono)
      log.save!
    end
    #obra = Obra.new(nombre: self.asformulary.user.name, direccion: "direccion2")
    #obra.save!
  end



end
