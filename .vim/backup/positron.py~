import socket
import string
import random
import hashlib
import urllib2
import time
import os

HOST = "irc.mibbit.com"
PORT = 6667
NICK = "positronBot"
INDENT = "positronbot"
CHANNEL = "#stuyctf"
TOPIC = ""#"We hold these shells to be self evident, that not all C derivatives are created equal, and that they are endowed by their compilers with certain inalienable instructions."

def getTime():
	return time.strftime("%Y-%b-%d-%H:%M:%S-GMT", time.gmtime())

#Recording stuff

RECORDING = False
RECTS = getTime
RECTE = getTime
RECORD = ""


# Helix Fossil
outcomes = ["It is certain", "It is decidedly so", "Without a doubt", "Yes definitely", "You may rely on it", "As I see it, yes", "Most likely", "Outlook good", "Yes", "Signs point to yes", "Reply hazy try again", "Ask again later", "Better not tell you now", "Cannot predict now", "Concentrate and ask again ", "Don't count on it", "My reply is no", "My sources say no", "Outlook not so good", "Very doubtful", "no.", "START", "A", "B", "UP", "DOWN", "LEFT", "RIGHT", "SELECT"]

# Ban-list
banlist = ["charlesma", "bot"]

# admin-list
#admin = ["hiWorld", "photoXin", "polarity"]

# command-list
commands = ["help","roulette", "md5", "hf", "roll", "rekt", "blackjack", "wiki"]

# Blackjack

deck = ["S1", "S2", "S3", "S4", "S5", "S6", "S7", "S8", "S9", "S10", "SJ", "SQ", "SK",
		"H1", "H2", "H3", "H4", "H5", "H6", "H7", "H8", "H9", "H10", "HJ", "HQ", "HK",
		"C1", "C2", "C3", "C4", "C5", "C6", "C7", "C8", "C9", "C10", "CJ", "CQ", "CK",
		"D1", "D2", "D3", "D4", "D5", "D6", "D7", "D8", "D9", "D10", "DJ", "DQ", "DK"]

drawedCard = []

blackJackStats = {}

def parseNumFromCard(card):

	try:
		return int(card[1:])

	except ValueError:
		value = card[1:]
		if value == "J":
			return 11

		elif value == "Q":
			return 12

		elif value == "K":
			return 13

def announceBlackjackWinner():
	s.send("PRIVMSG %s :You used up all the cards!\r\n")
	Winner = ""
	WinnerDistFrom21 = 21
	for user in blackJackStats:
		if 21 - blackJackStats[user][1] < WinnerDistFrom21:
			WinnerDistFrom21 = 21 - blackJackStats[user][1]
			Winner = user

	blackJackStats[Winner][0] += 10

	s.send("PRIVMSG %s :The winner is %s, here's $10 for you!\r\n" % (CHANNEL, Winner))

def reshuffle():
	global deck, drawedCard
	deck = drawedCard
	drawedCard = []

# Wikipedia!!

wikipeaURL = "http://en.wikipedia.org/wiki/" # Add the actual site name later

def destroyAllBrackets(html):
	while "<" in html and ">" in html:
		html = html[:html.find("<")] + html[html.find(">") + 1:]
	return html

def getFirstP(keyword):
	keyword = keyword.replace(" ", "_")
	realURL = wikipeaURL + keyword

	try:
		page = urllib2.urlopen(realURL)
	except:
		return "Wikipedia article not found!"

	html = page.read().split('<div id="mw-content-text"')[1]
	html = html.split('div id="toc" class="toc"')[0]
	html = html.split("<p>")[1]
	html = destroyAllBrackets(html)
	return html

# Greetings
greetings = ["hi", "hello", "hei", "hey"]

# Actual Socket Stuff
s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
s.connect((HOST, PORT))
#ircsocket = ssl.wrap_socket(s)
print "recv 1", s.recv(512)
s.send("NICK %s\r\n" % NICK)
s.send("USER %s 8 * :%s\r\n" % (NICK, NICK))

pingPong = s.recv(512)
print "recv 2", pingPong
pingPong = pingPong[5:]
s.send('PONG %s\r\n' % pingPong)

#def joinChan(chan, pwd):
#	s.send("JOIN " + chan + " " + pwd + "\r\n")

#joinChan(CHANNEL, PASSWORD)

s.send("JOIN %s\r\n" % (CHANNEL,))

#s.send("MODE %s +k %s\r\n" % (CHANNEL, PASSWORD))
#s.send("TOPIC %s :%s\r\n" % (CHANNEL, TOPIC))
#s.send("MODE %s +t\r\n" % (CHANNEL))
s.send("PRIVMSG NickServ :identify gadet best_ctf_123\r\n")

slots = 6

def parse(line):
	global RECORDING, RECORD, RECTS, RECTE

	if line.find("JOIN") != -1:

		username = line.split(":")[1].split("!")[0]

		if username != NICK:
			for banel in banlist:
				if username.lower().replace(" ", "").find(banel) != -1:
					string = "KICK %s %s :The BAN HAMMER has struck\r\n" % (CHANNEL, username)
					s.send(string)
					break

		if username == "hiWorld" or username == "photoXin" or username == "polarity":
			string = " MODE %s +o %s\r\n" % (CHANNEL, username)
			s.send(string)

	if line.find("NICK") != -1:

		newUsername = line.split(":")[-1]

		for banel in banlist:
			if newUsername.lower().replace(" ", "").find(banel) != -1:
				string = "KICK %s %s :The BAN HAMMER has struck\r\n" % (CHANNEL, newUsername)
				s.send(string)
				break

	if len(line.split(":")) == 3:

		username = line.split(":")[1].split("!")[0]
		message = line.split(":")[2]

		if RECORDING:
			RECORD += "<%s> : %s\n" % (username, message.strip("\r").strip("\n"))

		if message.split(" ")[0].strip().strip(",").strip(":").lower() in greetings: # Greeting Function

			s.send("PRIVMSG %s :Hello, %s\r\n" % (CHANNEL, username))

		if message.find("`") == 0:

			actual = message[1:].split(" ")
			command = actual[0]

			if command.find("help") != -1:
				s.send("PRIVMSG %s :command list: " % (CHANNEL) + str(commands)[1:-1] + "\r\n")

			if command.find("roulette") != -1:

				global slots
				rang = random.random()

				if rang < (1.0 / slots):
					slots = 6
					s.send("KICK %s %s :You died! D:\r\n" % (CHANNEL, username))
					s.send("PRIVMSG %s :*reloads chambers*, there are %d slots left\r\n" % (CHANNEL, slots))

				else:
					slots = slots - 1
					s.send("PRIVMSG %s :*click*, there are %d slots left\r\n" % (CHANNEL, slots))

			if command.find("md5") != -1:
				try:
					stuff = message[5:].replace("\r\n", "")
					result = hashlib.md5()
					result.update(stuff)

					if len(stuff) < 1:
						raise Exception()

					s.send("PRIVMSG %s :md5 of \"%s\" is %s\r\n" % (CHANNEL, stuff, result.hexdigest()))

				except Exception:
					s.send("PRIVMSG %s :Usage: `md5 [stuff]\r\n" % CHANNEL)

			if command.find("hf") != -1:
				s.send("PRIVMSG %s :%s, %s\r\n" % (CHANNEL, username, random.choice(outcomes)))

			if command.find("roll") != -1:
				try:
					top = int(message[6:].replace("\r\n", ""))
					result = random.randrange(0,top)
					s.send("PRIVMSG %s :%s, you rolled %d\r\n" % (CHANNEL, username, result))

				except Exception:
					s.send("PRIVMSG %s :%s: USAGE: `roll [NUMBER]\r\n" % (CHANNEL, username))

			if command.find("rekt") != -1:
				recked = message[5:].replace("\r\n", "")
				s.send("PRIVMSG %s :%s, you just got rekted by %s\r\n" % (CHANNEL, recked, username))

			if command.find("blackjack") != -1:
				drawnCard = deck.pop(random.randrange(0, len(deck)))

				drawedCard.append(drawnCard)

				if username in blackJackStats:
					blackJackStats[username][1] += parseNumFromCard(drawnCard)
					s.send("PRIVMSG %s :%s, you drew %s, you are currently at %d\r\n" % (CHANNEL, username, drawnCard, blackJackStats[username][1]))
					if blackJackStats[username][1] >= 21:
						blackJackStats[username][1] = 0
						blackJackStats[username][0] -= 10
						s.send("PRIVMSG %s :%s you got busted! Tough luck, now hand over $10, you have $%d left.\r\n" % (CHANNEL, username, blackJackStats[username][0]))

						if blackJackStats[username][0] < 0:
							s.send("KICK %s %s :You're out of $$!\r\n" % (CHANNEL, username))
							del blackJackStats[username]
				else:
					s.send("PRIVMSG %s :Welcome to blackjack %s, you have $30.\r\n" % (CHANNEL, username))
					blackJackStats[username] = [30, parseNumFromCard(drawnCard)]
					s.send("PRIVMSG %s :%s, you drew %s, you are currently at %d\r\n" % (CHANNEL, username, drawnCard, blackJackStats[username][1]))

				if deck == []:
					announceBlackjackWinner()
					reshuffle()

			if command.find("wiki") != -1:
				keyword = message[6:]
				result = getFirstP(keyword)

				if len(result) > 426:
					result = result[:420] # Maximum char limit for each PRIVMSG
					result = ".".join(result.split(".")[:-1])
					result += "..."

				s.send("PRIVMSG %s :%s, the wikipedia entry for %s is:\r\n" % (CHANNEL, username, keyword))
				s.send("PRIVMSG %s :%s\r\n" % (CHANNEL, result))

			if command.find("record") != -1:
				if RECORDING:
					s.send("PRIVMSG %s :You have already started recording at %s\r\n" % (CHANNEL, RECTS))
				else:
					if username in admin:
						s.send("PRIVMSG %s :Starting recording now...\r\n" % CHANNEL)
						RECORDING = True
						RECTS = getTime()
					else:
						s.send("PRIVMSG %s :%s You need to be an admin...\r\n" % (CHANNEL, username))

			if command.find("endRecord") != -1:
				print "TIME TO STOP\n"
				if not RECORDING:
					s.send("PRIVMSG %s :You are not recording anything...\r\n")
				else:
					if username in admin:
						RECORDING = False
						RECTE = getTime()
						RecordName = "./positronRecord-%s" % RECTE
						s.send("PRIVMSG %s :Writing record...\r\n" % CHANNEL)
						f = open(RecordName, "w+")
						f.write(RECORD)
						f.close()
						s.send("PRIVMSG %s :Done, record created\r\n" % CHANNEL)
					else:
						s.send("PRIVMSG %s :%s You need to be an admin...\r\n" % (CHANNEL, username))

while True:
	#print connected
	line = s.recv(1024)
	print line

	if line.find("PRIVMSG %s" % CHANNEL) != 1:
		parse(line)

	if line.find("PING :") != -1:

		s.send("PONG :Pong\r\n")
