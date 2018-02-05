ActiveAdmin.register User do 
    controller do 
        def permitted_params
            params.permit :utf8, :authenticity_token, :commit, user: [:name, :email, :password, :phone, :id, :location_id, :allow_destroy]
        end
    end
    form do |u|
        u.semantic_errors *u.object.errors.keys
        u.input :name
        u.input :email
        u.input :password
        u.input :phone
        u.input :location_id
        u.actions
    end
end