class AppointmentsController < ApplicationController
    def index
        @patients = Patient.all
    end

    def create
        @doctors = User.where(role: "doctor")
    end

    def show
        @patients = Patient.all

    end

    def edit
        @patient = Patient.find_by(email: params[:email], id: params[:id])
        @doctors = User.where(role: "doctor")
    end

    def update
        @patient = Patient.find_by(email: params['email'], id: params['id'])
        params['phone'] = params['phone'].to_s
        params['patient'] = params
        if @patient.update(patient_params)
            flash[:notice] ='Appointment details has been created Successfully!!'
            redirect_to :action => 'show', notice: 'Appointment details has been created Successfully!!'
        else
            flash[:notice] ="Can't update, try again!!"
            redirect_to :action => 'create', notice: "Can't update, try again!!"
        end
    end

    def new
    
        params['appointment'] = params['appointment'].to_s
        params['status'] = "uncomplete"
        
        params['patient'] = params
        @patient = Patient.new(patient_params)
        if @patient.save
            flash[:notice] ='Appointment has been created Successfully!!'
            redirect_to :action => 'show', notice: 'Appointment has been created Successfully!!'
        else
            flash[:notice] ='try again!!'
            redirect_to :action => 'create', notice: 'try again!!' 
        end
    end

    def delete
        Patient.find_by(email: params['email'], id: params['id']).destroy
        flash[:warning] ='Appointment has been deleted Successfully!!'
        redirect_to :action => 'show', notice: 'Appointment has been deleted Successfully!!'
    end
    def update_status_ooooo
        @input_fields = params
    end

    def update_status
        @patient = Patient.find_by(email: params[:email])
        if @patient
            @patient.update(status: params[:status])
            render json: { reload: true }
        else
            render json: { reload: false }
            
        end

    end

    private

    def patient_params
        params.require(:patient).permit(:name, :email, :phone, :age, :summary, :doctor, :appointment, :status)
    end
end
