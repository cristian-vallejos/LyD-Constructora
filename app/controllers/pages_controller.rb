class PagesController < ApplicationController
	def benefitṔanel
	end


	def logBeneficiosCheckAsistencia
		@logbenefitsfinal = Logbenefitsfinal.new
 		@assignbenefit = Assignbenefit.where(benefit_id: params[:benefit][:benefit_id])
 	end



	def indexBenefitPerName


		@assignbenefit = Assignbenefit.where(benefit_id: params[:benefit][:benefit_id])


		Rails.application.config.ab = Assignbenefit.where(benefit_id: params[:benefit][:benefit_id])

    	
    	respond_to do |format|
        
        format.pdf {
          render pdf: "Reporte",
          template: "layouts/reporteLog"
        }
        format.html




          
		#@assignbenefit = Assignbenefit.find

	end

	def download_pdf
		@assignbenefit = Rails.application.config.ab
    	
        pdf = WickedPdf.new.pdf_from_string(
		render_to_string('layouts/reporteLog.pdf.erb', layout: false)
		)

		send_data pdf, :filename => "resume.pdf", :type => "application/pdf",:disposition => "attachment"

    	end




	end


end