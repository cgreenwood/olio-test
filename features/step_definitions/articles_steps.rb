Given('I am on the home page') do
  visit root_path
  page.should have_css('h1', text: 'Articles')
end

Then('I can see multiple articles are available') do
  articles = all('div.card.article-card')
  expect(articles.count).to be_positive
end

Then('I can see the {string} article is available') do |article_name|
  page.should have_css('div.card.article-card h5', text: article_name)
end

Then('I can see the the like counter on {string} is {string}') do |article_name, like_count|
  within(find_article_by_name(article_name)) do
    should have_css('.like-counter', text: like_count)
  end
end

When('I click like on the {string}') do |article_name|
  within(find_article_by_name(article_name)) do
    should have_css('i.fa-solid.fa-heart')
    button = find('i.fa-solid.fa-heart').find(:xpath, '../..')
    button.click
  end
end

def find_article_by_name(article_name)
  find('div.card.article-card h5', text: article_name).find(:xpath, '../../../..')
end
