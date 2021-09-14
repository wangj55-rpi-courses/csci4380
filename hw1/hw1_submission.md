

# <center>Database Hw1</center>

## Q1

### (a)

```
g1 = select_{min_player<=4 AND max_player>=4 AND year==2020 AND publisher=='Rio Grande Games'} games

project_{name, min_playtime, max_playtime, link} g1
```

### (b)

```
awardedgames = project_{gameid}select_{awardname=='Golden Geek Most Innovative Board Game' AND (year==2019 OR year==2020)}awardsnominations

g1 = awardedgames*gamedesigners

project_{name, designername}
```

### (c)

```
g1 = select_{mechanic<>'Loose a Turn'}gamemechanics

reviewer1 = g1*gamereviews

project_{userid}reviewer1
```

### (d)

```
winner_cate = select_{category=='Exploration' OR category=='Adventure'}(awardsnominations*gamecategories)

winner_cate_mech = join_{gameid==gameid AND mechanic<>'Dice Rolling'}(winner_cate, gamemechanics)

project_{gameid}winner_cate_mech
```

### (e)

```
# get games <$40 or online
cheap_games = (project_{gameid}gamesonsite) union (project_{gameid}select_{price<40}gameprices)

# get games in 'Strategy' category and won 'SXSW' award
cate_games = select_{category=='Strategy'}gamecategories
award_games = select_{awardname=='SXSW'}awardsnominations

project_{name, publisher}(games * cheap_games * cate_games * award_games)
```

### (f)

```
coop_games = select{iscooperative==true}games
cate_games = select_{category=='Farming'}gamecategories
type_or_mech_games = (project_{gameid}select_{type=='Strategy'}gametypes) union (project_{gameid}select_{mechanic=='Hidden Victory Points'}gamemechanics)

project_{name, publisher}(coop_games * cate_games * type_or_mech_games)
```

### (g)

```
games1 = project_{gameid}(select_{name=='Beyond The Sun' AND year==2019}games)

# get prices of this game
prices1 = project_{price}(games1 * gameprices)

# get min price
p1(price1) = prices1
p2(price2) = prices1
min_price = project_{price1}(p1 - join_{price1 > price2}(p1, p2))

# get stores with this min_price
project_{storename} (select_{price==min_price}(games1 * gameprices))
```



## Q2

### 1.

```
Keys: ABC, BCG

ABC->DG, ok in both BCNF and 3NF(superkey on left)
G->AEF, violates both BCNF and 3NF

This relation violates both BCNF and 3NF.
```

### 2.

```
Keys: AE, ABD

ABD->CEFG, ok in both(superkey on left)
AE->BCDG, ok in both(superkey on left)

This relation satisfy both BCNF and 3NF.
```

### 3.

```
Keys: AB

AB->CDE, ok in both(superkey on left)
BE->F, violates both
F->G, violates both

This relation violates both BCNF and 3NF.
```

