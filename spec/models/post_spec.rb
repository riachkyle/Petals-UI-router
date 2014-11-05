require 'rails_helper'

RSpec.describe Post, :type => :model do
  it { should respond_to(:caption)}
  it { should respond_to(:pic)}
  it { should have_attached_file(:pic) }
  it { should validate_attachment_presence(:pic) }
  it { should validate_attachment_content_type(:pic).
                allowing('image/png', 'image/gif').
                rejecting('text/plain', 'text/xml') }
  #it { should validate_attachment_size(:pic).
                #less_than(2.megabytes) }
end
