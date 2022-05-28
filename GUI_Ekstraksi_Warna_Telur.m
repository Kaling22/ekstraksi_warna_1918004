function varargout = GUI_Ekstraksi_Warna_Telur(varargin)
% GUI_EKSTRAKSI_WARNA_TELUR MATLAB code for GUI_Ekstraksi_Warna_Telur.fig
%      GUI_EKSTRAKSI_WARNA_TELUR, by itself, creates a new GUI_EKSTRAKSI_WARNA_TELUR or raises the existing
%      singleton*.
%
%      H = GUI_EKSTRAKSI_WARNA_TELUR returns the handle to a new GUI_EKSTRAKSI_WARNA_TELUR or the handle to
%      the existing singleton*.
%
%      GUI_EKSTRAKSI_WARNA_TELUR('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_EKSTRAKSI_WARNA_TELUR.M with the given input arguments.
%
%      GUI_EKSTRAKSI_WARNA_TELUR('Property','Value',...) creates a new GUI_EKSTRAKSI_WARNA_TELUR or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_Ekstraksi_Warna_Telur_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_Ekstraksi_Warna_Telur_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI_Ekstraksi_Warna_Telur

% Last Modified by GUIDE v2.5 27-May-2022 18:54:58

% Begin initialization code - DO NOT EDIT
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
% End initialization code - DO NOT EDIT


% --- Executes just before GUI_Ekstraksi_Warna_Telur is made visible.
function GUI_Ekstraksi_Warna_Telur_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI_Ekstraksi_Warna_Telur (see VARARGIN)

% Choose default command line output for GUI_Ekstraksi_Warna_Telur
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI_Ekstraksi_Warna_Telur wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_Ekstraksi_Warna_Telur_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in btn_input.
function btn_input_Callback(hObject, eventdata, handles)
% hObject    handle to btn_input (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open=guidata(gcbo);
[citra]=uigetfile({'*.jpg;*.png'},'openimage');
citra2=imread(citra);
set(open.figure1,'CurrentAxes',open.axes1);
set(imagesc(citra2));
set(open.axes1,'Userdata',citra2);


% --- Executes on button press in btn_ekstraksi.
function btn_ekstraksi_Callback(hObject, eventdata, handles)
% hObject    handle to btn_ekstraksi (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
open = guidata(gcbo);
data=get(open.axes1,'Userdata');
merah=data(:,:,1);
hijau=data(:,:,2);
biru=data(:,:,3);
red=mean(mean(merah));
green=mean(mean(hijau));
blue=mean(mean(biru));
ratar=red/255;
ratag=green/255;
ratab=blue/255;
set(handles.red,'String',ratar);
set(handles.green,'String',ratag);
set(handles.blue,'String',ratab);



function red_Callback(hObject, eventdata, handles)
% hObject    handle to red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of red as text
%        str2double(get(hObject,'String')) returns contents of red as a double


% --- Executes during object creation, after setting all properties.
function red_CreateFcn(hObject, eventdata, handles)
% hObject    handle to red (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function green_Callback(hObject, eventdata, handles)
% hObject    handle to green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of green as text
%        str2double(get(hObject,'String')) returns contents of green as a double


% --- Executes during object creation, after setting all properties.
function green_CreateFcn(hObject, eventdata, handles)
% hObject    handle to green (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function blue_Callback(hObject, eventdata, handles)
% hObject    handle to blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of blue as text
%        str2double(get(hObject,'String')) returns contents of blue as a double


% --- Executes during object creation, after setting all properties.
function blue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to blue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
