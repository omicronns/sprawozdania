function [line] = linecrt(xpp,ypp,dpp,len)

line=linspace(-xpp*dpp+ypp,-xpp*dpp+ypp+dpp*len,len);

end

