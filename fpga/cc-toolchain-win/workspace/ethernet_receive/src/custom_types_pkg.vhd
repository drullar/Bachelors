library ieee;
use ieee.std_logic_1164.all;

package custom_types_pkg is
    type ether_controller_mode is (NORMAL, DEBUG);
    constant DEFAULT_CONTROLLER_MODE : ether_controller_mode := NORMAL;
end package custom_types_pkg;