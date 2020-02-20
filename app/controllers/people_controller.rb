class PeopleController < ApplicationController
  before_action :set_person, only: [:show, :edit,:update,:destroy]
  def index
    @people = Person.all
  end

  def show
   
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new(people_params)
 
    if @person.save
      redirect_to people_path
    else
      render :new
    end
  end

  def edit
    # @person = Person.find(params[:id])
  end

  def update
  
    if @person.update(people_params)
      redirect_to person_path
    else
      render :edit
    end
  end

  def destroy
  
    redirect_to pages_path
  end

  private

   def people_params
     params.require(:person).permit(:first_name, :last_name, :age,:hair_color,:eye_color,:gender,:alive)
   end

   def set_person
    @person = Person.find(params[:id])
   end
end
