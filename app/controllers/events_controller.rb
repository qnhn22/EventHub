class EventsController < ApplicationController
    def index
        @events = Event.all.reorder('created_at DESC')
    end

    def show
        @event = Event.find(params[:id])
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.events.build(event_params)

        if @event.save
            redirect_to events_path
        else
            render :new, status: :unprocessable_entity
        end
    end

    private 

    def event_params
        params.require(:event).permit(:name, :date, :location)
    end
end
