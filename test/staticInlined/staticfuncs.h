static int i[2];
static int j[2];

static void runThread(int tid) {
  i[0] = 1;
  return;
}

static void initialiseAndRunThread(int tid) {
  i[1] = 2;
  return;
}
