CC              = gcc
SRC             = given.c main.c user.c
TARGET          = proj
OBJ             = $(SRC:.c=.o)
DDDEBUG         =
#------------------------------------------------------
$(TARGET): $(OBJ)
	$(CC)  -o $@ $(OBJ) 

$(OBJ): $(SRC)
	$(CC) -g  -c $(SRC) $(DDDEBUG)

clean:
	rm -f *.o *~ $(TARGET)
