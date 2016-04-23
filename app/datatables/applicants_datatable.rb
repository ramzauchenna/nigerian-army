class ApplicantsDatatable
    delegate :params, :h, :link_to, :check_box_tag, to: :@view

    def initialize(view)
      @view = view
    end

    def as_json(options = {})
      {
          sEcho: params[:sEcho].to_i,
          iTotalRecords: Applicant.count,
          iTotalDisplayRecords: applicants.total_entries,
          aaData: data
      }
    end

    private

    def data
      applicants.map do |applicant|
        [
            check_box_tag("bulkselcet", applicant.id, false, class: 'accept_tos'),
            applicant.application_number,
            applicant.full_name,
            applicant.gender,
            applicant.phone_number,
            applicant.nok_occupation,
            applicant.sor,
            applicant.lga
        ]
      end
    end


    def applicants
      @applicants ||= fetch_applicants
    end

    def fetch_applicants
        applicants = Applicant
        if params[:lga].present?
          puts "lga is " + params[:lga]
          applicants = applicants.where(lga: params[:lga])
        end
        if params[:state].present?
          applicants = applicants.where(region: params[:state])
        end
        if params[:army_corp].present?
          applicants = applicants.where(army_corp: params[:army_corp])
        end
        if params[:specialization].present?
          applicants = applicants.where(specialization: params[:specialization])
        end
        if params[:qualifications].present?
          applicants = applicants.where(specialization: params[:qualifications])
        end
        applicants = applicants.order("#{sort_column} #{sort_direction}").page(page).per_page(per_page)
      if params[:sSearch].present? && params[:sSearch] != "undefined"
        puts params[:sSearch]
        applicants = applicants.where("applicants.sor like :search or applicants.lga like :search  or applicants.army_corp like :search or applicants.application_number like :search or applicants.gender like :search or applicants.first_name like :search or applicants.surname like :search",
                                search: "%#{params[:sSearch]}%")
      end
        applicants
    end

    def page
      params[:iDisplayStart].to_i/per_page + 1
    end

    def per_page
      params[:iDisplayLength].to_i > 0 ? params[:iDisplayLength].to_i : 10
    end

    def sort_column
      columns = %w[id application_number first_name gender phone_number sor id lga]
      columns[params[:iSortCol_0].to_i]
    end

    def sort_direction
      params[:sSortDir_0] == "desc" ? "desc" : "asc"
    end

end