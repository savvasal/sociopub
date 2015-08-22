After('@javascript') do |scenario|
  if(scenario.failed?)
    page.driver.browser.save_screenshot("/home/salexa/workspace/sociopub-features/#{scenario.__id__}.png")
    embed("#{scenario.__id__}.png", "image/png", "SCREENSHOT")
  end
end
