%% MATLAB Android IO Gui Programı
% Program ile belli bir pine voltaj ayarı yapabilirisiniz. (~ PWM)

classdef Lamp < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        ArduinoPotansiyometreUIFigure  matlab.ui.Figure
        VoltajEditFieldLabel           matlab.ui.control.Label
        VoltajEditField                matlab.ui.control.NumericEditField
        VerVoltajBabacmButton          matlab.ui.control.Button
        ArduinoyaBalanButton           matlab.ui.control.Button
        Label                          matlab.ui.control.Label
        NOTUygulamasadece9pindealmaktadrLabel  matlab.ui.control.Label
        KsaDevreButton                 matlab.ui.control.Button
    end


    properties (Access = private)
         % Text information about connection of Arduino
        ConnectionLabel  matlab.ui.control.Label
    end

    methods (Access = private)

        % Value changed function: VoltajEditField
        function voltage(app, event)

        end

        % Button pushed function: VerVoltajBabacmButton
        function seviye(app, event)
            value = app.VoltajEditField.Value;
            clear a;
            global a b c;
            a = value;
            if b ~= c
                msgbox('Lütfen Arduinonuzu bağlayın!'); % Bağlantı yapmadan voltaj verilmesini engelledik.
            else
                b.analogWrite(9, a); % Bağlantı yapıldıktan sonra pini tanımladık ve çalışmasına izin verdik.
            end
        end

        % Button pushed function: ArduinoyaBalanButton
        function connection(app, event)
            delete(instrfind({'Port'},{'COM6'})); % Farklı bir port kullanılmasına karşı. Kullanılan portu temizledik.
            clear b;  % b değişkenini temizledik.
            global c b; % Değişkenlerimizi global tanımladık.
            c = arduino('COM6'); % c değişkeini porta bağlama komutuyla eşitledik.
            b = c; % Arduino'ya bağlantıyı yaptık.
            b.pinMode(9,'OUTPUT'); % Bağlantıdan sonra pinimizi tanımladık.
            if b == c % b = c ise yani b = COM6'ya bağlı ise Bağlandı yazsın.
                app.Label = uilabel(app.ArduinoPotansiyometreUIFigure);
                app.Label.FontSize = 28;
                app.Label.FontColor = [0.47 0.67 0.15];
                app.Label.Position = [121 11 25 56];

                app.Label.Text = '•';
            else  % değilse bağlı değil yazsın.
                app.Label = uilabel(app.ArduinoPotansiyometreUIFigure);
                app.Label.FontSize = 28;
                app.Label.FontColor = [1 0 0];
                app.Label.Position = [121 11 25 56];
                
                app.Label.Text = '•';
            end
            
        end

        % Callback function
        function pin(app, event)
            
        end

        % Button pushed function: KsaDevreButton
        function kisa_devre(app, event)
        delete(instrfind({'Port'},{'COM6'}))
        b = 0;
        msgbox('Bağlantı Kesildi!');
        end
    end

    % App initialization and construction
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create ArduinoPotansiyometreUIFigure
            app.ArduinoPotansiyometreUIFigure = uifigure;
            app.ArduinoPotansiyometreUIFigure.Color = [0.9412 0.9412 0.9412];
            app.ArduinoPotansiyometreUIFigure.Position = [100 100 338 111];
            app.ArduinoPotansiyometreUIFigure.Name = 'Arduino Potansiyometre';

            % Create VoltajEditFieldLabel
            app.VoltajEditFieldLabel = uilabel(app.ArduinoPotansiyometreUIFigure);
            app.VoltajEditFieldLabel.HorizontalAlignment = 'right';
            app.VoltajEditFieldLabel.Position = [17 70 30 15];
            app.VoltajEditFieldLabel.Text = 'Voltaj';

            % Create VoltajEditField
            app.VoltajEditField = uieditfield(app.ArduinoPotansiyometreUIFigure, 'numeric');
            app.VoltajEditField.Limits = [0 255];
            app.VoltajEditField.ValueChangedFcn = createCallbackFcn(app, @voltage, true);
            app.VoltajEditField.HorizontalAlignment = 'center';
            app.VoltajEditField.FontWeight = 'bold';
            app.VoltajEditField.FontColor = [0 0 1];
            app.VoltajEditField.Position = [62 66 95 22];

            % Create VerVoltajBabacmButton
            app.VerVoltajBabacmButton = uibutton(app.ArduinoPotansiyometreUIFigure, 'push');
            app.VerVoltajBabacmButton.ButtonPushedFcn = createCallbackFcn(app, @seviye, true);
            app.VerVoltajBabacmButton.FontWeight = 'bold';
            app.VerVoltajBabacmButton.FontColor = [1 0 0];
            app.VerVoltajBabacmButton.Position = [186 66 111 22];
            app.VerVoltajBabacmButton.Text = 'Ver Voltajı Babacım!';

            % Create ArduinoyaBalanButton
            app.ArduinoyaBalanButton = uibutton(app.ArduinoPotansiyometreUIFigure, 'push');
            app.ArduinoyaBalanButton.ButtonPushedFcn = createCallbackFcn(app, @connection, true);
            app.ArduinoyaBalanButton.Position = [17 37 100 22];
            app.ArduinoyaBalanButton.Text = 'Arduino''ya Bağlan!';

            % Create Label
            app.Label = uilabel(app.ArduinoPotansiyometreUIFigure);
            app.Label.FontSize = 28;
            app.Label.FontColor = [1 0 0];
            app.Label.Position = [121 11 25 56];
            app.Label.Text = '•';

            % Create NOTUygulamasadece9pindealmaktadrLabel
            app.NOTUygulamasadece9pindealmaktadrLabel = uilabel(app.ArduinoPotansiyometreUIFigure);
            app.NOTUygulamasadece9pindealmaktadrLabel.VerticalAlignment = 'center';
            app.NOTUygulamasadece9pindealmaktadrLabel.FontName = 'Arial';
            app.NOTUygulamasadece9pindealmaktadrLabel.FontWeight = 'bold';
            app.NOTUygulamasadece9pindealmaktadrLabel.FontColor = [0.302 0.749 0.9294];
            app.NOTUygulamasadece9pindealmaktadrLabel.Position = [17 11 274 15];
            app.NOTUygulamasadece9pindealmaktadrLabel.Text = 'NOT: Uygulama sadece 9. pinde çalışmaktadır!';

            % Create KsaDevreButton
            app.KsaDevreButton = uibutton(app.ArduinoPotansiyometreUIFigure, 'push');
            app.KsaDevreButton.ButtonPushedFcn = createCallbackFcn(app, @kisa_devre, true);
            app.KsaDevreButton.FontWeight = 'bold';
            app.KsaDevreButton.FontAngle = 'italic';
            app.KsaDevreButton.FontColor = [0.4706 0.6706 0.1882];
            app.KsaDevreButton.Position = [186 37 100 22];
            app.KsaDevreButton.Text = 'Kısa Devre';
        end
    end

    methods (Access = public)

        % Construct app
        function app = Lamp

            % Create and configure components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.ArduinoPotansiyometreUIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.ArduinoPotansiyometreUIFigure)
        end
    end
end
