%Girdiğiniz yarıçap değerine göre dairenin alanını ve çevresini hesaplayan program

clc; clear
r = 0;

while r <= 0
    
    r = input('Lütfen yarıçap belirtin: ');
   
    if r <= 0
        msgbox('Invalid Value', 'Error','error')
    else
        while 1
            
            alan = pi*(r^2);
            cevre = 2*pi*r;
            msgbox('Hesaplamalar yapıldı. Ekranda sonuçları okuyabilirsiniz', 'İşlem Başarılı')
            disp('Çevre: '); disp(cevre)
            disp('Alan: '); disp(alan)
            
            while 1
                a = input('Y or N to continue: ', 's');
                if a == 'y' 
                     while 1  
                         r = input('Lütfen yarıçap belirtin: ');

                         if r <= 0
                             msgbox('Invalid Value', 'Error','error')

                         else
                             break;
                         end
                     end
                 break;

                elseif a == 'n'
                    break;
                
                else
                    msgbox('Invalid Value', 'Error','error')
                end
            end
            if a == 'n'
                break;
            else
               
            end
        end
    end 
    
end
