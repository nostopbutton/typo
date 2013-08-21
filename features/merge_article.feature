Feature: Merge Articles
  As a blog administrator
  In order organise my blog
  I want to be able to merge multiple articles on same topic in my blog

  Background:
    Given the blog is set up


  Scenario: A non-admin cannot merge articles.
  	Given I am  logged in as non-admin
  	And I am on the edit article 1 page
  	Then I should not see "Merge Articles"



  Scenario: When articles are merged, the merged article should contain the text of both previous articles.
  	Given I am logged into the admin panel
  	And I am on the edit article 1 page
  	Then I should see "Merge Articles"
  	When I fill in "merge_article_id" with "3"
    And I press "Merge"
    Then I should be on the admin content page
    And show me the page
    And I should see "Article 1 was merged successfully with 3"
    And I should see "Hello World!"
    When I follow "Hello World!"
    And show me the page
    Then I should see "first article"
    And I should see "second article"

  Scenario: When articles are merged, the merged article should have one author (either one of the authors of the two original articles).
    Pending

  Scenario: Comments on each of the two original articles need to all carry over and point to the new, merged article.

  Scenario: The title of the new article should be the title from either one of the merged articles.

  Scenario: The form field containing the ID of the article to merge with must have the HTML attribute name set to merge_with. This requirement is present for the sole purpose of allowing the autograder to identify the merge functionality in your deployed application and is not something you would normally do in Rails. There should be exactly one input element with the name merge_with on the edit article page.
