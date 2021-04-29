module Api
    module V1
        class UsersController < ActionController::API
            def index
                users = User.all
                render json: users
            end
            
            def create
                user = User.new(user_params)
                if user.save
                    render json: user
                else
                    render error: {error: "Unable to create user"}, status: 400                    
                end
            end

            def update
               user = User.update(user_params)
               render json: user
            end
            

            def show
                user = User.find(params[:id])
                render json: user                               
            end
            
            
            private

            def user_params
                params.require(:user).permit(:nome, :email)
            end
            
        end
    end
end 