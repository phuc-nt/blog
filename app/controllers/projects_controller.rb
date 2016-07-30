class ProjectsController < ApplicationController
	before_action :find_project, only: [:show, :edit, :update, :destroy]

	def index
		# @projects = Project.all.order("created_at desc").paginate(page: params[:page], per_page: 3)
		@projects = Project.all.order("created_at desc")
	end

	def new
		@project = Project.new
	end 

	def create
		@project = Project.new project_params
		if @project.save
			redirect_to @project,notice: "Your project was successfully saved, boss"
		else
			render "new", notice: "I'm sorry, I was unable to save your project, boss"
		end
	end

	def show
	end

	def edit
	end

	def update
		if @project.update project_params
			redirect_to @project, notice: "Your project was successfully saved, boss"
		else
			render "edit"
		end
				
	end

	def destroy
		@project.destroy
		redirect_to projects_path
	end

	private

	def project_params
		# params.require(:project).permit(:title, :content, :slug)
		params.require(:project).permit(:title, :description, :link)
	end

	def find_project
		# @project = Project.friendly.find(params[:id])
		@project = Project.find(params[:id])
	end
end
