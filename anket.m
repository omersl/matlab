% Anket programı

clc; clear

a = 0;
b = 0;
c = 0;
d = 0;

while 1

    while 1
        oy = input('Tuttuğunuz takımı oylayın (a = Galatasaray, b = Bursaspor, c = Fenerbahçe) : ','s');
        if oy == 'a'
            a = a+1;
        elseif oy == 'b'
            b = b+1;
        elseif oy == 'c'
            c = c+1;
        elseif oy == 'sonuc'
            break;
        else
            msgbox('Yanlış Oy kullandınız. Lütfen tekrar deneyin.');
            d = d+1;
        end
        
    end
break; 
end

fprintf('Sonuçlar a takımı %5.2f oy, b takımı %5.2f oy ve c takımı %5.2f oy aldı. Yanlış oy girenlerin sayısı: %5.2f ',a,b,c,d);
