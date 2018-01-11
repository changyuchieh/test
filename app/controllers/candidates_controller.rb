class CandidatesController < ApplicationController
  before_action :find_candidate , only:[ :edit , :update, :show, :destroy ,:vote ]
  
   def index
    @candidates=Candidate.all
  end
  
  def new
    @candidate = Candidate.new
  end
  
  def create
    @candidate=Candidate.new(candidate_params)
    
    if @candidate.save
       flash[:notice] ="Candidate was created successfully"
       redirect_to candidates_path
    else
      render "new"
    end  
  end
  
  def edit
  end  
  
  def update
    if @candidate.update(candidate_params)
      redirect_to candidates_path,notice: "Candidate was updated successfully"
    else
      render "edit"
    end  
  end
  
  def destroy
    @candidate.destroy
    redirect_to candidates_path,notice: "Candidate was deleted successfully"
  end  
  
  def show
  end
  
  def vote
     #create(ip_address: request.remote_ip) if @candidate
    @candidate.vote_logs.create(ip_address: request.remote_ip)
    redirect_to candidates_path,notice: "Vote!"
  end
  
  private
  def candidate_params
    params[:candidate].permit(:name,:party,:age,:comment)
  end
  
  def find_candidate
    @candidate=Candidate.find_by(id: params[:id])
  end
end
