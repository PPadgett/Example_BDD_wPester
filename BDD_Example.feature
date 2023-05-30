Feature: Add a drive to a remote workstation
  As an administrator
  I want to add a new drive to a remote workstation
  So that I can increase storage capacity

  Scenario: Add a 60GB drive with the drive letter H:
    Given I am connected to the remote workstation
    When I add a 60GB drive with the drive letter H:
    Then the drive H: should exist on the remote workstation
    And the drive H: should have a capacity of 60GB