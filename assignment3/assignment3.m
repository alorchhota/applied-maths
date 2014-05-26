a = 2;
b = 0;
x = -10:.1:10;

figure;
f = 1 ./ (1+exp(a.*(b-x)));
f1 = a .* f .* (1-f);
g = 0.5 + 0.25 .* a .* (x-b);

plot(x,f,'-', 'LineWidth',  1);
xlabel('x');
hold on;
plot(x, f1, ':', 'LineWidth',  2);
plot(x, g, '-.');
ylim([-2,2])
legend('f', 'f ''', 'Approximated f')

saveas(gcf, 'assignment-3.png', 'png')