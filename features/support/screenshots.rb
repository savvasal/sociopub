After('@javascript') do |scenario|
  if(scenario.failed?)
    page.driver.browser.save_screenshot("/home/salexa/workspace/sociopub-features/#{scenario.__id__}.png")
    # the path could be in different file
    embed("/home/salexa/workspace/sociopub-features/#{scenario.__id__}.png", "image/png", "SCREENSHOT")
  end
end
