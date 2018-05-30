class ChildrenController < ApplicationController
  def index
    @person = Person.all
    @children = Child.order(person_id: :ASC)
  end

  def show
    @person = Person.find(params[:id])
    @child = Child.where("person_id = #{params[:id]}")
  end

  def new
    @person = Person.find(params[:person_id])
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.save
      redirect_to person_children_path
    else
      render :new
    end
  end

  def edit
    @person = Person.find(params[:person_id])
    @child = Child.find("#{params[:id]}")

  end

  def update
    @child = Child.find(params[:id])
    if @child.update(child_params)
      redirect_to person_children_path
    else
      render :edit
    end
  end


  def destroy
    Child.find(params[:id]).destroy
    redirect_to person_children_path
  end

  private
  def child_params
    params.require(:child).permit(:name, :age, :gender, :person_id)
  end
end
