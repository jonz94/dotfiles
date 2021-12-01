# composer aliases
function cr { composer require $args }
function crd { composer require --dev $args }
function cso { composer show -o $args }
function cug { composer global update --with-all-dependencies $args }
function cup { composer update --with-all-dependencies $args }
function cw { composer why $args }
