Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1971F6E338D
	for <lists+linux-leds@lfdr.de>; Sat, 15 Apr 2023 22:32:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbjDOUct (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 15 Apr 2023 16:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbjDOUcs (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 15 Apr 2023 16:32:48 -0400
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18B0835B1
        for <linux-leds@vger.kernel.org>; Sat, 15 Apr 2023 13:32:46 -0700 (PDT)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4edb93139ddso559366e87.0
        for <linux-leds@vger.kernel.org>; Sat, 15 Apr 2023 13:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681590764; x=1684182764;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Dwrh7dAyoW9UleJpS6vdcVEfWYvUrw8rPXSywe/DrSI=;
        b=QTQGLdL7NPAc9LB4dl/5b8nDXvJZWYAE7vDt/+hQPzsQQ3bvu4u4+H1B5BINQGmEIo
         BNvDlVULBXprmLjsJH9zwaZSJcushEp6jb41YzXQaLkOgD1uUQ8FdHk/KN6lrbpcmrTN
         wQtipcM7L/6pvVQjnHmQ65AEfCvQPAzVMH/Hmi0UXyyINjgRsp5OAYUQFQ+rwwLcEdy/
         9N1G899km5rGZLib/lE5aWsHL1gE7SpQLQetL1uX1BQkFqqI6kagjn8AsHmMI7o2kmuJ
         Ais1XJm1sZHgqy8UsYDQxmcDm8JAeX55v3qHmlkbdcVlH2pqVLHmtx9SpcufCX7FCDa4
         eZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681590764; x=1684182764;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dwrh7dAyoW9UleJpS6vdcVEfWYvUrw8rPXSywe/DrSI=;
        b=EzQtbIJ//Uj2VUQ62u8s5Pc7rfGfGhKiabgSvHZHQNvZhNN1n2/vbHaI8d7qbsQCDX
         cW9RDsoVp/w9tZNbxXBrx5TKFWrLG7Xaz5XQoUwM20vk337WbZkJfYeeiWTWT4gIE7hL
         UJjUCTwb4AijDn7KLwGTxsjANZicCof+Iaa9XvANTYzcS6ZVBYUum+q8Bo4kd3kzAYP5
         LlsbhfkM85HQA0ohK7tfZspj1kArBxB9kCbtYEcQumvZZIJ59uDs/mxUCeo0SsFXQ6oi
         SosI9DTyrWqkkY2ZMGw+zihFHhKzUJ3RtF81j64Q6zkKzHrKq9/Q9VJa5FpiQ0QfsPfJ
         gBPw==
X-Gm-Message-State: AAQBX9f/6jU7GFrRzhtsAi7pNVsyOrCiar0jEyJnIoBt21d6DJMcWdfO
        5mhWXwZU3U6dlPqnSy8Ro8NOPoQ6cnY=
X-Google-Smtp-Source: AKy350ZyVcyomPI6s2lIigqna9bOCSxVWcI6pfbzjK6YmSx6qCBh+ABfhYSgsdMCSx0G37i1XMTCcA==
X-Received: by 2002:a05:6512:411:b0:4ec:82d8:ade1 with SMTP id u17-20020a056512041100b004ec82d8ade1mr751362lfk.53.1681590764085;
        Sat, 15 Apr 2023 13:32:44 -0700 (PDT)
Received: from localhost.localdomain ([46.251.53.180])
        by smtp.gmail.com with ESMTPSA id 13-20020ac25f0d000000b004ec8a7e5362sm1419990lfq.101.2023.04.15.13.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Apr 2023 13:32:43 -0700 (PDT)
Received: from jek by localhost.localdomain with local (Exim 4.96)
        (envelope-from <jekhor@gmail.com>)
        id 1pnmZe-006ELY-0l;
        Sat, 15 Apr 2023 23:32:42 +0300
Date:   Sat, 15 Apr 2023 23:32:42 +0300
From:   Yauhen Kharuzhy <jekhor@gmail.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
Subject: Re: [PATCH 0/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC LED
 driver
Message-ID: <ZDsJ6oH1/15gpAr0@jeknote.loshitsa1.net>
References: <20230413151808.20900-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230413151808.20900-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

On Thu, Apr 13, 2023 at 05:18:03PM +0200, Hans de Goede wrote:
> Hi All,
>=20
> Here is a patch series to add support for the LED controller on
> Intel Cherry Trail Whiskey Cove PMICs.
>=20
> This is based on the original patch for this from Yauhen Kharuzhy,
> with additional work on top by me.
>=20
> This addresses the review remarks on the v2 posting from Yauhen:
> - Since the PMIC is connected to the battery any changes we make to
>   the LED settings are permanent, even surviving reboot / poweroff.
>   Save LED1 register settings on probe() and if auto-/hw-control was
>   enabled on probe() restore the settings on remove() and shutdown().
> - Add support for the pattern trigger to select breathing mode
>=20
> This makes the charging LED on devices with these PMICs properly
> reflect the charging status (this relies on sw control on most
> devices) and this also allows control of the LED behind the pen
> (digitizer on) symbol on the keyboard half of the Lenovo Yoga Book
> 1 models.
>=20
> Regards,
>=20
> Hans
>=20
>=20
> Hans de Goede (4):
>   leds: cht-wcove: Add suspend/resume handling
>   leds: cht-wcove: Add support for breathing mode use hw_pattern sysfs
>     API
>   leds: cht-wcove: Set default trigger for charging LED
>   leds: cht-wcove: Use breathing when LED_INIT_DEFAULT_TRIGGER is set
>=20
> Yauhen Kharuzhy (1):
>   leds: Add Intel Cherry Trail Whiskey Cove PMIC LED driver
>=20
>  Documentation/leds/index.rst          |   1 +
>  Documentation/leds/leds-cht-wcove.rst |  29 ++
>  drivers/leds/Kconfig                  |  11 +
>  drivers/leds/Makefile                 |   1 +
>  drivers/leds/leds-cht-wcove.c         | 466 ++++++++++++++++++++++++++
>  5 files changed, 508 insertions(+)
>  create mode 100644 Documentation/leds/leds-cht-wcove.rst
>  create mode 100644 drivers/leds/leds-cht-wcove.c

Hi Hans,

Thanks for reviving this patch!

I haven't tested it on linux-next yet but on v6.2.11 (with few patches for
Yoabook) I catched following trace. I will investigate it later but maybe y=
ou
can take a look also?

[  192.585809] bq25890-charger i2c-bq25892: S:CHG/PG/VSYS=3D2/1/0, F:CHG/BO=
OST/BAT/NTC=3D0/0/0/0
[  196.753095] bq25890-charger i2c-bq25892: Start to request input voltage =
increasing
[  196.770555] bq25890-charger i2c-bq25892: input voltage =3D 4000000 uV
[  200.473777] bq25890-charger i2c-bq25892: input voltage =3D 5900000 uV
[  204.187438] bq25890-charger i2c-bq25892: input voltage =3D 7900000 uV
[  207.864890] bq25890-charger i2c-bq25892: input voltage =3D 11000000 uV
[  211.573333] bq25890-charger i2c-bq25892: input voltage =3D 10900000 uV
[  215.222692] bq25890-charger i2c-bq25892: input voltage =3D 11000000 uV
[  218.937871] bq25890-charger i2c-bq25892: Hi-voltage charging requested, =
input voltage is 11000000 mV
[  242.786148] systemd-journald[270]: Data hash table of /var/log/journal/3=
9241a358af746c292cb608baea5be4c/system.journal has a fill level at 75.0 (85=
33 of 11377 items, 6553600 file size, 768 bytes per hash table item), sugge=
sting rotation.
[  242.786185] systemd-journald[270]: /var/log/journal/39241a358af746c292cb=
608baea5be4c/system.journal: Journal header limits reached or header out-of=
-date, rotating.
[  257.790169] ------------[ cut here ]------------
[  257.790223] Voluntary context switch within RCU read-side critical secti=
on!
[  257.790256] WARNING: CPU: 3 PID: 69 at kernel/rcu/tree_plugin.h:318 rcu_=
note_context_switch+0x4e3/0x6c0
[  257.790337] Modules linked in: rfcomm(E) snd_seq_dummy(E) snd_hrtimer(E)=
 snd_seq(E) snd_seq_device(E) cmac(E) algif_hash(E) algif_skcipher(E) af_al=
g(E) bnep(E) uinput(E) binfmt_misc(E) intel_powerclamp(E) coretemp(E) kvm_i=
ntel(E) snd_soc_sst_cht_yogabook(E) snd_soc_ts3a227e(E) kvm(E) irqbypass(E)=
 crct10dif_pclmul(E) ghash_clmulni_intel(E) snd_sof_acpi_intel_byt(E) snd_s=
of_acpi(E) sha512_ssse3(E) snd_sof_intel_atom(E) snd_sof(E) snd_sof_utils(E=
) snd_sof_xtensa_dsp(E) aesni_intel(E) snd_intel_sst_acpi(E) crypto_simd(E)=
 snd_intel_sst_core(E) cryptd(E) gpio_keys(E) intel_rapl_msr(E) brcmfmac_wc=
c(E) intel_cstate(E) lenovo_yogabook_wmi(E) wmi_bmof(E) pcspkr(E) hci_uart(=
E) btqca(E) snd_soc_sst_atom_hifi2_platform(E) btbcm(E) snd_soc_rt5677(E) b=
q25890_charger(E) btintel(E) snd_soc_rt5677_spi(E) snd_soc_acpi_intel_match=
(E) joydev(E) leds_cht_wcove(E) extcon_intel_cht_wc(E) hid_multitouch(E) br=
cmfmac(E) snd_soc_acpi(E) snd_soc_rl6231(E) bluetooth(E) brcmutil(E) bq27xx=
x_battery_i2c(E) nls_ascii(E)
[  257.790879]  bq27xxx_battery(E) nls_cp437(E) hid_sensor_accel_3d(E) hid_=
sensor_custom_intel_hinge(E) hid_sensor_als(E) spi_nor(E) snd_soc_core(E) i=
TCO_wdt(E) hid_sensor_trigger(E) vfat(E) snd_compress(E) cfg80211(E) mtd(E)=
 iTCO_vendor_support(E) hid_sensor_iio_common(E) snd_hdmi_lpe_audio(E) fat(=
E) snd_intel_dspcfg(E) jitterentropy_rng(E) sx9310(E) snd_pcm(E) sx_common(=
E) tpm_crb(E) snd_timer(E) industrialio_triggered_buffer(E) goodix_ts(E) dr=
bg(E) kfifo_buf(E) intel_hid(E) sparse_keymap(E) snd(E) rfkill_gpio(E) soun=
dcore(E) tpm_tis(E) industrialio(E) ansi_cprng(E) tpm_tis_core(E) ecdh_gene=
ric(E) rfkill(E) ecc(E) tpm(E) processor_thermal_device_pci_legacy(E) proce=
ssor_thermal_device(E) processor_thermal_rfim(E) rng_core(E) processor_ther=
mal_mbox(E) processor_thermal_rapl(E) intel_rapl_common(E) int3400_thermal(=
E) int3406_thermal(E) int3403_thermal(E) soc_button_array(E) acpi_thermal_r=
el(E) int340x_thermal_zone(E) intel_int0002_vgpio(E) evdev(E) intel_soc_dts=
_iosf(E) acpi_pad(E)
[  257.791393]  squashfs(E) loop(E) ramoops(E) reed_solomon(E) intel_pstore=
_pram(E) msr(E) parport_pc(E) ppdev(E) lp(E) parport(E) fuse(E) efi_pstore(=
E) configfs(E) efivarfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4(E) crc3=
2c_generic(E) crc16(E) mbcache(E) jbd2(E) hid_sensor_custom(E) hid_sensor_h=
ub(E) intel_ishtp_hid(E) wacom(E) dwc3(E) usbhid(E) ulpi(E) hid_generic(E) =
udc_core(E) i915(E) xhci_pci(E) spi_intel_platform(E) i2c_algo_bit(E) spi_i=
ntel(E) mmc_block(E) xhci_hcd(E) drm_buddy(E) drm_display_helper(E) cec(E) =
ttm(E) usbcore(E) video(E) drm_kms_helper(E) intel_ish_ipc(E) crc32_pclmul(=
E) spi_pxa2xx_platform(E) crc32c_intel(E) i2c_cht_wc(E) i2c_hid_acpi(E) lpc=
_ich(E) dwc3_pci(E) usb_common(E) drm(E) intel_ishtp(E) thermal(E) i2c_hid(=
E) hid(E) wmi(E) sdhci_acpi(E) dw_dmac(E) sdhci(E) pwm_lpss_platform(E) pwm=
_lpss(E) dw_dmac_core(E) mmc_core(E) button(E)
[  257.792047] CPU: 3 PID: 69 Comm: kworker/3:2 Tainted: G            E    =
  6.2.11-yogabook1 #57
[  257.792084] Hardware name: LENOVO Lenovo YB1-X91L/INVALID, BIOS 04WT18WW=
 08/26/2016
[  257.792110] Workqueue: events power_supply_changed_work
[  257.792163] RIP: 0010:rcu_note_context_switch+0x4e3/0x6c0
[  257.792206] Code: 49 89 3e 49 83 bc 24 98 00 00 00 00 0f 85 6c fe ff ff =
e9 5e fe ff ff 48 c7 c7 f0 5e d0 be c6 05 e7 bb 45 01 01 e8 ed 66 f6 ff <0f=
> 0b e9 7c fb ff ff a9 ff ff ff 7f 0f 84 38 fc ff ff 65 48 8b 3c
[  257.792240] RSP: 0018:ffffb357003ef830 EFLAGS: 00010046
[  257.792275] RAX: 0000000000000000 RBX: ffff95dd3abae280 RCX: 00000000000=
00000
[  257.792302] RDX: 0000000000000003 RSI: ffffffffbed4bfb7 RDI: 00000000fff=
fffff
[  257.792327] RBP: 0000000000000000 R08: 0000000000000000 R09: ffffb357003=
ef6e0
[  257.792352] R10: 0000000000000003 R11: ffff95dd3fbfefe8 R12: 00000000000=
2d400
[  257.792376] R13: ffff95dcca22cc40 R14: 0000000000000000 R15: ffff95dcca2=
2cc40
[  257.792403] FS:  0000000000000000(0000) GS:ffff95dd3ab80000(0000) knlGS:=
0000000000000000
[  257.792431] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[  257.792456] CR2: 000055cdc7a88670 CR3: 0000000155c0a000 CR4: 00000000001=
006e0
[  257.792485] Call Trace:
[  257.792511]  <TASK>
[  257.792535]  ? _raw_spin_lock_irqsave+0x23/0x50
[  257.792579]  ? preempt_count_add+0x62/0xa0
[  257.792625]  __schedule+0xac/0x9d0
[  257.792663]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[  257.792700]  ? __mod_timer+0x28a/0x3c0
[  257.792743]  schedule+0x5d/0xe0
[  257.792775]  schedule_timeout+0x8a/0x160
[  257.792812]  ? __bpf_trace_tick_stop+0x10/0x10
[  257.792849]  msleep+0x29/0x40
[  257.792885]  acpi_lpss_resume+0x6e/0x160
[  257.792924]  ? acpi_lpss_resume+0x160/0x160
[  257.792958]  acpi_lpss_runtime_resume+0xe/0x20
[  257.792993]  __rpm_callback+0x44/0x170
[  257.793029]  ? acpi_lpss_resume+0x160/0x160
[  257.793065]  rpm_callback+0x59/0x70
[  257.793100]  ? acpi_lpss_resume+0x160/0x160
[  257.793135]  rpm_resume+0x5f8/0x850
[  257.793168]  ? acpi_ut_update_ref_count.part.0+0x7a/0x8f0
[  257.793215]  __pm_runtime_resume+0x3c/0x60
[  257.793251]  i2c_dw_xfer+0x47/0x490
[  257.793291]  __i2c_transfer+0x16e/0x6c0
[  257.793335]  i2c_smbus_xfer_emulated+0x26f/0x9c0
[  257.793375]  ? __switch_to+0x7e/0x420
[  257.793410]  ? update_load_avg+0x80/0x790
[  257.793447]  __i2c_smbus_xfer+0xab/0x410
[  257.793477]  ? enqueue_entity+0x19a/0x4f0
[  257.793514]  i2c_smbus_xfer+0x6a/0xe0
[  257.793547]  i2c_smbus_read_byte_data+0x45/0x70
[  257.793578]  ? _raw_spin_unlock_irqrestore+0x23/0x40
[  257.793615]  ? try_to_wake_up+0x95/0x590
[  257.793653]  cht_wc_byte_reg_read+0x2e/0x60
[  257.793701]  _regmap_read+0x5a/0x110
[  257.793737]  _regmap_update_bits+0xb4/0xf0
[  257.793775]  regmap_update_bits_base+0x59/0x80
[  257.793816]  cht_wc_leds_set_effect+0xcb/0x1b0 [leds_cht_wcove]
[  257.793875]  led_blink_setup+0x25/0x100
[  257.793912]  led_trigger_blink+0x45/0x70
[  257.793947]  power_supply_update_leds+0x1d6/0x1e0
[  257.793991]  power_supply_changed_work+0x6f/0xf0
[  257.794029]  process_one_work+0x1c7/0x3c0
[  257.794065]  worker_thread+0x4e/0x3a0
[  257.794095]  ? _raw_spin_lock_irqsave+0x23/0x50
[  257.794133]  ? rescuer_thread+0x3b0/0x3b0
[  257.794161]  kthread+0xe9/0x110
[  257.794195]  ? kthread_complete_and_exit+0x20/0x20
[  257.794233]  ret_from_fork+0x1f/0x30
[  257.794280]  </TASK>
[  257.794298] ---[ end trace 0000000000000000 ]---
[  257.854563] bq25890-charger i2c-bq25892: S:CHG/PG/VSYS=3D2/1/0, F:CHG/BO=
OST/BAT/NTC=3D0/0/0/0

--=20
Yauhen Kharuzhy
