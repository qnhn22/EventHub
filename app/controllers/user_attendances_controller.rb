class UserAttendancesController < ApplicationController
    before_action :authenticate_user!

    def create
        event = Event.find(params[:event_id])
        user_attendance = UserAttendance.new(event_id: event.id, user_id: params[:user_id])
    
        if user_attendance.save
            flash[:notice] = "Invitation sent!"
            redirect_to events_path
        else
            flash[:alert] = 'Ooops! Something went wrong...'
            redirect_to event_path(event)
        end
    end
end
