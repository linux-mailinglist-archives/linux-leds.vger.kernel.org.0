Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0CC872C42BF
	for <lists+linux-leds@lfdr.de>; Wed, 25 Nov 2020 16:18:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbgKYPSb (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 25 Nov 2020 10:18:31 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:42028 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729482AbgKYPSa (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 25 Nov 2020 10:18:30 -0500
Received: from mail-wr1-f71.google.com ([209.85.221.71])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <andrea.righi@canonical.com>)
        id 1khwYt-00078u-IZ
        for linux-leds@vger.kernel.org; Wed, 25 Nov 2020 15:18:27 +0000
Received: by mail-wr1-f71.google.com with SMTP id i7so881039wro.6
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2020 07:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=aUVCP8UaMyzvqMXDeswwMVom1NvzGBCVDRgObuErTcQ=;
        b=QVNBXaEBIo7fKFd46AS4mSb3KPxNlTM9hHZKYMy3w0BftU8nPW1+d+LToyCv5ZBdGq
         PuIRAct05w8wtkjVEFDCAMfhPcl7pzNprhYaozpaQDmVYF+kjZDntqgVt821wswL/Xpk
         zgzAw4otdvflEJFCr3qPUZ5kSDj5LTTEPhuBZUjgNEcnsggWI/6w+jLLRzSGvpRqZKeR
         EB+CEaQvoC2PylzeUqLS/uXvvfzWvfQ9Ula64rGgsNhriGXwx+VpuJnvbw+1q48vZf15
         6tZwY0qtcahXTioTNgQCXkXub4fcBPcA/MHIF8pVFec5U12PeMdiKcA8niNuneVagDRE
         C0OA==
X-Gm-Message-State: AOAM5337ChrQBDKYuUv0x2dDzAhzM8nDdcY97IOQY+GZ9lfln8rE0/qR
        AUtmz4qoXfiOKzBLP05Xb5ZZcS9edQLAv+CqMg0vvc+1sVAb39ShymH8Q8IiWJRqxtzNchY+g6F
        waQpbIztMoaUfW63AE4uNW9h7rY47zvaAibybGN8=
X-Received: by 2002:adf:84e5:: with SMTP id 92mr4523814wrg.270.1606317504224;
        Wed, 25 Nov 2020 07:18:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwt6jhLZf0kMXEvA2Spd/GhobCh4nPZG1UmsFk4YI3dbNOJX3j7TC63idqdNwQEZMtoI5qzZA==
X-Received: by 2002:adf:84e5:: with SMTP id 92mr4523781wrg.270.1606317503849;
        Wed, 25 Nov 2020 07:18:23 -0800 (PST)
Received: from localhost (host-79-35-122-236.retail.telecomitalia.it. [79.35.122.236])
        by smtp.gmail.com with ESMTPSA id v189sm5291590wmg.14.2020.11.25.07.18.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2020 07:18:23 -0800 (PST)
Date:   Wed, 25 Nov 2020 16:18:22 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] leds: trigger: fix potential deadlock with libata
Message-ID: <20201125151822.GB73489@xps-13-7390>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

We have the following potential deadlock condition:

 ========================================================
 WARNING: possible irq lock inversion dependency detected
 5.10.0-rc2+ #25 Not tainted
 --------------------------------------------------------
 swapper/3/0 just changed the state of lock:
 ffff8880063bd618 (&host->lock){-...}-{2:2}, at: ata_bmdma_interrupt+0x27/0x200
 but this lock took another, HARDIRQ-READ-unsafe lock in the past:
  (&trig->leddev_list_lock){.+.?}-{2:2}

 and interrupts could create inverse lock ordering between them.

 other info that might help us debug this:
  Possible interrupt unsafe locking scenario:

        CPU0                    CPU1
        ----                    ----
   lock(&trig->leddev_list_lock);
                                local_irq_disable();
                                lock(&host->lock);
                                lock(&trig->leddev_list_lock);
   <Interrupt>
     lock(&host->lock);

  *** DEADLOCK ***

 no locks held by swapper/3/0.

 the shortest dependencies between 2nd lock and 1st lock:
  -> (&trig->leddev_list_lock){.+.?}-{2:2} ops: 46 {
     HARDIRQ-ON-R at:
                       lock_acquire+0x15f/0x420
                       _raw_read_lock+0x42/0x90
                       led_trigger_event+0x2b/0x70
                       rfkill_global_led_trigger_worker+0x94/0xb0
                       process_one_work+0x240/0x560
                       worker_thread+0x58/0x3d0
                       kthread+0x151/0x170
                       ret_from_fork+0x1f/0x30
     IN-SOFTIRQ-R at:
                       lock_acquire+0x15f/0x420
                       _raw_read_lock+0x42/0x90
                       led_trigger_event+0x2b/0x70
                       kbd_bh+0x9e/0xc0
                       tasklet_action_common.constprop.0+0xe9/0x100
                       tasklet_action+0x22/0x30
                       __do_softirq+0xcc/0x46d
                       run_ksoftirqd+0x3f/0x70
                       smpboot_thread_fn+0x116/0x1f0
                       kthread+0x151/0x170
                       ret_from_fork+0x1f/0x30
     SOFTIRQ-ON-R at:
                       lock_acquire+0x15f/0x420
                       _raw_read_lock+0x42/0x90
                       led_trigger_event+0x2b/0x70
                       rfkill_global_led_trigger_worker+0x94/0xb0
                       process_one_work+0x240/0x560
                       worker_thread+0x58/0x3d0
                       kthread+0x151/0x170
                       ret_from_fork+0x1f/0x30
     INITIAL READ USE at:
                           lock_acquire+0x15f/0x420
                           _raw_read_lock+0x42/0x90
                           led_trigger_event+0x2b/0x70
                           rfkill_global_led_trigger_worker+0x94/0xb0
                           process_one_work+0x240/0x560
                           worker_thread+0x58/0x3d0
                           kthread+0x151/0x170
                           ret_from_fork+0x1f/0x30
   }
   ... key      at: [<ffffffff83da4c00>] __key.0+0x0/0x10
   ... acquired at:
    _raw_read_lock+0x42/0x90
    led_trigger_blink_oneshot+0x3b/0x90
    ledtrig_disk_activity+0x3c/0xa0
    ata_qc_complete+0x26/0x450
    ata_do_link_abort+0xa3/0xe0
    ata_port_freeze+0x2e/0x40
    ata_hsm_qc_complete+0x94/0xa0
    ata_sff_hsm_move+0x177/0x7a0
    ata_sff_pio_task+0xc7/0x1b0
    process_one_work+0x240/0x560
    worker_thread+0x58/0x3d0
    kthread+0x151/0x170
    ret_from_fork+0x1f/0x30

 -> (&host->lock){-...}-{2:2} ops: 69 {
    IN-HARDIRQ-W at:
                     lock_acquire+0x15f/0x420
                     _raw_spin_lock_irqsave+0x52/0xa0
                     ata_bmdma_interrupt+0x27/0x200
                     __handle_irq_event_percpu+0xd5/0x2b0
                     handle_irq_event+0x57/0xb0
                     handle_edge_irq+0x8c/0x230
                     asm_call_irq_on_stack+0xf/0x20
                     common_interrupt+0x100/0x1c0
                     asm_common_interrupt+0x1e/0x40
                     native_safe_halt+0xe/0x10
                     arch_cpu_idle+0x15/0x20
                     default_idle_call+0x59/0x1c0
                     do_idle+0x22c/0x2c0
                     cpu_startup_entry+0x20/0x30
                     start_secondary+0x11d/0x150
                     secondary_startup_64_no_verify+0xa6/0xab
    INITIAL USE at:
                    lock_acquire+0x15f/0x420
                    _raw_spin_lock_irqsave+0x52/0xa0
                    ata_dev_init+0x54/0xe0
                    ata_link_init+0x8b/0xd0
                    ata_port_alloc+0x1f1/0x210
                    ata_host_alloc+0xf1/0x130
                    ata_host_alloc_pinfo+0x14/0xb0
                    ata_pci_sff_prepare_host+0x41/0xa0
                    ata_pci_bmdma_prepare_host+0x14/0x30
                    piix_init_one+0x21f/0x600
                    local_pci_probe+0x48/0x80
                    pci_device_probe+0x105/0x1c0
                    really_probe+0x221/0x490
                    driver_probe_device+0xe9/0x160
                    device_driver_attach+0xb2/0xc0
                    __driver_attach+0x91/0x150
                    bus_for_each_dev+0x81/0xc0
                    driver_attach+0x1e/0x20
                    bus_add_driver+0x138/0x1f0
                    driver_register+0x91/0xf0
                    __pci_register_driver+0x73/0x80
                    piix_init+0x1e/0x2e
                    do_one_initcall+0x5f/0x2d0
                    kernel_init_freeable+0x26f/0x2cf
                    kernel_init+0xe/0x113
                    ret_from_fork+0x1f/0x30
  }
  ... key      at: [<ffffffff83d9fdc0>] __key.6+0x0/0x10
  ... acquired at:
    __lock_acquire+0x9da/0x2370
    lock_acquire+0x15f/0x420
    _raw_spin_lock_irqsave+0x52/0xa0
    ata_bmdma_interrupt+0x27/0x200
    __handle_irq_event_percpu+0xd5/0x2b0
    handle_irq_event+0x57/0xb0
    handle_edge_irq+0x8c/0x230
    asm_call_irq_on_stack+0xf/0x20
    common_interrupt+0x100/0x1c0
    asm_common_interrupt+0x1e/0x40
    native_safe_halt+0xe/0x10
    arch_cpu_idle+0x15/0x20
    default_idle_call+0x59/0x1c0
    do_idle+0x22c/0x2c0
    cpu_startup_entry+0x20/0x30
    start_secondary+0x11d/0x150
    secondary_startup_64_no_verify+0xa6/0xab

This lockdep splat is reported after:
commit e918188611f0 ("locking: More accurate annotations for read_lock()")

To clarify:
 - read-locks are recursive only in interrupt context (when
   in_interrupt() returns true)
 - after acquiring host->lock in CPU1, another cpu (i.e. CPU2) may call
   write_lock(&trig->leddev_list_lock) that would be blocked by CPU0
   that holds trig->leddev_list_lock in read-mode
 - when CPU1 (ata_ac_complete()) tries to read-lock
   trig->leddev_list_lock, it would be blocked by the write-lock waiter
   on CPU2 (because we are not in interrupt context, so the read-lock is
   not recursive)
 - at this point if an interrupt happens on CPU0 and
   ata_bmdma_interrupt() is executed it will try to acquire host->lock,
   that is held by CPU1, that is currently blocked by CPU2, so:

   * CPU0 blocked by CPU1
   * CPU1 blocked by CPU2
   * CPU2 blocked by CPU0

     *** DEADLOCK ***

The deadlock scenario is better represented by the following schema
(thanks to Boqun Feng <boqun.feng@gmail.com> for the schema and the
detailed explanation of the deadlock condition):

 CPU 0:                          CPU 1:                        CPU 2:
 -----                           -----                         -----
 led_trigger_event():
   read_lock(&trig->leddev_list_lock);
 				<workqueue>
 				ata_hsm_qc_complete():
 				  spin_lock_irqsave(&host->lock);
 								write_lock(&trig->leddev_list_lock);
 				  ata_port_freeze():
 				    ata_do_link_abort():
 				      ata_qc_complete():
 					ledtrig_disk_activity():
 					  led_trigger_blink_oneshot():
 					    read_lock(&trig->leddev_list_lock);
 					    // ^ not in in_interrupt() context, so could get blocked by CPU 2
 <interrupt>
   ata_bmdma_interrupt():
     spin_lock_irqsave(&host->lock);

Fix by using read_lock_irqsave/irqrestore() in led_trigger_event(), so
that no interrupt can happen in between, preventing the deadlock
condition.

Apply the same change to led_trigger_blink_setup() as well, since the
same deadlock scenario can also happen in power_supply_update_bat_leds()
-> led_trigger_blink() -> led_trigger_blink_setup() (workqueue context),
and potentially prevent other similar usages.

Link: https://lore.kernel.org/lkml/20201101092614.GB3989@xps-13-7390/
Fixes: eb25cb9956cc ("leds: convert IDE trigger to common disk trigger")
Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 drivers/leds/led-triggers.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

Changelog (v1 -> v2):
 - use _irqsave/irqsrestore also in led_trigger_blink_setup()

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 91da90cfb11d..4e7b78a84149 100644
--- a/drivers/leds/led-triggers.c
+++ b/drivers/leds/led-triggers.c
@@ -378,14 +378,15 @@ void led_trigger_event(struct led_trigger *trig,
 			enum led_brightness brightness)
 {
 	struct led_classdev *led_cdev;
+	unsigned long flags;
 
 	if (!trig)
 		return;
 
-	read_lock(&trig->leddev_list_lock);
+	read_lock_irqsave(&trig->leddev_list_lock, flags);
 	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list)
 		led_set_brightness(led_cdev, brightness);
-	read_unlock(&trig->leddev_list_lock);
+	read_unlock_irqrestore(&trig->leddev_list_lock, flags);
 }
 EXPORT_SYMBOL_GPL(led_trigger_event);
 
@@ -396,11 +397,12 @@ static void led_trigger_blink_setup(struct led_trigger *trig,
 			     int invert)
 {
 	struct led_classdev *led_cdev;
+	unsigned long flags;
 
 	if (!trig)
 		return;
 
-	read_lock(&trig->leddev_list_lock);
+	read_lock_irqsave(&trig->leddev_list_lock, flags);
 	list_for_each_entry(led_cdev, &trig->led_cdevs, trig_list) {
 		if (oneshot)
 			led_blink_set_oneshot(led_cdev, delay_on, delay_off,
@@ -408,7 +410,7 @@ static void led_trigger_blink_setup(struct led_trigger *trig,
 		else
 			led_blink_set(led_cdev, delay_on, delay_off);
 	}
-	read_unlock(&trig->leddev_list_lock);
+	read_unlock_irqrestore(&trig->leddev_list_lock, flags);
 }
 
 void led_trigger_blink(struct led_trigger *trig,
-- 
2.29.2

