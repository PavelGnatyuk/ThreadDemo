# ThreadDemo

Thread demo application written in Swift and Xcode 9.

`Thread` is a simple class allowing thread creation in the iOS applications. Internally it is based on the `pthread`.
Since iOS 10 this class has a special *initializer* taking a block code to be launched as the thread function by calling `start` method.

```Swift
        let thread = Thread(block: {
        
            var counter = 0
            while counter < 60 {
                print("Counter is \(counter)")
                sleep(1)
                counter += 1
            }
            print("finished")
        })
        thread.start()
```
The thread can be stopped by calling `exit` from this thread, but the recommended way is call `cancel` method
from the instance of the Thread object.  It requires to implement a special code inside the thread function that will cancels the thread:
```Swift
        thread = Thread(block: {
        
            var counter = 0
            while counter < 60 {
                print("Counter is \(counter)")
                sleep(1)
                counter += 1
                
                let current = Thread.current
                if current.isCancelled {
                    print("Canceled")
                    break
                }
            }
            print("finished")
        })
        thread?.start()
```
The code above shows how to detect (property `isCanceled`) the canceling state from the thread function and break the logic to finish the thread correctly.


