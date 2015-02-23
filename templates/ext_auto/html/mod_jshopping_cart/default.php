<div id = "jshop_module_cart">
	<div class="products"><span id = "jshop_quantity_products"><?php print $cart->count_product?></span>&nbsp;<?php print JText::_('PRODUCTS')?></div>
	<div class="summ_product"><span id = "jshop_summ_product"><?php print formatprice($cart->getSum(0,1))?></span></div>
	<div class="go_to_cart"><a href = "<?php print SEFLink('index.php?option=com_jshopping&controller=cart&task=view', 1)?>"><?php print JText::_('GO TO CART')?></a></div>
</div>