#include <stdlib.h>
#include <stdio.h>
#include <libvirt/libvirt.h>

int main(int argc, char *argv[])
{
    // Connect to the hypervisor
    virConnectPtr conn = virConnectOpen("qemu:///system");
    if (!conn) exit(EXIT_FAILURE);

    // List all domains
    virDomainPtr *domains = NULL;
    int num_domains = virConnectListAllDomains(conn, &domains, VIR_CONNECT_LIST_DOMAINS_ACTIVE | VIR_CONNECT_LIST_DOMAINS_INACTIVE);
    if (num_domains < 0) exit(EXIT_FAILURE);

    printf("Domains Count: %d\n", num_domains);
    for (int i = 0; i < num_domains; i++) {
        virDomainPtr domain = domains[i];

        printf("- %s\n", virDomainGetName(domain));
        virDomainFree(domain);
    }

    free(domains);
    return EXIT_SUCCESS;
}