# Database Hw2

## Q1

### (a)

```
# game in Exploration
cate_game1 = select_{category=="Exploration"}
#game in Adventure
cate_game2 = select_{category=="Adventure"}
#game in either, excluding games in both
cate_game = (cate_game1 Union categame2) - (cate_game1 intersect cate_game2)

result(gameid, name, designername) = cate_game * games * gamedesigners
```

### (b)

```
g1(siteid1, gameid1) = gamesonsite
g2(siteid2, gameid2) = gamesonsite
g3(siteid3, gameid3) = gamesonsite

# get games appear in 2 or 2 more sites
g2ormore = g1 join_{gameid1==gameid2 AND siteid1<>siteid2} g2

# get games appear in 3 or 3 more sites
g3ormore = g2ormore join_{gameid1==gameid2==gameid3 AND siteid1<>siteid2<>siteid3} g3

# diff
g2exactly = project_{gameid}g2ormore - project_{gameid}g3ormore
result(gameid, name) = g2exactly * games
```

## Q2

| A    | B    | C    | D    | E    | F    | G    | H    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| a    | b1   | c    | d    | e    | f1   | g1   | h1   |
| a    | b    | c    | d2   | e2   | f2   | g2   | h2   |
| a    | b    | c3   | d3   | e3   | f    | g    | h    |



Apply $ AB\rightarrow CD $

| A    | B    | C    | D    | E    | F    | G    | H    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| a    | b1   | c    | d    | e    | f1   | g1   | h1   |
| a    | b    | c    | d2   | e2   | f2   | g2   | h2   |
| a    | b    | c    | d2   | e3   | f    | g    | h    |



Apply $ AC\rightarrow DE $

| A    | B    | C    | D    | E    | F    | G    | H    |
| ---- | ---- | ---- | ---- | ---- | ---- | ---- | ---- |
| a    | b1   | c    | d    | e    | f1   | g1   | h1   |
| a    | b    | c    | d    | e    | f2   | g2   | h2   |
| a    | b    | c    | d    | e    | f    | g    | h    |

Not lossless.

## Q3

Projection into R1(A,C,D,E): {AC-->DE}

Projection into R2(A,B,C): {AB-->C}

Projection into R3(A,B,F,G,H): {AB-->C, ABF-->G}



Check dependency preserving:

Given AC-->DE, AB-->C, F-->G,

with AB-->C and AC-->DE, we can get AB-->CD, and AB-->CDE

AC-->DE, we get AC-->E,

Also, ABF-->G, and AB-->CDE (AB-->E), we can get EF-->AG

By now, we get AB-->CD, AC-->DE, EF-->AG, so it is dependency preserving.

## Q4

key for F: ABFH, BEFH

using AC-->DE to BCNF decompose

R1: A,C,D,E  AC-->DE  key:AC

R2: A,B,C,F,G,H  AB-->C, ABF-->G, key:ABFH, not in BCNF



Use AB-->C,

R1: ABC AB-->C key: AB

R2: ABFGH ABF-->G key:ABFH, not in BCNF



Use ABF-->G,

R1: ABFG ABF-->G key: ABF

R2: ABFH {empty} key: {empty}

both are in BCNF



## Q5

### 1.

```
F = {
	restaurant_name,state -> URL
	URL -> restaurant_name,state
	state,street,city,zip -> latitude,longitude
	latitude,longitude -> state,street,city,zip
	review_id -> review_text
	URL,latitude,longitude -> review_id
}
```

### 2.

```
4 keys: 
restaurant_name,state,latitude,longitude,cuisine_type
URL,latitude,longitude,cuisine_type
restaurant_name,state,street,city,zip,cuisine_type
URL,street,city,zip,cuisine_type
```

### 3.

```
Not in 3NF or BCNF
```

### 4.

```
3NF Decomposition:

restaurant_name,state,URL
		fd: restaurant_name,state -> URL
		key: restaurant_name,state
		in BCNF: yes
state,street,city,zip,latitude,longitude
		fd: state,street,city,zip -> latitude,longitude
		key: state,street,city,zip
		in BCNF: yes
review_id,review_text
		fd: review_id -> review_text
		key: review_id
		in BCNF: yes
URL,latitude,longitude,review_id
		fd: URL,latitude,longitude -> review_id
		key: URL,latitude,longitude
		in BCNF: yes
URL,street,city,zip,cuisine_type
		fd: {empty}
		key: URL,street,city,zip,cuisine_type
		in BCNF: yes
```

### 5.

They're all in 4NF.

Firstly, they are all in BCNF.

Secondly, accroding to the fds, there no multi-valued dependencies here.

