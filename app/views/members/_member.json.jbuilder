json.extract! member, :id, :FirstName, :LastName, :BirthDate, :Occupation, :ProfileImage, :created_at, :updated_at
json.url member_url(member, format: :json)
