class DashboardController < ApplicationController
    def index
        @users = User.all
        @patients = Patient.all
    end

    def analytics
        @appointments_per_day = Patient.created_per_day
        @labels = @appointments_per_day.keys.map { |date| ERB::Util.url_encode(date.strftime('%Y-%m-%d')) }
        @data = @appointments_per_day.values
    end

    def scheduled_appointments
        @patients = Patient.where(doctor: params[:doctorName]).all

    end
end
