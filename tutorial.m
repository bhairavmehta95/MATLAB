% Just an introduction to MATLAB as a language, and what you can do with it

%% BASICS %%

% Declaring variables, just give it a name and a value 
x = 1;
y = 2

% The above will work, but it is good practice to use semi-colons like we
% do when we declare the variable x. When you use semi-colons, you SUPPRESS
% OUTPUT, which means that the variable WILL NOT show up in the Command
% Window. Very important to remember when doing large operations

x + y 

% the above will assign the answer to x + y to the temporary MATLAB
% variable, ans. You can keep track of your variables in the Workspace on
% the right of the screen

% In any computer langauge, syntax/capitalization matters meaning:

X = 10

% will create a different variable than its lowercase counterpart

%% MATRICES AND ARRAYS
% if you want to create an ARRAY (a list of data), use the following
% syntax:

array = [1,2,3,4,5];

% multiplies everything in the array by 2
array_twice = 2*array;

% Matlab is a MATRIX langauge, so every number is represented by a 1x1
% matrix, and you can declare larger matrices like so. The bottom will
% create a matrix that looks like: Normal matrix arithmetic rules apply.

% 2 2 
% 4 5

mat = [2 2; 4 5];

% Multiply by scalar
mat_twice = mat*2;

% Adding
mat_large = mat + mat_twice;

% Multiply two 2x2 matrices -- follows order of operations!
mat_large * mat_twice + mat


%% FOR LOOPS AND WHILE LOOPS
% These are important because they help you do things automatically until:
% 1. A condition is satisfied (a number is under a threshold)
% 2. You reach a maximum number of 'steps' you are willing to take

% Rand creates a random matrix of the size you pass into it: rand(rows,
% columns. The below creates a 10 column array filled with random numbers

ran_array = rand(1,10);

% Here we are using a counter 'i' to track our progress through the array.
% We can access the i-th value of rand-array by using (i) -- the indexing
% operator. MATLAB is a 1-index langauge, i.e the first value of an array
% is array(1) and the top-left value of a matrix is (1,1)

for i=1:i<=10
   rand_array(i) = rand_array(i) * i; %multiplies that rand value by 1,2,3...
end

% While loops are essentially the same thing, but they are usually used
% when we don't know how many iterations soething might take.

threshold = 100;

i = 1;
sum = 0;

% adds 1,2,3... until the sum of the values is greater than 100
while sum < threshold
    sum = sum + i;
    i = i + 1;
end


%% FUNCTIONS -- We'll get to this tonight 
% (more relevant to you, but you need the fundamentals to understand it)

function_for_fun = @(x) sin(x);

% the above is how you declare functions in matlab


