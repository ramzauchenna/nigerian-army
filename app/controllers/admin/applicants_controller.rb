class Admin::ApplicantsController < Admin::BaseController
  def index
    @lgas = Lga.all
    @regions = Region.all
    @army_corps = ArmyCorp.all
    @specializations = Specialization.all
    @qualifications = Qualification.all
    respond_to do |format|
      format.html
      format.json { render json: ApplicantsDatatable.new(view_context) }
    end
  end
end
