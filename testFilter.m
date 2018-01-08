w = zeros(1,100);
w(10:90) = ones(1,81);
w = w + 0.1*rand(1,100);
subplot(121);plot(w);
ylim([-1,2]);
w1 = smooth(w,4);
%w1 = smooth(w1,4);
%w1 = smooth(w1,4);
subplot(122);plot(real(w1));
ylim([-1,2]);

