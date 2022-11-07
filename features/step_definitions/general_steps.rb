Then('I can see the flash message with the text {string}') do |message|
  page.should have_css('.alert', text: message)
end
