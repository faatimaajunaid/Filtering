function varargout = mian_enhancement(varargin)
% MIAN_ENHANCEMENT MATLAB code for mian_enhancement.fig
%      MIAN_ENHANCEMENT, by itself, creates a new MIAN_ENHANCEMENT or raises the existing
%      singleton*.
%
%      H = MIAN_ENHANCEMENT returns the handle to a new MIAN_ENHANCEMENT or the handle to
%      the existing singleton*.
%
%      MIAN_ENHANCEMENT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MIAN_ENHANCEMENT.M with the given input arguments.
%
%      MIAN_ENHANCEMENT('Property','Value',...) creates a new MIAN_ENHANCEMENT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before mian_enhancement_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to mian_enhancement_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help mian_enhancement

% Last Modified by GUIDE v2.5 02-Nov-2020 15:07:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @mian_enhancement_OpeningFcn, ...
                   'gui_OutputFcn',  @mian_enhancement_OutputFcn, ...
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


% --- Executes just before mian_enhancement is made visible.
function mian_enhancement_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to mian_enhancement (see VARARGIN)

% Choose default command line output for mian_enhancement
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes mian_enhancement wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = mian_enhancement_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
inputfile = get(handles.edit1, 'string');
[output_enhancement_hor_ed,output_enhancement_ver_ed,output_enhancement_sharpening] = filtering_enhancement(inputfile);

axes(handles.axes1);
imshow(inputfile);
axes(handles.axes2);
imshow(output_enhancement_hor_ed);
axes(handles.axes3);
imshow(output_enhancement_ver_ed);
axes(handles.axes4);
imshow(output_enhancement_sharpening);
