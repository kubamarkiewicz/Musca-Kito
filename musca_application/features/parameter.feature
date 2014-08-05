Feature: Parameter
	In order to see my name on homepage
	As a user
	I need to be able to pass my name as a parameter in URL

	Scenario: Send parameter to homepage
		Given I go to "http://localhost/musca/Musca-Kito/Kuba"
		Then I should see "param=Kuba"