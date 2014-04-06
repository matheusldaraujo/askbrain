package askbrain

import com.amazonaws.mturk.service.exception.InternalServiceException
import grails.transaction.Transactional


@Transactional
class AskBrainMonitorService {

    Timer heartBeat;
    boolean running
    long pauseTime = 5000l

    //Ask Brain Constants
    Integer simpleAnswers = 3
    Integer mixedAnswers = 3
    Integer gradedAnswers = 3

    def init(){
        restart()
    }

    def restart() {
        if (running) {
            log.warn("Timer is already running; please use halt to stop if you wish to restart");
            return;

        }

        heartBeat = new Timer() {
            public void cancel() {
                super.cancel();
                running = false;
                cleanup();
            }
        }

        heartBeat.schedule(new TimerTask() {

            public boolean cancel() {
                boolean result = super.cancel();
                heartBeat.cancel();
                return result;

            }

            @Override
            public void run() {
                running = true;
                try {
                    askBrainBeat();


               } catch (Exception e) {
                    e.printStackTrace();  //To change body of catch statement use File | Settings | File Templates.
                    heartBeat.cancel();
                }


            }
        }, 0, pauseTime);

    }

    def askBrainBeat() {

    }
}
