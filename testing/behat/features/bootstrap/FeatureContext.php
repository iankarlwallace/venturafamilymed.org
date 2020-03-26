<?php

use Behat\Behat\Context\Context;
use Behat\Gherkin\Node\PyStringNode;
use Behat\Gherkin\Node\TableNode;

# Require the composer stuff
require_once __DIR__.'/../../vendor/autoload.php';

/**
 * Defines application features from the specific context.
 */
class FeatureContext extends Behat\MinkExtension\Context\MinkContext
{
    /**
     * Initializes context.
     *
     * Every scenario gets its own context instance.
     * You can also pass arbitrary arguments to the
     * context constructor through behat.yml.
     */
    public function __construct()
    {
    }

    /**
	   * @Given I press button with XPath :xpath
	   */
    public function iPressButtonWithXpath($xpath)
	  {
      $session = $this->getSession();
      $element = $session->getPage()->find(
        'xpath',
        $session->getSelectorHandler()->selectorToXpath('xpath', $xpath)
      );
      if (null === $element) {
        throw new InvalidArgumentException(
          sprintf('Could not evaluate XPath: "%s"', $xpath)
        );
      }
      $element->click();
		}
}
