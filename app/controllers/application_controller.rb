class ApplicationController < ActionController::Base
    layout -> { @stimulus_reflex ? false : 'application' }
end
