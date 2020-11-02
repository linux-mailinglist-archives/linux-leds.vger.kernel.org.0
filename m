Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F6432A2868
	for <lists+linux-leds@lfdr.de>; Mon,  2 Nov 2020 11:41:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728253AbgKBKl6 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 2 Nov 2020 05:41:58 -0500
Received: from youngberry.canonical.com ([91.189.89.112]:44004 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbgKBKl6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 2 Nov 2020 05:41:58 -0500
Received: from mail-wm1-f72.google.com ([209.85.128.72])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <andrea.righi@canonical.com>)
        id 1kZXHf-0002Vq-2I
        for linux-leds@vger.kernel.org; Mon, 02 Nov 2020 10:41:55 +0000
Received: by mail-wm1-f72.google.com with SMTP id y21so1463329wmi.7
        for <linux-leds@vger.kernel.org>; Mon, 02 Nov 2020 02:41:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=f7EtHlP3h2b3hepM6y1QpS+l4sUqcd6/iThdrN2P/MA=;
        b=OiETum9aGSHaVD+04h9Gm+QcS2bk0efVhGZEzVAw/OpSGic8xTwP8aWQwp9NqV5Ubu
         92Ckn3xrflmhO5qKxBDv4VoYDetIoE8zi2RaRAPeynno01VZ6Pv24kJOKrMZ5szgqiKx
         uihbHwJdisJ1XgG5BuNFr/3H+2fNXXhQTtWCWHTZR3RwRpsQs99aP+7WZlymgFGQuumW
         uR9LpN35m8GSEUxM8bIfGZF0P3sea31i42NXspibuR8NIaDdzyU5f6PdTCt1aQ4k2rpJ
         aV01Wh/N2u/7kqn+i+LtPoD2AfLO99xnWYmGQjUuA96VAx2UdLrEjsB0JZ2d63QkJTIO
         iNYA==
X-Gm-Message-State: AOAM533mTITLqsDa15PH6X5Z8vbRp4VyJ/yNc4Y4+zcPCVC/VkN04gwZ
        hbMOPGjh33OiC/g69qp8yt3fDzTrJe2dhGVeO6eZ97zMM5uEuJvxP/dna1Vm6ZEnL07ipBMzjeH
        L8lhSuMiBOFSpGNXlhLBSr5bojSlus5kegh/jrAo=
X-Received: by 2002:a05:6000:10c:: with SMTP id o12mr20542855wrx.81.1604313714620;
        Mon, 02 Nov 2020 02:41:54 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyJdc7vfEp6JipW39sAS0zQZ5iWL4eku7C93hMikcP1q5Z/Xpln9mNTcxYE6TLx1Ze1ob6JHg==
X-Received: by 2002:a05:6000:10c:: with SMTP id o12mr20542825wrx.81.1604313714295;
        Mon, 02 Nov 2020 02:41:54 -0800 (PST)
Received: from localhost (host-79-33-123-6.retail.telecomitalia.it. [79.33.123.6])
        by smtp.gmail.com with ESMTPSA id q6sm15032760wma.0.2020.11.02.02.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2020 02:41:53 -0800 (PST)
Date:   Mon, 2 Nov 2020 11:41:52 +0100
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Boqun Feng <boqun.feng@gmail.com>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] leds: trigger: fix potential deadlock with libata
Message-ID: <20201102104152.GG9930@xps-13-7390>
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

Link: https://lore.kernel.org/lkml/20201101092614.GB3989@xps-13-7390/
Fixes: eb25cb9956cc ("leds: convert IDE trigger to common disk trigger")
Signed-off-by: Andrea Righi <andrea.righi@canonical.com>
---
 drivers/leds/led-triggers.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/led-triggers.c b/drivers/leds/led-triggers.c
index 91da90cfb11d..16d1a93a10a8 100644
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
 
-- 
2.27.0

