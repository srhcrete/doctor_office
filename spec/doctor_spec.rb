
require('rspec')
require('pg')
require('doctor')
require('spec_helper')

DB = PG.connect({:dbname => 'office_test'})

describe(Doctor) do
  describe('.all') do
    it('is empty at first')do
      expect(Doctor.all()).to eq([])
    end
  end

  describe('#initialize') do
    it('create a new doctor object with name, specialty, and id')do
      doctor = Doctor.new({:name => "Dr. Magoo", :specialty => "Optometry", :id => nil})
      expect(doctor.name).to eq("Dr. Magoo")
    end
  end

  describe("#name") do
    it("tells you its name") do
      doctor = Doctor.new({:name => "Dr. Magoo", :specialty => "Optometry", :id => nil})
      expect(doctor.name()).to(eq("Dr. Magoo"))
    end
  end

  describe("#specialty") do
    it("tells you its specialty") do
      doctor = Doctor.new({:name => "Dr. Magoo", :specialty => "Optometry", :id => nil})
      expect(doctor.specialty()).to(eq("Optometry"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      doctor = Doctor.new({:name => "Dr. Magoo", :specialty => "Optometry", :id => nil})
      doctor.save()
      expect(doctor.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#save') do
    it('saves new doctor to doctor list')do
      new_doctor = Doctor.new({:name => "Dr. Magoo", :specialty => "Optometry", :id => nil})
      new_doctor.save()
      expect(Doctor.all()).to eq([new_doctor])
    end
  end
  describe("#==") do
  it("is the same list if it has the same name") do
    doctor1 = Doctor.new({:name => "Dr. Magoo", :specialty => "Optometry", :id => nil})
    doctor2 = Doctor.new({:name => "Dr. Magoo", :specialty => "Optometry", :id => nil})
    expect(doctor1).to(eq(doctor2))
  end
end
end
