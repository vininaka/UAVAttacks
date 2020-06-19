package uavsim;

import inet.common.lifecycle.LifecycleController;
import inet.common.scenario.ScenarioManager;
import inet.networklayer.configurator.ipv4.IPv4NetworkConfigurator;
import inet.networklayer.ipv4.RoutingTableRecorder;
import inet.physicallayer.ieee80211.packetlevel.*;
import inet.physicallayer.pathloss.*;


network NetworkDuo
{
    parameters:
        int numHosts;
        int numAttackJamming;
        int numAttackDos;

    submodules:
        radioMedium: Ieee80211ScalarRadioMedium {
            parameters:
                @display("p=100,50");
        }
        configurator: IPv4NetworkConfigurator {
            parameters:
                config = xml("<config><interface hosts='*' address='192.168.1.x' netmask='255.255.255.0'/></config>");
                @display("p=100,100");
        }
        routingTableRecorder: RoutingTableRecorder {
            parameters:
                @display("p=100,150");
        }
        lifecycleController: LifecycleController {
            parameters:
                @display("p=100,200");
        }
        scenarioManager: ScenarioManager {
            parameters:
                script = default(xml("<scenario/>"));
                @display("p=100,250");
        }
        host[numHosts]: UAVHost {
            parameters:
                @display("p=476,219");
        }
        attack_Jamming[numAttackJamming]: Attack_Jamming {
            parameters:
                @display("p=383,92");
        }
        attack_Dos[numAttackDos]: Attack_Dos {
            parameters:
                @display("p=299,219");
        }
    connections allowunconnected:
}
