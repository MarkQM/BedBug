Homework 4 feedback
-------------------

CRUD stuff all looks good.  Good work on that.

Filtering and sorting all looks good, too.

Saving to session mostly works nicely.  The only rough spot is that when you display the filter form, you should also include the current filter setting so that a user can add to the filters while still retaining existing filter settings easily.  As is, a user has to retype any filter settings plus any new ones in order to keep refining any existing filters.

Good work on the redirection for keeping things RESTful.

Overall, really nice job.

95/100

-----------------

Automated test results are below, but I ran your code in development environment to do the testing.  I used the test results mainly to help focus my evaluation.

-----------------


/usr/local/Cellar/ruby/2.4.2/bin/ruby -I/usr/local/lib/ruby/gems/2.4.0/gems/rspec-core-3.6.0/lib:/usr/local/lib/ruby/gems/2.4.0/gems/rspec-support-3.6.0/lib /usr/local/lib/ruby/gems/2.4.0/gems/rspec-core-3.6.0/exe/rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb
FF.....FFFFF....F.FF..............

Failures:

  1) show page should be able to create a new rental property
     Failure/Error: expect(page).to have_link("Create a new rental property listing")
       expected to find visible link "Create a new rental property listing" but there were no matches
     # ./spec/features/create_request_spec.rb:12:in `block (2 levels) in <top (required)>'
     # ./spec/spec_helper.rb:28:in `block (3 levels) in <top (required)>'
     # ./spec/spec_helper.rb:27:in `block (2 levels) in <top (required)>'

  2) show page should be able to create a new rental property
     Failure/Error: expect(page).to have_link("Create a new rental property listing")
       expected to find visible link "Create a new rental property listing" but there were no matches
     # ./spec/features/create_request_spec.rb:35:in `block (2 levels) in <top (required)>'
     # ./spec/spec_helper.rb:28:in `block (3 levels) in <top (required)>'
     # ./spec/spec_helper.rb:27:in `block (2 levels) in <top (required)>'

  3) index page should do the correct filtering when filtering by maxpersons
     Failure/Error: fill_in "Maximum occupants", :with => "10"

     Capybara::ElementNotFound:
       Unable to find visible field "Maximum occupants" that is not disabled
     # ./spec/features/index_request_spec.rb:46:in `block (2 levels) in <top (required)>'
     # ./spec/spec_helper.rb:28:in `block (3 levels) in <top (required)>'
     # ./spec/spec_helper.rb:27:in `block (2 levels) in <top (required)>'

  4) index page should do the correct filtering when filtering by bathrooms
     Failure/Error: fill_in "Number of bathrooms", :with => "4"

     Capybara::ElementNotFound:
       Unable to find visible field "Number of bathrooms" that is not disabled
     # ./spec/features/index_request_spec.rb:64:in `block (2 levels) in <top (required)>'
     # ./spec/spec_helper.rb:28:in `block (3 levels) in <top (required)>'
     # ./spec/spec_helper.rb:27:in `block (2 levels) in <top (required)>'

  5) index page should do the correct filtering when filtering by price
     Failure/Error: fill_in "Maximum price", :with => "1"

     Capybara::ElementNotFound:
       Unable to find visible field "Maximum price" that is not disabled
     # ./spec/features/index_request_spec.rb:82:in `block (2 levels) in <top (required)>'
     # ./spec/spec_helper.rb:28:in `block (3 levels) in <top (required)>'
     # ./spec/spec_helper.rb:27:in `block (2 levels) in <top (required)>'

  6) index page should do the correct filtering when filtering by distance
     Failure/Error: fill_in "Within", :with => "100"

     Capybara::ElementNotFound:
       Unable to find visible field "Within" that is not disabled
     # ./spec/features/index_request_spec.rb:100:in `block (2 levels) in <top (required)>'
     # ./spec/spec_helper.rb:28:in `block (3 levels) in <top (required)>'
     # ./spec/spec_helper.rb:27:in `block (2 levels) in <top (required)>'

  7) index page should have a link to create a new property
     Failure/Error: expect(page).to have_link("Create a new rental property listing")
       expected to find visible link "Create a new rental property listing" but there were no matches
     # ./spec/features/index_request_spec.rb:121:in `block (2 levels) in <top (required)>'
     # ./spec/spec_helper.rb:28:in `block (3 levels) in <top (required)>'
     # ./spec/spec_helper.rb:27:in `block (2 levels) in <top (required)>'

  8) show page should have a link to edit the property
     Failure/Error: expect(page).to have_link("Edit rental property details")
       expected to find visible link "Edit rental property details" but there were no matches
     # ./spec/features/show_request_spec.rb:39:in `block (2 levels) in <top (required)>'
     # ./spec/spec_helper.rb:28:in `block (3 levels) in <top (required)>'
     # ./spec/spec_helper.rb:27:in `block (2 levels) in <top (required)>'

  9) show page should correctly allow a property to be updated
     Failure/Error: expect(page).to have_link("Edit rental property details")
       expected to find visible link "Edit rental property details" but there were no matches
     # ./spec/features/update_request_spec.rb:14:in `block (2 levels) in <top (required)>'
     # ./spec/spec_helper.rb:28:in `block (3 levels) in <top (required)>'
     # ./spec/spec_helper.rb:27:in `block (2 levels) in <top (required)>'

  10) show page should correctly allow a property to be updated
      Failure/Error: expect(page).to have_link("Edit rental property details")
        expected to find visible link "Edit rental property details" but there were no matches
      # ./spec/features/update_request_spec.rb:30:in `block (2 levels) in <top (required)>'
      # ./spec/spec_helper.rb:28:in `block (3 levels) in <top (required)>'
      # ./spec/spec_helper.rb:27:in `block (2 levels) in <top (required)>'

Finished in 4.19 seconds (files took 2 seconds to load)
34 examples, 10 failures

Failed examples:

rspec ./spec/features/create_request_spec.rb:11 # show page should be able to create a new rental property
rspec ./spec/features/create_request_spec.rb:34 # show page should be able to create a new rental property
rspec ./spec/features/index_request_spec.rb:45 # index page should do the correct filtering when filtering by maxpersons
rspec ./spec/features/index_request_spec.rb:63 # index page should do the correct filtering when filtering by bathrooms
rspec ./spec/features/index_request_spec.rb:81 # index page should do the correct filtering when filtering by price
rspec ./spec/features/index_request_spec.rb:99 # index page should do the correct filtering when filtering by distance
rspec ./spec/features/index_request_spec.rb:120 # index page should have a link to create a new property
rspec ./spec/features/show_request_spec.rb:37 # show page should have a link to edit the property
rspec ./spec/features/update_request_spec.rb:11 # show page should correctly allow a property to be updated
rspec ./spec/features/update_request_spec.rb:27 # show page should correctly allow a property to be updated

Coverage report generated for RSpec to /Users/jsommers/Dropbox/classes/cosc480/grades/hw345/MarkQM/coverage. 358 / 517 LOC (69.25%) covered.
