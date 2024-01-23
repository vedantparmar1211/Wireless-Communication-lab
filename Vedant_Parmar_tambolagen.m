%Author= Vedant Parmar(bt21ece082) date=17/01/2024

% Clear Command Window
clc;

% Clear Workspace
clear all;

% Define the number ranges for each column in the ticket
numberRanges = {[1 10], [11 20], [21 30], [31 40], [41 50], [51 60], [61 70], [71 80], [81 90]};

% Specify the number of tickets to generate
totalTickets = 5;

% Loop over the total number of tickets to be generated
for ticketCount = 1:totalTickets
    % Initialize an empty ticket with 3 rows and 9 columns
    bingoTicket = zeros(3, 9);

    % Loop over each column in the ticket
    for columnIndex = 1:9
        % Get the range of numbers for the current column
        currentColumnRange = numberRanges{columnIndex};
        % Generate a list of available numbers for the current column
        availableNumbers = currentColumnRange(1):currentColumnRange(2);

        % Randomly decide the number of blank spaces for this column (either 1 or 2)
        numberOfBlanks = randi([1, 2]);

        % Randomly select non-blank numbers from the available numbers
        selectedNumbers = randsample(availableNumbers, 3 - numberOfBlanks);
        
        % Sort the selected numbers in ascending order and add blank spaces
        bingoTicket(:, columnIndex) = sort([selectedNumbers zeros(1, numberOfBlanks)]);

        % Randomly shuffle the numbers within the column to mix blanks and non-blanks
        bingoTicket(:, columnIndex) = bingoTicket(randperm(3), columnIndex);
    end

    % Display the generated bingo ticket
    disp(['Tambola Ticket Number ' num2str(ticketCount) ':']);
    disp(bingoTicket);
    disp(' ');
end
