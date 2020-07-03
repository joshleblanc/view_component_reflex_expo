class StudentTableComponent < ViewComponent::Base
  def columns
    [
      {
        header: "First Name",
        accessor: :first_name
      },
      {
        header: "Last Name",
        accessor: :last_name
      },
      {
        header: "GPA",
        accessor: ->(model) { model.gpa.round(2) },
        column: :gpa,
        type: :input
      }
    ]
  end
end
