ActiveAdmin.register MeetingRoom do 
    controller do 
        def permitted_params
            params.permit :utf8, :authenticity_token, :commit, meeting_room: [:name, :location_id]
        end
    end
    form do |u|
        u.semantic_errors *u.object.errors.keys
        u.input :name
        u.input :location_id
        u.actions
    end
end