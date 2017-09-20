class Familiartrabajador < ApplicationRecord

	validate :input_atributos



def input_atributos
    if rut.present?
      dv = [*0..9,'K'][rut[0...-2].to_s.reverse.chars.inject([0,0]){|(i,a),n|[i+1,a-n.to_i*(i%6+2)]}[1]%11]
      #if Integer(rut[-1]) != dv
       # errors.add(:rut, "Formato de rut mal ingresado")
      #end
        if rut[0...-2].size != rut[0...-2].count("0-9")
          #puts "el rut se debe ingresar sin puntos y con guión"
          errors.add(:rut, "el RUT se debe ingresar sin puntos y con guión")


        else
         #verificado antes del guion

            if rut.count("k,K") > 1
            
            errors.add(:rut, "Formato de rut mal ingresado. Verificar1.")
            
            else

              if dv == 'K'
                if rut[-1] != 'K' && rut[-1] != 'k'
                  errors.add(:rut, "Formato de rut mal ingresado. Verificar2.")
                end
              else
                if rut[-1] != 'K' && rut[-1] != 'k'
                  if Integer(rut[-1]) != dv
                    errors.add(:rut, "Formato de rut mal ingresado. Verificar3.")
                  end
                else
                  errors.add(:rut, "Formato de rut mal ingresado. Verificar4.")
                end
              end



            end



	          end
	    end

	end

end
