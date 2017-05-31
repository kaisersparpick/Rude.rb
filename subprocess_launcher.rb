class SubprocessLauncher
    attr_reader :result
    
    def initialize
        @result = ""
    end
    
    # Do I want to return to my script, ever?
    def return_to_script
        return get_random_value
    end
    
    # Is it OK to block until the process completes?
    def block_until_completes
        return get_random_value
    end
    
    # Do I need the pro0gram's output to be returned?
    def return_output
        return get_random_value
    end
    
    # Do I need to interact with the output?
    def interact_with_output
        return get_random_value
    end
    
    # Do I want STDERR?
    def require_stderr
        return get_random_value
    end
    
    # Do I want STDERR in its own separate stream?
    def require_stderr_stream
        return get_random_value
    end
    
    def use_exec
        @result = "Use exec()"
        return nil
    end
    
    # Easily capture the output in a variable
    def use_backticks
        @result = "Use backticks `` or %x{}"
        return nil
    end
    
    # Outputs to STDOUT
    def use_system
        @result = "Use system()"
        return nil
    end
    
    # Capture STDERR separately from STDOUT
    def use_popopen3
        @result = "Use Open3.popopen3()"
        return nil
    end
    
    # Separate child process. Good for daemonizing
    def use_fork
        @result = "Use fork()"
        return nil
    end
    
    # You can still use 2>&1 to combine STDERR with STDOUT
    def use_popen
        @result = "Use IO.popen()"
        return nil
    end
    
    # Emulates a terminal unconditionally
    def use_spawn
        @result = "Use PTY.spawn()"
        return nil
    end
    
    def get_random_value
        return rand(13) % 2 == 0
    end
end