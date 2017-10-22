class Admin::RegistrationsController < DeviseTokenAuth::RegistrationsController
    
    def create
        super do |resource|
            adminEmail = resource.email
            adminQuery = "email = " + "'" + adminEmail + "'"
            admin = Admin.where(adminQuery).first()

            team = Team.new
            team.name = resource.team_name
            team.save

            admin.team_id = team.id
            admin.save
        end
    end

end