import qualified Language.C.Inline as C

C.include "<stdio.h>"
C.include "<math.h>"

c_sin :: C.CDouble -> C.CDouble
c_sin x = [C.pure| double {
    sin( $(double x) )
} |]

helloWorld :: IO ()
helloWorld = [C.exp| void {
  puts("hello from C!");
} |]

printFibs :: C.CInt -> IO ()
printFibs n = [C.block| void {
    int a = 0,
        b = 1;
    for (int i=0; i<$(int n); i++) {
      int c = a + b;
      a = b;
      b = c;
      printf("%d\n", a);
    }
} |]

main :: IO ()
main = do
  helloWorld

  putStr $ "PI/4: " ++ (show $ c_sin (3.14/4))

  printFibs 20