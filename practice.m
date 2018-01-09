function varargout = practice(varargin)
% PRACTICE MATLAB code for practice.fig
%      PRACTICE, by itself, creates a new PRACTICE or raises the existing
%      singleton*.
%
%      H = PRACTICE returns the handle to a new PRACTICE or the handle to
%      the existing singleton*.
%
%      PRACTICE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PRACTICE.M with the given input arguments.
%
%      PRACTICE('Property','Value',...) creates a new PRACTICE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before practice_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to practice_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help practice

% Last Modified by GUIDE v2.5 09-Jan-2018 11:30:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @practice_OpeningFcn, ...
                   'gui_OutputFcn',  @practice_OutputFcn, ...
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


% --- Executes just before practice is made visible.
function practice_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to practice (see VARARGIN)

% Choose default command line output for practice
handles.output = hObject;

handles.t = linspace(0, 2*pi, 100);
handles.y = cos(handles.t);
T = timer;
T.period = 1;
T.ExecutionMode = 'fixedRate';
T.TimerFcn = @Update_Fcn;
handles.timer = T;
an = animatedline;
axis([0,2*pi,-1,1])
c = struct();
c.idx = 1;
c.xData = handles.t;
c.yData = handles.y;
c.handle = an;
handles.timer.UserData = c;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes practice wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = practice_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)
% hObject    handle to startButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
start(handles.timer);


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in stopButton.
function stopButton_Callback(hObject, eventdata, handles)
% hObject    handle to stopButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stop(handles.timer);

% Local function for updating graph
function Update_Fcn(obj, evt)
c = obj.UserData;
if c.idx <= size(c.xData,2)
    for i = 1:5
        x = c.xData(c.idx);
        y = c.yData(c.idx);
        addpoints(c.handle, x, y);
        c.idx = c.idx + 1;
    end
    obj.UserData = c;
    drawnow
else
    stop(obj);
end
