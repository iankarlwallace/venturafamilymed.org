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
     *
     * To be able to click complicated buttons/links that have duplicates
     * in the page select with Xpath.  Not ideal but will work.
     * Mink expects not to have /html/body on xpaths so omit that
	   */
    public function iPressButtonWithXpath($xpath)
    {
      $session = $this->getSession();
      $page = $session->getPage();
      $selectorsHandler = $session->getSelectorsHandler();
      $selectorXpath = $selectorsHandler->selectorToXpath('xpath',$xpath);
      $element = $page->find('xpath', $selectorXpath);

      if (null === $element) {
        throw new \InvalidArgumentException(
          sprintf('Could not evaluate XPath: "%s"', $xpath)
        );
      } else {
	$element->click();
      }
    }
}
