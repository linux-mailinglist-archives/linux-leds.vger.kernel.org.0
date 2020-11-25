Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A0DE92C4077
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 13:47:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726321AbgKYMqz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 07:46:55 -0500
Received: from jabberwock.ucw.cz ([46.255.230.98]:44600 "EHLO
        jabberwock.ucw.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbgKYMqz (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 07:46:55 -0500
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
        id 617B01C0B7D; Wed, 25 Nov 2020 13:46:49 +0100 (CET)
Date:   Wed, 25 Nov 2020 13:46:48 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Andrea Righi <andrea.righi@canonical.com>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] leds: trigger: fix potential deadlock with libata
Message-ID: <20201125124648.GJ29328@amd>
References: <20201102104152.GG9930@xps-13-7390>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="GlnCQLZWzqLRJED8"
Content-Disposition: inline
In-Reply-To: <20201102104152.GG9930@xps-13-7390>
User-Agent: Mutt/1.5.23 (2014-03-12)
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org


--GlnCQLZWzqLRJED8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> We have the following potential deadlock condition:
>=20
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
>  WARNING: possible irq lock inversion dependency detected
>  5.10.0-rc2+ #25 Not tainted
>  --------------------------------------------------------
>  swapper/3/0 just changed the state of lock:
>  ffff8880063bd618 (&host->lock){-...}-{2:2}, at: ata_bmdma_interrupt+0x27=
/0x200
>  but this lock took another, HARDIRQ-READ-unsafe lock in the past:
>   (&trig->leddev_list_lock){.+.?}-{2:2}
>=20
>  and interrupts could create inverse lock ordering between them.
>=20
>  other info that might help us debug this:
>   Possible interrupt unsafe locking scenario:
>=20
>         CPU0                    CPU1
>         ----                    ----
>    lock(&trig->leddev_list_lock);
>                                 local_irq_disable();
>                                 lock(&host->lock);
>                                 lock(&trig->leddev_list_lock);
>    <Interrupt>
>      lock(&host->lock);
>=20
>   *** DEADLOCK ***
>=20
>  no locks held by swapper/3/0.
>=20
>  the shortest dependencies between 2nd lock and 1st lock:
>   -> (&trig->leddev_list_lock){.+.?}-{2:2} ops: 46 {
>      HARDIRQ-ON-R at:
>                        lock_acquire+0x15f/0x420
>                        _raw_read_lock+0x42/0x90
>                        led_trigger_event+0x2b/0x70
>                        rfkill_global_led_trigger_worker+0x94/0xb0
>                        process_one_work+0x240/0x560
>                        worker_thread+0x58/0x3d0
>                        kthread+0x151/0x170
>                        ret_from_fork+0x1f/0x30
>      IN-SOFTIRQ-R at:
>                        lock_acquire+0x15f/0x420
>                        _raw_read_lock+0x42/0x90
>                        led_trigger_event+0x2b/0x70
>                        kbd_bh+0x9e/0xc0
>                        tasklet_action_common.constprop.0+0xe9/0x100
>                        tasklet_action+0x22/0x30
>                        __do_softirq+0xcc/0x46d
>                        run_ksoftirqd+0x3f/0x70
>                        smpboot_thread_fn+0x116/0x1f0
>                        kthread+0x151/0x170
>                        ret_from_fork+0x1f/0x30
>      SOFTIRQ-ON-R at:
>                        lock_acquire+0x15f/0x420
>                        _raw_read_lock+0x42/0x90
>                        led_trigger_event+0x2b/0x70
>                        rfkill_global_led_trigger_worker+0x94/0xb0
>                        process_one_work+0x240/0x560
>                        worker_thread+0x58/0x3d0
>                        kthread+0x151/0x170
>                        ret_from_fork+0x1f/0x30
>      INITIAL READ USE at:
>                            lock_acquire+0x15f/0x420
>                            _raw_read_lock+0x42/0x90
>                            led_trigger_event+0x2b/0x70
>                            rfkill_global_led_trigger_worker+0x94/0xb0
>                            process_one_work+0x240/0x560
>                            worker_thread+0x58/0x3d0
>                            kthread+0x151/0x170
>                            ret_from_fork+0x1f/0x30
>    }
>    ... key      at: [<ffffffff83da4c00>] __key.0+0x0/0x10
>    ... acquired at:
>     _raw_read_lock+0x42/0x90
>     led_trigger_blink_oneshot+0x3b/0x90
>     ledtrig_disk_activity+0x3c/0xa0
>     ata_qc_complete+0x26/0x450
>     ata_do_link_abort+0xa3/0xe0
>     ata_port_freeze+0x2e/0x40
>     ata_hsm_qc_complete+0x94/0xa0
>     ata_sff_hsm_move+0x177/0x7a0
>     ata_sff_pio_task+0xc7/0x1b0
>     process_one_work+0x240/0x560
>     worker_thread+0x58/0x3d0
>     kthread+0x151/0x170
>     ret_from_fork+0x1f/0x30
>=20
>  -> (&host->lock){-...}-{2:2} ops: 69 {
>     IN-HARDIRQ-W at:
>                      lock_acquire+0x15f/0x420
>                      _raw_spin_lock_irqsave+0x52/0xa0
>                      ata_bmdma_interrupt+0x27/0x200
>                      __handle_irq_event_percpu+0xd5/0x2b0
>                      handle_irq_event+0x57/0xb0
>                      handle_edge_irq+0x8c/0x230
>                      asm_call_irq_on_stack+0xf/0x20
>                      common_interrupt+0x100/0x1c0
>                      asm_common_interrupt+0x1e/0x40
>                      native_safe_halt+0xe/0x10
>                      arch_cpu_idle+0x15/0x20
>                      default_idle_call+0x59/0x1c0
>                      do_idle+0x22c/0x2c0
>                      cpu_startup_entry+0x20/0x30
>                      start_secondary+0x11d/0x150
>                      secondary_startup_64_no_verify+0xa6/0xab
>     INITIAL USE at:
>                     lock_acquire+0x15f/0x420
>                     _raw_spin_lock_irqsave+0x52/0xa0
>                     ata_dev_init+0x54/0xe0
>                     ata_link_init+0x8b/0xd0
>                     ata_port_alloc+0x1f1/0x210
>                     ata_host_alloc+0xf1/0x130
>                     ata_host_alloc_pinfo+0x14/0xb0
>                     ata_pci_sff_prepare_host+0x41/0xa0
>                     ata_pci_bmdma_prepare_host+0x14/0x30
>                     piix_init_one+0x21f/0x600
>                     local_pci_probe+0x48/0x80
>                     pci_device_probe+0x105/0x1c0
>                     really_probe+0x221/0x490
>                     driver_probe_device+0xe9/0x160
>                     device_driver_attach+0xb2/0xc0
>                     __driver_attach+0x91/0x150
>                     bus_for_each_dev+0x81/0xc0
>                     driver_attach+0x1e/0x20
>                     bus_add_driver+0x138/0x1f0
>                     driver_register+0x91/0xf0
>                     __pci_register_driver+0x73/0x80
>                     piix_init+0x1e/0x2e
>                     do_one_initcall+0x5f/0x2d0
>                     kernel_init_freeable+0x26f/0x2cf
>                     kernel_init+0xe/0x113
>                     ret_from_fork+0x1f/0x30
>   }
>   ... key      at: [<ffffffff83d9fdc0>] __key.6+0x0/0x10
>   ... acquired at:
>     __lock_acquire+0x9da/0x2370
>     lock_acquire+0x15f/0x420
>     _raw_spin_lock_irqsave+0x52/0xa0
>     ata_bmdma_interrupt+0x27/0x200
>     __handle_irq_event_percpu+0xd5/0x2b0
>     handle_irq_event+0x57/0xb0
>     handle_edge_irq+0x8c/0x230
>     asm_call_irq_on_stack+0xf/0x20
>     common_interrupt+0x100/0x1c0
>     asm_common_interrupt+0x1e/0x40
>     native_safe_halt+0xe/0x10
>     arch_cpu_idle+0x15/0x20
>     default_idle_call+0x59/0x1c0
>     do_idle+0x22c/0x2c0
>     cpu_startup_entry+0x20/0x30
>     start_secondary+0x11d/0x150
>     secondary_startup_64_no_verify+0xa6/0xab
>=20
> This lockdep splat is reported after:
> commit e918188611f0 ("locking: More accurate annotations for read_lock()")
>=20
> To clarify:
>  - read-locks are recursive only in interrupt context (when
>    in_interrupt() returns true)
>  - after acquiring host->lock in CPU1, another cpu (i.e. CPU2) may call
>    write_lock(&trig->leddev_list_lock) that would be blocked by CPU0
>    that holds trig->leddev_list_lock in read-mode
>  - when CPU1 (ata_ac_complete()) tries to read-lock
>    trig->leddev_list_lock, it would be blocked by the write-lock waiter
>    on CPU2 (because we are not in interrupt context, so the read-lock is
>    not recursive)
>  - at this point if an interrupt happens on CPU0 and
>    ata_bmdma_interrupt() is executed it will try to acquire host->lock,
>    that is held by CPU1, that is currently blocked by CPU2, so:
>=20
>    * CPU0 blocked by CPU1
>    * CPU1 blocked by CPU2
>    * CPU2 blocked by CPU0
>=20
>      *** DEADLOCK ***
>=20
> The deadlock scenario is better represented by the following schema
> (thanks to Boqun Feng <boqun.feng@gmail.com> for the schema and the
> detailed explanation of the deadlock condition):
>=20
>  CPU 0:                          CPU 1:                        CPU 2:
>  -----                           -----                         -----
>  led_trigger_event():
>    read_lock(&trig->leddev_list_lock);
>  				<workqueue>
>  				ata_hsm_qc_complete():
>  				  spin_lock_irqsave(&host->lock);
>  								write_lock(&trig->leddev_list_lock);
>  				  ata_port_freeze():
>  				    ata_do_link_abort():
>  				      ata_qc_complete():
>  					ledtrig_disk_activity():
>  					  led_trigger_blink_oneshot():
>  					    read_lock(&trig->leddev_list_lock);
>  					    // ^ not in in_interrupt() context, so could get blocked by CPU=
 2
>  <interrupt>
>    ata_bmdma_interrupt():
>      spin_lock_irqsave(&host->lock);
>=20
> Fix by using read_lock_irqsave/irqrestore() in led_trigger_event(), so
> that no interrupt can happen in between, preventing the deadlock
> condition.
>=20
> Link: https://lore.kernel.org/lkml/20201101092614.GB3989@xps-13-7390/
> Fixes: eb25cb9956cc ("leds: convert IDE trigger to common disk trigger")
> Signed-off-by: Andrea Righi <andrea.righi@canonical.com>

I'd hate to see this in stable 3 days after Linus merges it...

Do these need _irqsave, too?

drivers/leds/led-triggers.c:   read_lock(&trig->leddev_list_lock);
drivers/leds/led-triggers.c:   read_unlock(&trig->leddev_list_lock);
drivers/leds/led-triggers.c:   read_lock(&trig->leddev_list_lock);
drivers/leds/led-triggers.c:   read_unlock(&trig->leddev_list_lock);

Best regards,
								Pavel

> ---
>  drivers/leds/led-triggers.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
> index 91da90cfb11d..16d1a93a10a8 100644
> --- a/drivers/leds/led-triggers.c
> +++ b/drivers/leds/led-triggers.c
> @@ -378,14 +378,15 @@ void led_trigger_event(struct led_trigger *trig,
>  			enum led_brightness brightness)
>  {
>  	struct led_classdev *led_cdev;
> +	unsigned long flags;
> =20
>  	if (!trig)
>  		return;
> =20
> -	read_lock(&trig->leddev_list_lock);
> +	read_lock_irqsave(&trig->leddev_list_lock, flags);
>  	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list)
>  		led_set_brightness(led_cdev, brightness);
> -	read_unlock(&trig->leddev_list_lock);
> +	read_unlock_irqrestore(&trig->leddev_list_lock, flags);
>  }
>  EXPORT_SYMBOL_GPL(led_trigger_event);
> =20

--=20
http://www.livejournal.com/~pavelmachek

--GlnCQLZWzqLRJED8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAl++UjgACgkQMOfwapXb+vLqgACbBJB+TM5CfaKfMeo3emhB4X5r
RaYAnApEOSvsv9sU9JiEopAX8YucJPyA
=f0Iv
-----END PGP SIGNATURE-----

--GlnCQLZWzqLRJED8--
