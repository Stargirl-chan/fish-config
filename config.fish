if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx XDG_RUNTIME_DIR /home/star/runtime/

# opam configuration
source /home/star/.opam/opam-init/init.fish > /dev/null 2> /dev/null; or true
