
import random

class Player(object):


    def __init__(self):
        self.setupPlayer()

    def setupPlayer(self):
        self.lives = 5
        self.gold_coins = 0
        self.health_points = 10

    def level_up(self):
        print "You gained a life!"
        self.lives += 1

    def collect_treasure(self, quantity=1):
        print "You have found {0} gold coins.".format(quantity)
        self.gold_coins += quantity
        if self.gold_coins % 10 == 0:
            self.level_up()

    def do_battle(self, damage):
        print "You have taken {0} damage!".format(damage)
        self.health_points -= damage
        if self.health_points < 1:
            print "You lost a life."
            self.lives -= 1
            self.health_points = 10
        if self.lives < 1:
            self.restart()

    def restart(self):
        print "You have lost. Restarting the game."
        self.setupPlayer()

p = Player()

monsters = [
    { 'name': 'Septahydra', 'power': 7, 'reward': 9 },
    { 'name': 'Troll', 'power': 4, 'reward': 3 },
]

while True:
    input = raw_input('Explore or quit?\n')
    if input == 'quit':
        print "You have left the game."
        break
    elif input == 'explore':
        monster = random.choice(monsters)
        print "You are fighting the {0}".format(monster['name'])
        p.do_battle(monster['power'])
        p.collect_treasure(monster['reward'])
        print "You now have {0} lives, {1} health points, and {2} gold coins".format(p.lives, p.health_points, p.gold_coins)
