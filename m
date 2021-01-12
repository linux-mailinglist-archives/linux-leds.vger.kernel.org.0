Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C732F2F3D4A
	for <lists+linux-leds@lfdr.de>; Wed, 13 Jan 2021 01:43:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438142AbhALVhc (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 12 Jan 2021 16:37:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40054 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2437146AbhALVT5 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 12 Jan 2021 16:19:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1610486309;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=Zev1V4IEYN2T8EpZeRCPa6fmYw4qRqzooHdjCIonddU=;
        b=GTkX5N2axTub/C1mNNFyzdmqoiQp0YL4x2AWJkKeQBfYk73jVC37JcpwRA8WkYQvR8SVLK
        NlLew6newqXs4aqc9FrKFa4JLS1+puPELTzOWG5gGLDuYdcFRV5wVIglKoL3QDxy+z9Bli
        5oNThcM1a6IaWG+kNn1QFYB5OAcLXV4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-331-l6X2Lk74OrKEnpyfpgvo4A-1; Tue, 12 Jan 2021 16:18:27 -0500
X-MC-Unique: l6X2Lk74OrKEnpyfpgvo4A-1
Received: by mail-ed1-f70.google.com with SMTP id dh21so1593613edb.6
        for <linux-leds@vger.kernel.org>; Tue, 12 Jan 2021 13:18:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=Zev1V4IEYN2T8EpZeRCPa6fmYw4qRqzooHdjCIonddU=;
        b=smJ6XkJfFI8k9O7/Xg0iMAYex5Zkl7xD2glAGfMTg6zn3MccsAqSsbAzgucZfF2kxl
         oBijWcgjN58mUTaowtZWDZFohkNnfxk96404Xb6rvruyloGwT4aJmAynNYOq0F4vHUxj
         WV63OMK5IZ0BXZ78MEvwvtQe+LLqk/IsOY4/HEIfW3zlD9xal5NLXktRq9JME5se/UFB
         zxqAYcKJh58YXtgGdOoJTSWlMgGqBqeHI4viOTcIE/2TdF8V2HJOf0jot4VphL7l6VXc
         4y5aggBA/Xq9wpTQsJT1KERJCwNumcSiWmP49y/L5IYOSzCgA+n5YLmynHAcngaGk/Qc
         LlhQ==
X-Gm-Message-State: AOAM5314KZh8VY7YS4xGNoqGYOaYvykAYSvp+Jxb4sU4FYY4mvCTr7B7
        mhH3gL1kQ1NMrCeoBSZ5SP3A8hwISVG2WxgaZad92RdtfpSmbVpyiLXYG1rtxqxv74DTOBQN8es
        2s3dl6sIWUg9memrEOGcKYw==
X-Received: by 2002:a17:907:1047:: with SMTP id oy7mr542443ejb.134.1610486305205;
        Tue, 12 Jan 2021 13:18:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxCxrUrw3bZ4C4NBEhE4ey1Ebb1yDz9G/qnkbLh9PxS9t2MRYDtFOCx/igQEBIw8Nf3RbK/VA==
X-Received: by 2002:a17:907:1047:: with SMTP id oy7mr542425ejb.134.1610486304893;
        Tue, 12 Jan 2021 13:18:24 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id pv24sm1626732ejb.101.2021.01.12.13.18.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Jan 2021 13:18:24 -0800 (PST)
To:     Jens Axboe <axboe@kernel.dk>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>
Cc:     linux-ide@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org
From:   Hans de Goede <hdegoede@redhat.com>
Subject: 5.11 new lockdep warning related to led-class code (also may involve
 ata / piix controller)
Message-ID: <b204637d-3b72-8320-8a62-f075467d8681@redhat.com>
Date:   Tue, 12 Jan 2021 22:18:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi All,

Booting a 5.11-rc2 kernel with lockdep enabled inside a virtualbox vm (which still
emulates good old piix ATA controllers) I get the below lockdep splat early on during boot:

This seems to be led-class related but also seems to have a (P)ATA
part to it. To the best of my knowledge this is a new problem in 5.11 .

Regards,

Hans


And here is the promised lockdep log:

[    1.133779] ata3.00: ATAPI: VBOX CD-ROM, 1.0, max UDMA/133

[    1.137293] ========================================================
[    1.137819] WARNING: possible irq lock inversion dependency detected
[    1.138329] 5.11.0-rc2+ #187 Not tainted
[    1.138843] --------------------------------------------------------
[    1.139353] kworker/0:0/5 just changed the state of lock:
[    1.139862] ffff8be5c721c218 (&host->lock){-...}-{2:2}, at: ata_bmdma_interrupt+0x24/0x200
[    1.140399] but this lock took another, HARDIRQ-READ-unsafe lock in the past:
[    1.140932]  (&trig->leddev_list_lock){.+.?}-{2:2}
[    1.140934] 
               
               and interrupts could create inverse lock ordering between them.

[    1.143434] 
               other info that might help us debug this:
[    1.144362]  Possible interrupt unsafe locking scenario:

[    1.145291]        CPU0                    CPU1
[    1.145753]        ----                    ----
[    1.146214]   lock(&trig->leddev_list_lock);
[    1.146654]                                local_irq_disable();
[    1.147112]                                lock(&host->lock);
[    1.147569]                                lock(&trig->leddev_list_lock);
[    1.148037]   <Interrupt>
[    1.148486]     lock(&host->lock);
[    1.148920] 
                *** DEADLOCK ***

[    1.150187] no locks held by kworker/0:0/5.
[    1.150616] 
               the shortest dependencies between 2nd lock and 1st lock:
[    1.151452]  -> (&trig->leddev_list_lock){.+.?}-{2:2} {
[    1.151872]     HARDIRQ-ON-R at:
[    1.152275]                       lock_acquire+0x116/0x370
[    1.152690]                       _raw_read_lock+0x38/0x70
[    1.153092]                       led_trigger_event+0x26/0x70
[    1.153502]                       kbd_bh+0x98/0xc0
[    1.153897]                       tasklet_action_common.constprop.0+0xe5/0x100
[    1.154302]                       __do_softirq+0xdd/0x489
[    1.154704]                       run_ksoftirqd+0x3a/0x70
[    1.155094]                       smpboot_thread_fn+0x10b/0x1e0
[    1.155486]                       kthread+0x137/0x150
[    1.155872]                       ret_from_fork+0x22/0x30
[    1.156257]     IN-SOFTIRQ-R at:
[    1.156641]                       lock_acquire+0x116/0x370
[    1.157030]                       _raw_read_lock+0x38/0x70
[    1.157419]                       led_trigger_event+0x26/0x70
[    1.157800]                       kbd_bh+0x98/0xc0
[    1.158175]                       tasklet_action_common.constprop.0+0xe5/0x100
[    1.158560]                       __do_softirq+0xdd/0x489
[    1.158933]                       run_ksoftirqd+0x3a/0x70
[    1.159304]                       smpboot_thread_fn+0x10b/0x1e0
[    1.159667]                       kthread+0x137/0x150
[    1.160022]                       ret_from_fork+0x22/0x30
[    1.160372]     SOFTIRQ-ON-R at:
[    1.160705]                       lock_acquire+0x116/0x370
[    1.161040]                       _raw_read_lock+0x5d/0x70
[    1.161377]                       led_trigger_event+0x26/0x70
[    1.161716]                       power_supply_update_leds+0x4b/0x1b0
[    1.162057]                       power_supply_changed_work+0x70/0xf0
[    1.162382]                       process_one_work+0x26e/0x570
[    1.162709]                       worker_thread+0x55/0x3c0
[    1.163033]                       kthread+0x137/0x150
[    1.163359]                       ret_from_fork+0x22/0x30
[    1.163677]     INITIAL USE at:
[    1.163993]                      lock_acquire+0x116/0x370
[    1.164327]                      _raw_write_lock_irqsave+0x48/0x60
[    1.164657]                      led_trigger_set+0x184/0x2e0
[    1.164982]                      led_trigger_set_default+0x96/0xc0
[    1.165312]                      led_classdev_register_ext+0x29e/0x370
[    1.165642]                      input_leds_connect+0x146/0x280
[    1.165969]                      input_attach_handler+0x7a/0xa0
[    1.166299]                      input_register_device.cold+0xa1/0x153
[    1.166630]                      atkbd_connect+0x269/0x340
[    1.166963]                      serio_driver_probe+0x38/0x50
[    1.167303]                      really_probe+0x205/0x460
[    1.167639]                      driver_probe_device+0xe1/0x150
[    1.167974]                      device_driver_attach+0xa8/0xb0
[    1.168309]                      __driver_attach+0x8c/0x150
[    1.168635]                      bus_for_each_dev+0x67/0x90
[    1.168960]                      serio_handle_event+0x124/0x2d0
[    1.169285]                      process_one_work+0x26e/0x570
[    1.169608]                      worker_thread+0x55/0x3c0
[    1.169929]                      kthread+0x137/0x150
[    1.170254]                      ret_from_fork+0x22/0x30
[    1.170572]     INITIAL READ USE at:
[    1.170884]                           lock_acquire+0x116/0x370
[    1.171210]                           _raw_read_lock+0x38/0x70
[    1.171532]                           led_trigger_event+0x26/0x70
[    1.171854]                           kbd_bh+0x98/0xc0
[    1.172180]                           tasklet_action_common.constprop.0+0xe5/0x100
[    1.172507]                           __do_softirq+0xdd/0x489
[    1.172831]                           run_ksoftirqd+0x3a/0x70
[    1.173156]                           smpboot_thread_fn+0x10b/0x1e0
[    1.173480]                           kthread+0x137/0x150
[    1.173811]                           ret_from_fork+0x22/0x30
[    1.174126]   }
[    1.174429]   ... key      at: [<ffffffff8b09e530>] __key.0+0x0/0x10
[    1.174789]   ... acquired at:
[    1.175110]    _raw_read_lock+0x5d/0x70
[    1.175429]    led_trigger_blink_oneshot+0x30/0x80
[    1.175752]    ledtrig_disk_activity+0x28/0x70
[    1.176081]    ata_qc_complete+0x21/0x440
[    1.176415]    ata_sff_hsm_move+0x16b/0x760
[    1.176746]    ata_sff_pio_task+0xbf/0x1a0
[    1.177062]    process_one_work+0x26e/0x570
[    1.177370]    worker_thread+0x55/0x3c0
[    1.177692]    kthread+0x137/0x150
[    1.177989]    ret_from_fork+0x22/0x30

[    1.178598] -> (&host->lock){-...}-{2:2} {
[    1.178892]    IN-HARDIRQ-W at:
[    1.179185]                     lock_acquire+0x116/0x370
[    1.179479]                     _raw_spin_lock_irqsave+0x48/0x60
[    1.179781]                     ata_bmdma_interrupt+0x24/0x200
[    1.180074]                     __handle_irq_event_percpu+0xcd/0x2b0
[    1.180369]                     handle_irq_event+0x45/0x90
[    1.180662]                     handle_edge_irq+0x87/0x220
[    1.180954]                     asm_call_irq_on_stack+0x12/0x20
[    1.181256]                     common_interrupt+0xf2/0x1a0
[    1.181550]                     asm_common_interrupt+0x1e/0x40
[    1.181842]                     _raw_spin_unlock_irq+0x2b/0x40
[    1.182143]                     finish_task_switch.isra.0+0xa0/0x2c0
[    1.182434]                     __schedule+0x375/0xaf0
[    1.182723]                     schedule+0x5b/0xc0
[    1.183014]                     schedule_timeout+0x15b/0x1c0
[    1.183302]                     wait_for_completion_killable+0xbb/0x140
[    1.183594]                     __kthread_create_on_node+0xe5/0x1a0
[    1.183887]                     kthread_create_on_node+0x39/0x40
[    1.184184]                     create_worker+0xff/0x1e0
[    1.184477]                     worker_thread+0x2e0/0x3c0
[    1.184772]                     kthread+0x137/0x150
[    1.185069]                     ret_from_fork+0x22/0x30
[    1.185360]    INITIAL USE at:
[    1.185643]                    lock_acquire+0x116/0x370
[    1.185934]                    _raw_spin_lock_irqsave+0x48/0x60
[    1.186255]                    ata_dev_init+0x4d/0xe0
[    1.186549]                    ata_link_init+0x86/0xd0
[    1.186837]                    ata_port_alloc+0x1e6/0x200
[    1.187128]                    ata_host_alloc+0xf3/0x130
[    1.187413]                    ata_host_alloc_pinfo+0x10/0xa0
[    1.187697]                    ahci_init_one+0x4f9/0xa20
[    1.187984]                    local_pci_probe+0x42/0x80
[    1.188275]                    pci_device_probe+0xd9/0x190
[    1.188558]                    really_probe+0x205/0x460
[    1.188838]                    driver_probe_device+0xe1/0x150
[    1.189137]                    device_driver_attach+0xa8/0xb0
[    1.189437]                    __driver_attach+0x8c/0x150
[    1.189750]                    bus_for_each_dev+0x67/0x90
[    1.190094]                    bus_add_driver+0x12e/0x1f0
[    1.190393]                    driver_register+0x8b/0xe0
[    1.190698]                    do_one_initcall+0x5b/0x2d0
[    1.191043]                    kernel_init_freeable+0x261/0x2aa
[    1.191367]                    kernel_init+0xa/0x111
[    1.191669]                    ret_from_fork+0x22/0x30
[    1.192009]  }
[    1.192313]  ... key      at: [<ffffffff8b098b90>] __key.6+0x0/0x10
[    1.192611]  ... acquired at:
[    1.192947]    __lock_acquire+0x93f/0x1e10
[    1.193258]    lock_acquire+0x116/0x370
[    1.193585]    _raw_spin_lock_irqsave+0x48/0x60
[    1.193896]    ata_bmdma_interrupt+0x24/0x200
[    1.194193]    __handle_irq_event_percpu+0xcd/0x2b0
[    1.194506]    handle_irq_event+0x45/0x90
[    1.194840]    handle_edge_irq+0x87/0x220
[    1.195155]    asm_call_irq_on_stack+0x12/0x20
[    1.195445]    common_interrupt+0xf2/0x1a0
[    1.195745]    asm_common_interrupt+0x1e/0x40
[    1.196067]    _raw_spin_unlock_irq+0x2b/0x40
[    1.196371]    finish_task_switch.isra.0+0xa0/0x2c0
[    1.196664]    __schedule+0x375/0xaf0
[    1.196993]    schedule+0x5b/0xc0
[    1.197300]    schedule_timeout+0x15b/0x1c0
[    1.197606]    wait_for_completion_killable+0xbb/0x140
[    1.197915]    __kthread_create_on_node+0xe5/0x1a0
[    1.198223]    kthread_create_on_node+0x39/0x40
[    1.198558]    create_worker+0xff/0x1e0
[    1.198889]    worker_thread+0x2e0/0x3c0
[    1.199189]    kthread+0x137/0x150
[    1.199520]    ret_from_fork+0x22/0x30

[    1.200186] 
               stack backtrace:
[    1.200804] CPU: 0 PID: 5 Comm: kworker/0:0 Not tainted 5.11.0-rc2+ #187
[    1.201141] Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
[    1.201495] Workqueue:  0x0 (ipv6_addrconf)
[    1.201856] Call Trace:
[    1.202211]  <IRQ>
[    1.202585]  dump_stack+0x8b/0xb0
[    1.202943]  mark_lock.cold+0x58/0xe9
[    1.203297]  __lock_acquire+0x93f/0x1e10
[    1.203647]  ? lockdep_hardirqs_on_prepare+0x78/0x180
[    1.204035]  ? slab_free_freelist_hook+0xdf/0x160
[    1.204405]  lock_acquire+0x116/0x370
[    1.204774]  ? ata_bmdma_interrupt+0x24/0x200
[    1.205150]  ? __lock_acquire+0x382/0x1e10
[    1.205509]  ? mark_held_locks+0x10/0x70
[    1.205898]  _raw_spin_lock_irqsave+0x48/0x60
[    1.206272]  ? ata_bmdma_interrupt+0x24/0x200
[    1.206687]  ata_bmdma_interrupt+0x24/0x200
[    1.207076]  __handle_irq_event_percpu+0xcd/0x2b0
[    1.207452]  handle_irq_event+0x45/0x90
[    1.207870]  handle_edge_irq+0x87/0x220
[    1.208231]  asm_call_irq_on_stack+0x12/0x20
[    1.208610]  </IRQ>
[    1.208999]  common_interrupt+0xf2/0x1a0
[    1.209375]  asm_common_interrupt+0x1e/0x40
[    1.209756] RIP: 0010:_raw_spin_unlock_irq+0x2b/0x40
[    1.210136] Code: 1f 44 00 00 55 48 8b 74 24 08 48 89 fd 48 8d 7f 18 e8 e9 0f 46 ff 48 89 ef e8 a1 50 46 ff e8 5c f2 51 ff fb 66 0f 1f 44 00 00 <65> ff 0d 8e 55 32 77 5d c3 66 66 2e 0f 1f 84 00 00 00 00 00 90 0f
[    1.210948] RSP: 0018:ffffb1164003bc18 EFLAGS: 00000206
[    1.211363] RAX: 0000000000000071 RBX: 0000000000000002 RCX: 0000000000000000
[    1.211803] RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffffff88cf2824
[    1.212216] RBP: ffff8be5dbc2bd80 R08: 0000000000000001 R09: 0000000000000001
[    1.212642] R10: 0000000000000046 R11: 0000000000000000 R12: ffff8be5dbc2bd80
[    1.213092] R13: ffff8be5c7393140 R14: 0000000000000000 R15: ffff8be5c0293140
[    1.213544]  ? _raw_spin_unlock_irq+0x24/0x40
[    1.213972]  ? _raw_spin_unlock_irq+0x24/0x40
[    1.214354]  finish_task_switch.isra.0+0xa0/0x2c0
[    1.214745]  ? finish_task_switch.isra.0+0x6a/0x2c0
[    1.215130]  __schedule+0x375/0xaf0
[    1.215513]  ? process_one_work+0x570/0x570
[    1.215902]  schedule+0x5b/0xc0
[    1.216281]  schedule_timeout+0x15b/0x1c0
[    1.216665]  ? wait_for_completion_killable+0xb3/0x140
[    1.217051]  ? lockdep_hardirqs_on_prepare+0xff/0x180
[    1.217439]  ? _raw_spin_unlock_irq+0x24/0x40
[    1.217836]  wait_for_completion_killable+0xbb/0x140
[    1.218231]  __kthread_create_on_node+0xe5/0x1a0
[    1.218638]  kthread_create_on_node+0x39/0x40
[    1.219042]  create_worker+0xff/0x1e0
[    1.219440]  worker_thread+0x2e0/0x3c0
[    1.219830]  ? process_one_work+0x570/0x570
[    1.220209]  kthread+0x137/0x150
[    1.220589]  ? __kthread_bind_mask+0x60/0x60
[    1.220972]  ret_from_fork+0x22/0x30
[    1.241802] input: ImExPS/2 Generic Explorer Mouse as /devices/platform/i8042/serio1/input/input4
[    1.325338] ata1: SATA link up 3.0 Gbps (SStatus 123 SControl 300)
[    1.326970] ata1.00: ATA-6: VBOX HARDDISK, 1.0, max UDMA/133
[    1.327339] ata1.00: 41943040 sectors, multi 128: LBA48 NCQ (depth 32)
[    1.327980] ata1.00: configured for UDMA/133

