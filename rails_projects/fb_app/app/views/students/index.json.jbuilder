json.array!(@students) do |student|
  json.extract! student, :name, :email, :password_digest, :password, :password_confirmation
  json.url student_url(student, format: :json)
end