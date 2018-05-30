class ChildrenController < ApplicationController
  def index
    @person = Person.all
    @children = Child.order(name: :ASC)
  end

  def show
    @person = Person.find(params[:id])
    @child = Child.where("person_id = #{params[:id]}")
  end

  def new
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
    @child = Child.find(id)
  end

  def update
    @child = Child.find(id)
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
