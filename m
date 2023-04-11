Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98B3F6DE3A9
	for <lists+linux-leds@lfdr.de>; Tue, 11 Apr 2023 20:16:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjDKSQO (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Apr 2023 14:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjDKSQN (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 11 Apr 2023 14:16:13 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 576E9173D
        for <linux-leds@vger.kernel.org>; Tue, 11 Apr 2023 11:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681236909;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=5182Yu58Eh1EjdLwnQ4cU4/fRYu2/ra8CI8FCnD1miA=;
        b=AQ2O+M4dUbnySy/TwhkwlGDeEt7dx5KfTkzWDRHbu0eiVhw59iGaQKNTidgHoXujuTojpc
        6QEUR/y6NpI6874v1vfsG7cWywC/MQb+lQTRbJAvxcm+2p6vRbIR38Wltqr0EUpbCHqyym
        JVW42b4vLodnwoQ8BWBDAGuIs5aiTFQ=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-102-5UGCh2vXP7ml3fG7w9PCaw-1; Tue, 11 Apr 2023 14:15:08 -0400
X-MC-Unique: 5UGCh2vXP7ml3fG7w9PCaw-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-94a341efd9aso128423266b.0
        for <linux-leds@vger.kernel.org>; Tue, 11 Apr 2023 11:15:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681236907; x=1683828907;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5182Yu58Eh1EjdLwnQ4cU4/fRYu2/ra8CI8FCnD1miA=;
        b=FuYnte/8XNPm4ZBnTxYVk4DAc5nxiwNmJQBMmEfnOekfbgmtvD3XGOOXKnSsvpg8md
         c2iwVbCGqjWtBtaPeceOZeTk3tunGoEH4ptU6+pC4912YmoEil8PfjgFEIl9ZzsY0k4F
         a3M80CBlL51cJu8aexZAsxL+FFeL4f+Jk76GmCkwyjmXIX9vBglF6BuVVOTXVDmOowsf
         ZvCY6Odi1ukrRkwB7A8ja4JVp6gNW4xNit0J99PBs+sT+yLGsxn3STuDwM2U9n2VEk4V
         +3J+lCh6TpHZFSJnQmf1JODZ17TgTv3kS4x/0nptyafpXTrceoKS5pCtzFPyLwAxzagv
         suPw==
X-Gm-Message-State: AAQBX9dmLWPKvUl5T1mE0yUO4Q3PN4gvDW4dFgFsGGIjnSloG/UmyvRY
        hsijl3nWnu47mwg75OONuaSr12BV1jN2IwDwEHgsh9BVm5efsVdPpxVYX3YMbhHwUEaKdxGlMfo
        xDmxoDgBQwmcQPxZK9FPbFg==
X-Received: by 2002:aa7:d303:0:b0:504:9cec:8afb with SMTP id p3-20020aa7d303000000b005049cec8afbmr8604002edq.2.1681236906870;
        Tue, 11 Apr 2023 11:15:06 -0700 (PDT)
X-Google-Smtp-Source: AKy350aIn0TBPpkdtZ6CuLmrLeHqKAzUbe15stp9kyDqyWEiuEVtirFPzXJ2kVtNzNNGswa7/jCcwQ==
X-Received: by 2002:aa7:d303:0:b0:504:9cec:8afb with SMTP id p3-20020aa7d303000000b005049cec8afbmr8603982edq.2.1681236906488;
        Tue, 11 Apr 2023 11:15:06 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id e2-20020a170906248200b0094a90d3e385sm2220798ejb.30.2023.04.11.11.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 11:15:05 -0700 (PDT)
Message-ID: <600cc06e-081d-cd90-947d-f8988f1af194@redhat.com>
Date:   Tue, 11 Apr 2023 20:15:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Content-Language: en-US, nl
To:     Johannes Berg <johannes.berg@intel.com>,
        Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>
Cc:     Linux LED Subsystem <linux-leds@vger.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: "leds: trigger: use RCU to protect the led_cdevs list" triggers RCU
 error checks
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Johannes, et al.,=20

Sorry to bring the bearer of bad news, but your commit 2a5a8fa8b23
("leds: trigger: use RCU to protect the led_cdevs list"),
is causing the following RCU warning when used with blinking
triggers on I2C LED controllers which support hw blinking.

The specific problem is drivers/leds/led-triggers.c:
led_trigger_blink_setup() which does:

        rcu_read_lock();
        list_for_each_entry_rcu(led_cdev, &trig->led_cdevs, trig_list) {
                if (oneshot)
                        led_blink_set_oneshot(led_cdev, delay_on, delay_o=
ff,
                                              invert);
                else
                        led_blink_set(led_cdev, delay_on, delay_off);
        }
        rcu_read_unlock();

And that led_blink_set() call then hits this path:

        if (!test_bit(LED_BLINK_ONESHOT, &led_cdev->work_flags) &&
            led_cdev->blink_set &&
            !led_cdev->blink_set(led_cdev, delay_on, delay_off))
                return;

Which calls directly into the LED controller driver which
talks to the LED controller over I2C which may sleep.

AFAICT (not much RCU experience) the problem basically is that in
a rcu_read_lock() section the code may not sleep. While
led_blink_set() can sleep. For completeness sake I've added
the full backtrace at the end of this email, but it really is not
that interesting.

=46rom the original commit I understand that RCU was chosen
because of other hairy issues. For non blinking triggers this
works fine, because led_set_brightness() is guaranteed to
not sleep using a workqueue to delay the set brightness
in case it would sleep.

We could do something similar for led_set_blink, at least
when called from led_trigger_blink[_oneshot], to avoid
this issue.

But I wonder if someone has any better ideas ?

Regards,

Hans











[  832.605062] ------------[ cut here ]------------
[  832.605085] Voluntary context switch within RCU read-side critical sec=
tion!
[  832.605119] WARNING: CPU: 2 PID: 370 at kernel/rcu/tree_plugin.h:318 r=
cu_note_context_switch+0x4ee/0x690
[  832.605175] Modules linked in: snd_seq_dummy snd_hrtimer joydev wacom =
bq25890_charger(E) bq27xxx_battery_i2c(E) i2c_hid_of(E) goodix_ts hideep =
lp855x_bl bq27xxx_battery(E) snd_soc_sst_byt_cht_nocodec qrtr brcmfmac_wc=
c mei_pxp dwc3 mei_hdcp intel_powerclamp coretemp kvm_intel intel_rapl_ms=
r gpio_keys x86_android_tablets(E) udc_core ulpi brcmfmac kvm brcmutil ir=
qbypass i2c_cht_wc intel_cstate snd_sof_acpi_intel_byt cfg80211 snd_sof_a=
cpi snd_sof_intel_atom leds_cht_wcove(E) snd_sof_xtensa_dsp snd_sof pcspk=
r extcon_intel_cht_wc snd_sof_utils lpc_ich snd_intel_sst_acpi intel_xhci=
_usb_role_switch snd_soc_acpi_intel_match snd_intel_sst_core snd_soc_sst_=
atom_hifi2_platform hid_sensor_magn_3d snd_soc_acpi snd_intel_dspcfg snd_=
intel_sdw_acpi hid_sensor_gyro_3d hid_sensor_accel_3d hid_sensor_incl_3d =
hid_sensor_rotation hid_sensor_als hid_sensor_trigger hid_sensor_iio_comm=
on industrialio_triggered_buffer kfifo_buf industrialio snd_soc_core snd_=
compress ac97_bus hci_uart(E) btqca(E) btrtl(E) btbcm(E) snd_pcm_dmaengin=
e btintel(E)
[  832.605676]  snd_hdmi_lpe_audio intel_hid sparse_keymap intel_soc_pmic=
_bxtwc snd_seq bluetooth snd_seq_device ov5693 snd_pcm atomisp_ov2722(C) =
v4l2_fwnode v4l2_async atomisp_gmin_platform(C) videodev spi_pxa2xx_platf=
orm mc ecdh_generic snd_timer rfkill_gpio processor_thermal_device_pci_le=
gacy snd rfkill dw_dmac processor_thermal_device soundcore processor_ther=
mal_rfim processor_thermal_mbox mei_txe processor_thermal_rapl vfat fat i=
nt3400_thermal intel_rapl_common int3403_thermal mei soc_button_array int=
3406_thermal acpi_thermal_rel int340x_thermal_zone dptf_power(E) intel_so=
c_dts_iosf intel_int0002_vgpio dwc3_pci acpi_pad(E) zram hid_sensor_hub i=
ntel_ishtp_hid i915(E) crct10dif_pclmul mmc_block crc32_pclmul crc32c_int=
el i2c_algo_bit drm_buddy(E) drm_display_helper(E) ghash_clmulni_intel sh=
a512_ssse3 wdat_wdt intel_ish_ipc cec video(E) intel_ishtp sdhci_acpi ttm=
(E) sdhci wmi i2c_hid_acpi(E) i2c_hid(E) mmc_core pwm_lpss_platform pwm_l=
pss ip6_tables ip_tables i2c_dev fuse
[  832.606213] CPU: 2 PID: 370 Comm: kworker/2:4 Tainted: G        WC  E =
     6.3.0-rc4+ #179
[  832.606237] Hardware name: Intel Corporation CHERRYVIEW D1 PLATFORM/Ch=
erry Trail Tablet, BIOS CHTTYETI.X64.0514.R1B.1701240934 01/24/2017
[  832.606251] Workqueue: events power_supply_changed_work
[  832.606281] RIP: 0010:rcu_note_context_switch+0x4ee/0x690
[  832.606311] Code: 49 89 3f 49 83 bc 24 98 00 00 00 00 0f 85 66 fe ff f=
f e9 58 fe ff ff 48 c7 c7 48 e4 75 83 c6 05 b9 0c b2 01 01 e8 92 4b f5 ff=
 <0f> 0b e9 70 fb ff ff a9 ff ff ff 7f 0f 84 2c fc ff ff 65 48 8b 3c
[  832.606328] RSP: 0018:ffffbd0480737908 EFLAGS: 00010092
[  832.606348] RAX: 000000000000003f RBX: ffff9ff8fa933900 RCX: 000000000=
0000000
[  832.606362] RDX: 0000000000000003 RSI: ffffffff837b6da0 RDI: 00000000f=
fffffff
[  832.606374] RBP: 0000000000000000 R08: 0000000000000000 R09: ffffbd048=
07377c0
[  832.606386] R10: 0000000000000003 R11: ffffffff83b44168 R12: ffff9ff8f=
a932a80
[  832.606398] R13: ffff9ff8867a0000 R14: ffffbd0480737a78 R15: ffff9ff88=
10e5060
[  832.606411] FS:  0000000000000000(0000) GS:ffff9ff8fa900000(0000) knlG=
S:0000000000000000
[  832.606427] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  832.606439] CR2: 00007f1e96b510c8 CR3: 0000000155a20000 CR4: 000000000=
01006e0
[  832.606453] Call Trace:
[  832.606466]  <TASK>
[  832.606487]  __schedule+0x9f/0x1480
[  832.606527]  schedule+0x5d/0xe0
[  832.606549]  schedule_timeout+0x79/0x140
[  832.606572]  ? __pfx_process_timeout+0x10/0x10
[  832.606599]  wait_for_completion_timeout+0x6f/0x140
[  832.606627]  i2c_dw_xfer+0x101/0x460
[  832.606659]  ? psi_group_change+0x168/0x400
[  832.606680]  __i2c_transfer+0x172/0x6d0
[  832.606709]  i2c_smbus_xfer_emulated+0x27d/0x9c0
[  832.606732]  ? __schedule+0x430/0x1480
[  832.606753]  ? preempt_count_add+0x6a/0xa0
[  832.606778]  ? get_nohz_timer_target+0x18/0x190
[  832.606796]  ? lock_timer_base+0x61/0x80
[  832.606817]  ? preempt_count_add+0x6a/0xa0
[  832.606842]  __i2c_smbus_xfer+0xa2/0x3f0
[  832.606862]  i2c_smbus_xfer+0x66/0xf0
[  832.606882]  i2c_smbus_read_byte_data+0x41/0x70
[  832.606901]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[  832.606922]  ? __pm_runtime_suspend+0x46/0xc0
[  832.606946]  cht_wc_byte_reg_read+0x2e/0x60
[  832.606972]  _regmap_read+0x5c/0x120
[  832.606997]  _regmap_update_bits+0x96/0xc0
[  832.607023]  regmap_update_bits_base+0x5b/0x90
[  832.607053]  cht_wc_leds_brightness_get+0x412/0x910 [leds_cht_wcove]
[  832.607094]  led_blink_setup+0x28/0x100
[  832.607119]  led_trigger_blink+0x40/0x70
[  832.607145]  power_supply_update_leds+0x1b7/0x1c0
[  832.607174]  power_supply_changed_work+0x67/0xe0
[  832.607198]  process_one_work+0x1c8/0x3c0
[  832.607222]  worker_thread+0x4d/0x380
[  832.607243]  ? __pfx_worker_thread+0x10/0x10
[  832.607258]  kthread+0xe9/0x110
[  832.607279]  ? __pfx_kthread+0x10/0x10
[  832.607300]  ret_from_fork+0x2c/0x50
[  832.607337]  </TASK>
[  832.607344] ---[ end trace 0000000000000000 ]---


