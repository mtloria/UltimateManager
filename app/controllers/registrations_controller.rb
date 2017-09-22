class RegistrationsController < DeviseTokenAuth::RegistrationsController
    
    def create
        super do |resource|
            userEmail = resource.email
            userQuery = "email = " + "'" + userEmail + "'"
            user = User.where(userQuery).first()

            team = Team.new
            team.name = resource.team_name
            team.save

            user.team_id = team.id
            user.save
        end
    end

end