class Doctor
  attr_reader :id, :specialty
  attr_accessor :name
  #iniitlize doctor
  def initialize(attributes)
    @id = attributes.fetch(:id)
    @specialty = attributes.fetch(:specialty)
    @name = attributes.fetch(:name)
  end

  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      id = doctor.fetch("id").to_i
      specialty = doctor.fetch("specialty")
      doctors.push(Doctor.new({:name => name, :specialty => specialty, :id => id}))
    end
    doctors
  end

  # doctor.save()
  def save()
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  def ==(another_list)
    (self.name.==another_list.name).&(self.id.==another_list.id)
  end
  # doctor.find(id or name?)

  #doctor.all()
    # lists doctors

  #doctor.assign()
  #send doctor foreign key to patient
end
