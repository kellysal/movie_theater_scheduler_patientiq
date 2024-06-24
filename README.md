# Movie Theater Scheduler

### Introduction

It’s your frst day on the job for a small-town movie multiplex. The space contains multiple
screens, each playing a different movie throughout the day. Managing the schedule can be
difcult because there are stafng considerations with regard to theater setup, ticket sales, line
management, projector operation, and custodial duties.

Jane has been organizing the schedule manually but she’s planning to retire. The theater is
planning to add more screens, and potentially a second location. As such, they’d like to design
a robust system to handle scheduling rather than rely on a person to do the job. Below are the
rules Jane provided upon being asked exactly how she schedules runtimes for each screen.

## Movie Rules
Here is a list of the rules for each viewing of a movie:
* Each movie should start at easy to read times (eg 10:00, 10:05, 10:10)
* The start time of the movie is exactly at the posted start time
* Each movie requires 15 minutes for previews before the start of the movie
* Each movie requires 20 minutes after its end time to prepare the theater for the
next movie

## Theater Rules
Here is a list of rules that are global to the cinema:
* No movie should end after the cinema’s hours of operation
* The last showing should end as close as possible to the end of the cinema’s hours
of operation

### Hours of Operation

The theater has the following hours of operation:
* Monday - Thursday 11am - 11pm
* Friday - Sunday 10:30 am - 12 am
* The cinema requires 15 minutes after opening before the frst movie is shown.

## Requirements
Your system should be able to take in the details of each movie and output a start and end time of each show that abides by all of the provided rules. The runtime of each movie does
not include time for previews or cleanup.

The method of input can be interactive (GUI/Web/CLI) or via a structured input fle format. The
output of the system can also be via display or writing output fles.

### Example
Input:
* There’s Something About Mary (1998). Rated R. 134 minutes
* The Imitation Game (2014). Rated PG-13. 114 minutes
* The Hateful Eight (2015). Rated R. 187 minutes
* Liar Liar (1997). Rated PG-13. 86 minutes

Example Output:
```
Liar Liar
Weekday
1:10 PM - 2:36 PM
3:15 PM - 4:41 PM
5:20 PM - 6:46 PM
7:25 PM - 8:51 PM
9:30 PM - 10:56 PM
Weekend
12:05 PM - 1:31 PM
2:10 PM - 3:36 PM
4:15 PM - 5:41 PM
6:20 PM - 7:46 PM
8:25 PM - 9:51 PM
10:30 PM - 11:56 PM
And so on.....
```

## Working Solution

```
git clone repo
cd movie_theater_scheduler_patientiq
bundle install
bundle exec rspec spec/request
```

Expected Output:
```
+------------------------+
| Movie Theater Schedule |
+------------------------+

There’s Something About Mary
+------------------------+
|   Monday - Thursday    |
+------------------------+
12:15 PM -  2:29 PM
 3:05 PM -  5:19 PM
 5:55 PM -  8:09 PM
 8:45 PM - 10:59 PM
+------------------------+
|    Friday - Sunday     |
+------------------------+
 1:15 PM -  3:29 PM
 4:05 PM -  6:19 PM
 6:55 PM -  9:09 PM
 9:45 PM - 11:59 PM


The Imitation Game
+------------------------+
|   Monday - Thursday    |
+------------------------+
 1:35 PM -  3:29 PM
 4:05 PM -  5:59 PM
 6:35 PM -  8:29 PM
 9:05 PM - 10:59 PM
+------------------------+
|    Friday - Sunday     |
+------------------------+
12:05 PM -  1:59 PM
 2:35 PM -  4:29 PM
 5:05 PM -  6:59 PM
 7:35 PM -  9:29 PM
10:05 PM - 11:59 PM


The Hateful Eight
+------------------------+
|   Monday - Thursday    |
+------------------------+
12:20 PM -  3:27 PM
 4:05 PM -  7:12 PM
 7:50 PM - 10:57 PM
+------------------------+
|    Friday - Sunday     |
+------------------------+
 1:20 PM -  4:27 PM
 5:05 PM -  8:12 PM
 8:50 PM - 11:57 PM


Liar Liar
+------------------------+
|   Monday - Thursday    |
+------------------------+
 1:10 PM -  2:36 PM
 3:15 PM -  4:41 PM
 5:20 PM -  6:46 PM
 7:25 PM -  8:51 PM
 9:30 PM - 10:56 PM
+------------------------+
|    Friday - Sunday     |
+------------------------+
12:05 PM -  1:31 PM
 2:10 PM -  3:36 PM
 4:15 PM -  5:41 PM
 6:20 PM -  7:46 PM
 8:25 PM -  9:51 PM
10:30 PM - 11:56 PM

.

Finished in 0.07161 seconds (files took 2.04 seconds to load)
1 example, 0 failures
