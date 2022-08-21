# Setup
yes_no = ['yes', 'no']
directions = ['left', 'right', 'forward', 'backward']
print('这是一个IO测试程序.')
# Introduction
name = input('What is your name, villager?\n')
print('Greetings, ' + name + '. Let us go on a quest!')
print('You find yourself on the edge of a dark forest.')
print('Can you find your way through?\n')
 
# Start of game
response = ''
while response not in yes_no:
    response = input('Would you like to step into the forest?\nyes/no\n')
    if response == 'yes':
        print('You head into the forest. You hear crows cawwing in the distance.\n')
    elif response == 'no':
        print('You are not ready for this quest. Goodbye, ' + name + '.')
        quit()
    else: 
        print('I didn\'t understand that.\n')
 
# Next part of game
response = ''
life = 100
while response not in directions:
    print('To your left, you see Rumia.')
    print('To your right, there is more forest.')
    print('Marisa\'s house is directly in front of you.')
    print('Behind you is the forest exit.\n')
    response = input('What direction do you move?\nleft/right/forward/backward\n')
    if response == 'left':
        print('Rumia eats you. Farewell, ' + name + '.')
        quit()
    elif response == 'right':
        print('You head deeper into the forest.\n')
    elif response == 'forward':
        if(life == 100):
            print('You steal everything in it.\n')
            life -= 13
        elif(0 <= life < 100):
            print('Marisa is annoyed for the stealing and gives you a Master Spark.')
            life -= 20
        else:
            print('You pass out because of the wounds. Then Rumia comes over for the food. Good night, ' + name + '.')
            quit()
        response = '' 
    elif response == 'backward':
        print('You leave the forest and return to the human village. Goodbye, ' + name + '.')
        quit()
    else:
        print('I didn\'t understand that.\n')
