function varargout = demo1(varargin)
% DEMO1 MATLAB code for demo1.fig
%      DEMO1, by itself, creates a new DEMO1 or raises the existing
%      singleton*.
%
%      H = DEMO1 returns the handle to a new DEMO1 or the handle to
%      the existing singleton*.
%
%      DEMO1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DEMO1.M with the given input arguments.
%
%      DEMO1('Property','Value',...) creates a new DEMO1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before demo1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to demo1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help demo1

% Last Modified by GUIDE v2.5 10-Apr-2017 11:14:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @demo1_OpeningFcn, ...
                   'gui_OutputFcn',  @demo1_OutputFcn, ...
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


% --- Executes just before demo1 is made visible.
function demo1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to demo1 (see VARARGIN)

% Choose default command line output for demo1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes demo1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = demo1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global image;
global pic;
[filename pathname] = uigetfile({'*.jpg';'*.bmp'},'file select');
image = strcat(pathname, filename)
pic = imread(image);
axes(handles.Picture); imshow(pic);




% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global red1;
global pic;
rd= pic(:,:,1);
bk=zeros(size(rd));
red1=cat(3,rd,bk,bk);
axes(handles.Result); cla; imshow(red1);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global blue;
global pic;
bu= pic(:,:,3);
bk=zeros(size(bu));
blue=cat(3,bk,bk,bu);
axes(handles.Result); cla; imshow(blue);



% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global green;
global pic;
gr= pic(:,:,2);
bk=zeros(size(gr));
green=cat(3,bk,gr,bk);
axes(handles.Result); cla; imshow(green);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
exit


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.Result); cla;


% --- Executes on button press in Gray.
function Gray_Callback(hObject, eventdata, handles)
% hObject    handle to Gray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
gray = rgb2gray(pic);
axes(handles.Result); cla; imshow(gray);



% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global pic;
gray = rgb2gray(pic);
BW = edge(gray,'Sobel')
axes(handles.Result); cla; imshow(BW);

