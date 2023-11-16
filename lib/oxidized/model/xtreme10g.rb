# INSTALLED BY PUPPET - DO NOT EDIT
#

class Xtreme10G < Oxidized::Model
  # For Xtreme 10G switches
  #
  # Tested with Connecttech XDG201

  comment '! '
  prompt /[a-zA-Z\-]+[#] /

  cmd :all do |cfg|
    cfg.gsub! "\r", ''
  end

  cmd 'show version' do |cfg|
    comment cfg
  end

  cmd 'show running-config' do |cfg|
    cfg
  end

  cfg :ssh do
    password /^[a-z]+@[a-zA-Z\-]'s password: /
    post_login 'terminal length 0'
    pre_logout 'exit'
  end
end
