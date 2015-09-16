require 'rails_helper'
require 'spec_helper'
require 'support/utilities'

describe "Static pages" do
    subject {page}
    
    shared_examples_for "all static pages" do
        it {should have_selector('h1',text:heading) }
        it {should have_title (full_title(page_title))}
    end
    
    
     describe "Home page" do
      before {visit root_path}
         let(:heading) {'Lunch Ordering'}
         let(:page_title) {''}
         it {should_not have_title ('Lunch Ordering')}
         it { should have_link("Sign up now", href: signup_path) }
     end

    
    
end
