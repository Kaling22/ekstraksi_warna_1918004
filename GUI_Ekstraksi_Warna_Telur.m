function varargout = GUI_Ekstraksi_Warna_Telur(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_Ekstraksi_Warna_Telur_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_Ekstraksi_Warna_Telur_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end

function GUI_Ekstraksi_Warna_Telur_OpeningFcn(hObject, eventdata, handles, varargin)

handles.output = hObject;

guidata(hObject, handles);

function varargout = GUI_Ekstraksi_Warna_Telur_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;

function btn_input_Callback(hObject, eventdata, handles)
open=guidata(gcbo);
[citra]=uigetfile({'*.jpg;*.png'},'openimage');
citra2=imread(citra);
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(citra2));
set(open.axes1,'Userdata',citra2);

function btn_ekstraksi_Callback(hObject, eventdata, handles)
open = guidata(gcbo);
data=get(open.axes1,'Userdata');
merah=data(:,:,1);
red=mean(mean(merah));
hijau=data(:,:,2);
green=mean(mean(hijau));
biru=data(:,:,3);
blue=mean(mean(biru));
avrred=red/255;
avrgreen=green/255;
avrblue=blue/255;
set(handles.red,'String',avrred);
set(handles.green,'String',avrgreen);
set(handles.blue,'String',avrblue);

function red_Callback(hObject, eventdata, handles)

function red_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function green_Callback(hObject, eventdata, handles)

function green_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function blue_Callback(hObject, eventdata, handles)

function blue_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
