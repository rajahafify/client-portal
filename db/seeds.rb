superadmin = User.find_or_create_by!(email: "superadmin@example.com") do |user|
  user.password = "password"
  user.role = "superadmin"
end

admin = User.find_or_create_by!(email: "admin@example.com") do |user|
  user.password = "password"
  user.role = "admin"
end

client_user = User.find_or_create_by!(email: "client@example.com") do |user|
  user.password = "password"
  user.role = "client"
end

Client.find_or_create_by!(company_name: "Acme Corp") do |client|
  client.contact_no = "+1-555-0100"
  client.contact_email = "owner@acme.example"
  client.user = client_user
end
