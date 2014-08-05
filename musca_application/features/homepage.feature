Feature: Musca home
	In order to use the website
	As a user
	I need to be able to enter the homepage

    @javascript
	Scenario: Enter homepage
		Given I go to "http://localhost/musca/Musca-Kito/"
		Then I should see "Home"