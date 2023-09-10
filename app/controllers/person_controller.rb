class PersonController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response


    def show
        person = find_person
        render json: person, status: :ok
    end

    def create
        person = Person.create!(person_params)
        render json: person, status: :created
    end

    def update
        person = find_person
        person.update!(person_params)
        render json: person, status: :ok
    end

    def destroy
        person = find_person
        person.destroy
        head :no_content
    end



    private

    def find_person
        Person.find(params[:user_id])
    end

    def person_params
        params.require(:person).permit(:name)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors.full_messages }, status: :unprocessable_entity
    end

    def render_not_found_response
        render json: { error: "Person not found" }, status: :not_found
    end
end
