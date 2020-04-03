<?php
/**
 * @version    2.10.x
 * @package    K2
 * @author     JoomlaWorks https://www.joomlaworks.net
 * @copyright  Copyright (c) 2006 - 2019 JoomlaWorks Ltd. All rights reserved.
 * @license    GNU/GPL license: https://www.gnu.org/copyleft/gpl.html
 */

// no direct access
defined('_JEXEC') or die;

?>

<!-- Start K2 Item Layout COVID-19 -->
<?php if($this->item->params->get('latestItemTitle')): ?>
<!-- Item title -->
<li class="latestItemTitle">
    <?php if ($this->item->params->get('latestItemTitleLinked')): ?>
    <a href="<?php echo $this->item->link; ?>">
	<?php echo $this->item->title; ?>
    </a>
    <?php else: ?>
    <?php echo $this->item->title; ?>
    <?php endif; ?>
</li>
<?php endif; ?>
<!-- End K2 Item Layout COVID-19 -->
