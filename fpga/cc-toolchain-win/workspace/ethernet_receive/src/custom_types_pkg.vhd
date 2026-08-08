library ieee;
use ieee.std_logic_1164.all;

package custom_types_pkg is
    type ether_controller_mode is (NORMAL, DEBUG);
    constant DEFAULT_CONTROLLER_MODE : CONTROLLER_MODE := NORMAL;
end package custom_types_pkg;