ActiveAdmin.register Location do 
    controller do 
        def permitted_params
            params.permit :urf8, :authenticity_token, :commit, location:[:location_name, :total_meeting_room]
        end    
    end
    form do |u|
        u.semantic_errors *u.object.errors.keys
        u.input :location_name
        u.input :total_meeting_room
        u.actions
    end
end