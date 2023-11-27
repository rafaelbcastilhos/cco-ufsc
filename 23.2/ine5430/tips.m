function [ tip ] = calc_tip(service, food )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
servRatio=0.8;
if service<3,
    tip=((0.10/3)*service+0.05)*servRatio + ...
        (1-servRatio)*(0.20/10*food+0.05);
elseif service<7,
    tip=(0.15)*servRatio + ...
        (1-servRatio)*(0.20/10*food+0.05);
else
    tip=((0.10/3)*(service-7)+0.15)*servRatio + ...
        (1-servRatio)*(0.20/10*food+0.05);
end

end
