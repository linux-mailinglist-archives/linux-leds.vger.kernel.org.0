Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EA4C6E3876
	for <lists+linux-leds@lfdr.de>; Sun, 16 Apr 2023 15:05:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbjDPNFl (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 16 Apr 2023 09:05:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230437AbjDPNFk (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 16 Apr 2023 09:05:40 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C0CB1FCE
        for <linux-leds@vger.kernel.org>; Sun, 16 Apr 2023 06:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681650293;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aZCeISM989ciGxju+nt/KeBlsnxzJwTHK/8ZGAmbL5U=;
        b=F6vk5DbkNZa4maZKoziCBg0cUq2xYbjSvTo3OUlc796xKZtsc3Qqpa/ozpuKkS278jr7JH
        oe2Zm+ojOWUjjjyJ7mmRA18oVaB3FjC3HTjt6io5FD0P+72BfU6rB/QXLKGW76c9vMItcF
        k/BkCIU9AD/1zRxWrhkjoIREPQyx5KE=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-eFj8LQxVPueFllK-lTs-Rw-1; Sun, 16 Apr 2023 09:04:52 -0400
X-MC-Unique: eFj8LQxVPueFllK-lTs-Rw-1
Received: by mail-ej1-f72.google.com with SMTP id qp26-20020a170907207a00b0094efd1b28b2so1240988ejb.3
        for <linux-leds@vger.kernel.org>; Sun, 16 Apr 2023 06:04:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681650290; x=1684242290;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aZCeISM989ciGxju+nt/KeBlsnxzJwTHK/8ZGAmbL5U=;
        b=BGHKCy4ytBK9l12YaVOavGFGUgm8k9emS5Vw0tAl7GsXgrDyCHA2/azKHvZGi1IhfV
         CLqHX8ZZGPB/3trjiTvjQMiioJHfT6P7bZtYLFOGnEXUlpZC9XK+pjemhc2RpMaIqSCy
         n9TWLX3SK4JwNJ+oRcQoHkCBHGoPDQgJu2RkiZCQ64QV02CefH9dA+DQKuYm/0Tw+2VI
         5iH9oR5QU8nq4b8AwnhsDpbHPTwXtq290+4TOuxwO390OQG8ml8x23bMeGxKSZnISxN8
         B7duj9mOc4b2ZFbx+RNQxdBi2508TsVfq3unhR/h/GCNd+qzJFHoGA2tUAyLcfpALoOM
         H9Sw==
X-Gm-Message-State: AAQBX9etIwDHl4tVrXuv8flHtsF9Bwmv2/lbov+CxxGdAOC0jaByuaR0
        pFHlO6TWA0tjLdkNL/U0U0rCqWGEOUixCLOaZl6HpqnkKFjCrfstFl6Pa0dzsfve5+Mf2+FchAd
        iW3uIy/Z7hr99SGVIwQn4Zg==
X-Received: by 2002:a17:907:6d11:b0:94f:59aa:8a7c with SMTP id sa17-20020a1709076d1100b0094f59aa8a7cmr1318528ejc.20.1681650290111;
        Sun, 16 Apr 2023 06:04:50 -0700 (PDT)
X-Google-Smtp-Source: AKy350bI3n7QIWeFZ8yhEXQhHjnyn3uI/cvju6K1CwK6bkKMizJlRuNM2Nw6vBOByknAzZe8Z+MKzQ==
X-Received: by 2002:a17:907:6d11:b0:94f:59aa:8a7c with SMTP id sa17-20020a1709076d1100b0094f59aa8a7cmr1318506ejc.20.1681650289732;
        Sun, 16 Apr 2023 06:04:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id m7-20020a17090679c700b0094a8aa6338dsm5168437ejo.14.2023.04.16.06.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 06:04:48 -0700 (PDT)
Message-ID: <ab04d6ed-ee83-ea89-c668-f9958d9cc400@redhat.com>
Date:   Sun, 16 Apr 2023 15:04:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 0/5] leds: Add Intel Cherry Trail Whiskey Cove PMIC LED
 driver
Content-Language: en-US, nl
To:     Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
References: <20230413151808.20900-1-hdegoede@redhat.com>
 <ZDsJ6oH1/15gpAr0@jeknote.loshitsa1.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZDsJ6oH1/15gpAr0@jeknote.loshitsa1.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Yauhen,

On 4/15/23 22:32, Yauhen Kharuzhy wrote:
> On Thu, Apr 13, 2023 at 05:18:03PM +0200, Hans de Goede wrote:
>> Hi All,
>>
>> Here is a patch series to add support for the LED controller on
>> Intel Cherry Trail Whiskey Cove PMICs.
>>
>> This is based on the original patch for this from Yauhen Kharuzhy,
>> with additional work on top by me.
>>
>> This addresses the review remarks on the v2 posting from Yauhen:
>> - Since the PMIC is connected to the battery any changes we make to
>>   the LED settings are permanent, even surviving reboot / poweroff.
>>   Save LED1 register settings on probe() and if auto-/hw-control was
>>   enabled on probe() restore the settings on remove() and shutdown().
>> - Add support for the pattern trigger to select breathing mode
>>
>> This makes the charging LED on devices with these PMICs properly
>> reflect the charging status (this relies on sw control on most
>> devices) and this also allows control of the LED behind the pen
>> (digitizer on) symbol on the keyboard half of the Lenovo Yoga Book
>> 1 models.
>>
>> Regards,
>>
>> Hans
>>
>>
>> Hans de Goede (4):
>>   leds: cht-wcove: Add suspend/resume handling
>>   leds: cht-wcove: Add support for breathing mode use hw_pattern sysfs=

>>     API
>>   leds: cht-wcove: Set default trigger for charging LED
>>   leds: cht-wcove: Use breathing when LED_INIT_DEFAULT_TRIGGER is set
>>
>> Yauhen Kharuzhy (1):
>>   leds: Add Intel Cherry Trail Whiskey Cove PMIC LED driver
>>
>>  Documentation/leds/index.rst          |   1 +
>>  Documentation/leds/leds-cht-wcove.rst |  29 ++
>>  drivers/leds/Kconfig                  |  11 +
>>  drivers/leds/Makefile                 |   1 +
>>  drivers/leds/leds-cht-wcove.c         | 466 +++++++++++++++++++++++++=
+
>>  5 files changed, 508 insertions(+)
>>  create mode 100644 Documentation/leds/leds-cht-wcove.rst
>>  create mode 100644 drivers/leds/leds-cht-wcove.c
>=20
> Hi Hans,
>=20
> Thanks for reviving this patch!

You're welcome.

> I haven't tested it on linux-next yet but on v6.2.11 (with few patches =
for
> Yoabook) I catched following trace. I will investigate it later but may=
be you
> can take a look also?

Right, this is an unrelated pre-existing kernel bug when using
led_trigger_blink().

I already hit that myself and I have a fix for it, see this series:
https://lore.kernel.org/linux-leds/20230412215855.593541-1-hdegoede@redha=
t.com/

And for the blinking -> solid transition to work when the battery goes
from charging to full you also need:
https://lore.kernel.org/linux-pm/20230413100941.115529-1-hdegoede@redhat.=
com/

I guess I should have mentioned both in the cover-letter, sorry about tha=
t.

And related to this there are also these 2 power-supply patch series
which are also relevant for the yogabook:

https://lore.kernel.org/linux-pm/20230415160734.70475-1-hdegoede@redhat.c=
om/
https://lore.kernel.org/linux-pm/20230415182341.86916-1-hdegoede@redhat.c=
om/

Regards,

Hans







> [  192.585809] bq25890-charger i2c-bq25892: S:CHG/PG/VSYS=3D2/1/0, F:CH=
G/BOOST/BAT/NTC=3D0/0/0/0
> [  196.753095] bq25890-charger i2c-bq25892: Start to request input volt=
age increasing
> [  196.770555] bq25890-charger i2c-bq25892: input voltage =3D 4000000 u=
V
> [  200.473777] bq25890-charger i2c-bq25892: input voltage =3D 5900000 u=
V
> [  204.187438] bq25890-charger i2c-bq25892: input voltage =3D 7900000 u=
V
> [  207.864890] bq25890-charger i2c-bq25892: input voltage =3D 11000000 =
uV
> [  211.573333] bq25890-charger i2c-bq25892: input voltage =3D 10900000 =
uV
> [  215.222692] bq25890-charger i2c-bq25892: input voltage =3D 11000000 =
uV
> [  218.937871] bq25890-charger i2c-bq25892: Hi-voltage charging request=
ed, input voltage is 11000000 mV
> [  242.786148] systemd-journald[270]: Data hash table of /var/log/journ=
al/39241a358af746c292cb608baea5be4c/system.journal has a fill level at 75=
=2E0 (8533 of 11377 items, 6553600 file size, 768 bytes per hash table it=
em), suggesting rotation.
> [  242.786185] systemd-journald[270]: /var/log/journal/39241a358af746c2=
92cb608baea5be4c/system.journal: Journal header limits reached or header =
out-of-date, rotating.
> [  257.790169] ------------[ cut here ]------------
> [  257.790223] Voluntary context switch within RCU read-side critical s=
ection!
> [  257.790256] WARNING: CPU: 3 PID: 69 at kernel/rcu/tree_plugin.h:318 =
rcu_note_context_switch+0x4e3/0x6c0
> [  257.790337] Modules linked in: rfcomm(E) snd_seq_dummy(E) snd_hrtime=
r(E) snd_seq(E) snd_seq_device(E) cmac(E) algif_hash(E) algif_skcipher(E)=
 af_alg(E) bnep(E) uinput(E) binfmt_misc(E) intel_powerclamp(E) coretemp(=
E) kvm_intel(E) snd_soc_sst_cht_yogabook(E) snd_soc_ts3a227e(E) kvm(E) ir=
qbypass(E) crct10dif_pclmul(E) ghash_clmulni_intel(E) snd_sof_acpi_intel_=
byt(E) snd_sof_acpi(E) sha512_ssse3(E) snd_sof_intel_atom(E) snd_sof(E) s=
nd_sof_utils(E) snd_sof_xtensa_dsp(E) aesni_intel(E) snd_intel_sst_acpi(E=
) crypto_simd(E) snd_intel_sst_core(E) cryptd(E) gpio_keys(E) intel_rapl_=
msr(E) brcmfmac_wcc(E) intel_cstate(E) lenovo_yogabook_wmi(E) wmi_bmof(E)=
 pcspkr(E) hci_uart(E) btqca(E) snd_soc_sst_atom_hifi2_platform(E) btbcm(=
E) snd_soc_rt5677(E) bq25890_charger(E) btintel(E) snd_soc_rt5677_spi(E) =
snd_soc_acpi_intel_match(E) joydev(E) leds_cht_wcove(E) extcon_intel_cht_=
wc(E) hid_multitouch(E) brcmfmac(E) snd_soc_acpi(E) snd_soc_rl6231(E) blu=
etooth(E) brcmutil(E) bq27xxx_battery_i2c(E) nls_ascii(E)
> [  257.790879]  bq27xxx_battery(E) nls_cp437(E) hid_sensor_accel_3d(E) =
hid_sensor_custom_intel_hinge(E) hid_sensor_als(E) spi_nor(E) snd_soc_cor=
e(E) iTCO_wdt(E) hid_sensor_trigger(E) vfat(E) snd_compress(E) cfg80211(E=
) mtd(E) iTCO_vendor_support(E) hid_sensor_iio_common(E) snd_hdmi_lpe_aud=
io(E) fat(E) snd_intel_dspcfg(E) jitterentropy_rng(E) sx9310(E) snd_pcm(E=
) sx_common(E) tpm_crb(E) snd_timer(E) industrialio_triggered_buffer(E) g=
oodix_ts(E) drbg(E) kfifo_buf(E) intel_hid(E) sparse_keymap(E) snd(E) rfk=
ill_gpio(E) soundcore(E) tpm_tis(E) industrialio(E) ansi_cprng(E) tpm_tis=
_core(E) ecdh_generic(E) rfkill(E) ecc(E) tpm(E) processor_thermal_device=
_pci_legacy(E) processor_thermal_device(E) processor_thermal_rfim(E) rng_=
core(E) processor_thermal_mbox(E) processor_thermal_rapl(E) intel_rapl_co=
mmon(E) int3400_thermal(E) int3406_thermal(E) int3403_thermal(E) soc_butt=
on_array(E) acpi_thermal_rel(E) int340x_thermal_zone(E) intel_int0002_vgp=
io(E) evdev(E) intel_soc_dts_iosf(E) acpi_pad(E)
> [  257.791393]  squashfs(E) loop(E) ramoops(E) reed_solomon(E) intel_ps=
tore_pram(E) msr(E) parport_pc(E) ppdev(E) lp(E) parport(E) fuse(E) efi_p=
store(E) configfs(E) efivarfs(E) ip_tables(E) x_tables(E) autofs4(E) ext4=
(E) crc32c_generic(E) crc16(E) mbcache(E) jbd2(E) hid_sensor_custom(E) hi=
d_sensor_hub(E) intel_ishtp_hid(E) wacom(E) dwc3(E) usbhid(E) ulpi(E) hid=
_generic(E) udc_core(E) i915(E) xhci_pci(E) spi_intel_platform(E) i2c_alg=
o_bit(E) spi_intel(E) mmc_block(E) xhci_hcd(E) drm_buddy(E) drm_display_h=
elper(E) cec(E) ttm(E) usbcore(E) video(E) drm_kms_helper(E) intel_ish_ip=
c(E) crc32_pclmul(E) spi_pxa2xx_platform(E) crc32c_intel(E) i2c_cht_wc(E)=
 i2c_hid_acpi(E) lpc_ich(E) dwc3_pci(E) usb_common(E) drm(E) intel_ishtp(=
E) thermal(E) i2c_hid(E) hid(E) wmi(E) sdhci_acpi(E) dw_dmac(E) sdhci(E) =
pwm_lpss_platform(E) pwm_lpss(E) dw_dmac_core(E) mmc_core(E) button(E)
> [  257.792047] CPU: 3 PID: 69 Comm: kworker/3:2 Tainted: G            E=
      6.2.11-yogabook1 #57
> [  257.792084] Hardware name: LENOVO Lenovo YB1-X91L/INVALID, BIOS 04WT=
18WW 08/26/2016
> [  257.792110] Workqueue: events power_supply_changed_work
> [  257.792163] RIP: 0010:rcu_note_context_switch+0x4e3/0x6c0
> [  257.792206] Code: 49 89 3e 49 83 bc 24 98 00 00 00 00 0f 85 6c fe ff=
 ff e9 5e fe ff ff 48 c7 c7 f0 5e d0 be c6 05 e7 bb 45 01 01 e8 ed 66 f6 =
ff <0f> 0b e9 7c fb ff ff a9 ff ff ff 7f 0f 84 38 fc ff ff 65 48 8b 3c
> [  257.792240] RSP: 0018:ffffb357003ef830 EFLAGS: 00010046
> [  257.792275] RAX: 0000000000000000 RBX: ffff95dd3abae280 RCX: 0000000=
000000000
> [  257.792302] RDX: 0000000000000003 RSI: ffffffffbed4bfb7 RDI: 0000000=
0ffffffff
> [  257.792327] RBP: 0000000000000000 R08: 0000000000000000 R09: ffffb35=
7003ef6e0
> [  257.792352] R10: 0000000000000003 R11: ffff95dd3fbfefe8 R12: 0000000=
00002d400
> [  257.792376] R13: ffff95dcca22cc40 R14: 0000000000000000 R15: ffff95d=
cca22cc40
> [  257.792403] FS:  0000000000000000(0000) GS:ffff95dd3ab80000(0000) kn=
lGS:0000000000000000
> [  257.792431] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [  257.792456] CR2: 000055cdc7a88670 CR3: 0000000155c0a000 CR4: 0000000=
0001006e0
> [  257.792485] Call Trace:
> [  257.792511]  <TASK>
> [  257.792535]  ? _raw_spin_lock_irqsave+0x23/0x50
> [  257.792579]  ? preempt_count_add+0x62/0xa0
> [  257.792625]  __schedule+0xac/0x9d0
> [  257.792663]  ? _raw_spin_unlock_irqrestore+0x23/0x40
> [  257.792700]  ? __mod_timer+0x28a/0x3c0
> [  257.792743]  schedule+0x5d/0xe0
> [  257.792775]  schedule_timeout+0x8a/0x160
> [  257.792812]  ? __bpf_trace_tick_stop+0x10/0x10
> [  257.792849]  msleep+0x29/0x40
> [  257.792885]  acpi_lpss_resume+0x6e/0x160
> [  257.792924]  ? acpi_lpss_resume+0x160/0x160
> [  257.792958]  acpi_lpss_runtime_resume+0xe/0x20
> [  257.792993]  __rpm_callback+0x44/0x170
> [  257.793029]  ? acpi_lpss_resume+0x160/0x160
> [  257.793065]  rpm_callback+0x59/0x70
> [  257.793100]  ? acpi_lpss_resume+0x160/0x160
> [  257.793135]  rpm_resume+0x5f8/0x850
> [  257.793168]  ? acpi_ut_update_ref_count.part.0+0x7a/0x8f0
> [  257.793215]  __pm_runtime_resume+0x3c/0x60
> [  257.793251]  i2c_dw_xfer+0x47/0x490
> [  257.793291]  __i2c_transfer+0x16e/0x6c0
> [  257.793335]  i2c_smbus_xfer_emulated+0x26f/0x9c0
> [  257.793375]  ? __switch_to+0x7e/0x420
> [  257.793410]  ? update_load_avg+0x80/0x790
> [  257.793447]  __i2c_smbus_xfer+0xab/0x410
> [  257.793477]  ? enqueue_entity+0x19a/0x4f0
> [  257.793514]  i2c_smbus_xfer+0x6a/0xe0
> [  257.793547]  i2c_smbus_read_byte_data+0x45/0x70
> [  257.793578]  ? _raw_spin_unlock_irqrestore+0x23/0x40
> [  257.793615]  ? try_to_wake_up+0x95/0x590
> [  257.793653]  cht_wc_byte_reg_read+0x2e/0x60
> [  257.793701]  _regmap_read+0x5a/0x110
> [  257.793737]  _regmap_update_bits+0xb4/0xf0
> [  257.793775]  regmap_update_bits_base+0x59/0x80
> [  257.793816]  cht_wc_leds_set_effect+0xcb/0x1b0 [leds_cht_wcove]
> [  257.793875]  led_blink_setup+0x25/0x100
> [  257.793912]  led_trigger_blink+0x45/0x70
> [  257.793947]  power_supply_update_leds+0x1d6/0x1e0
> [  257.793991]  power_supply_changed_work+0x6f/0xf0
> [  257.794029]  process_one_work+0x1c7/0x3c0
> [  257.794065]  worker_thread+0x4e/0x3a0
> [  257.794095]  ? _raw_spin_lock_irqsave+0x23/0x50
> [  257.794133]  ? rescuer_thread+0x3b0/0x3b0
> [  257.794161]  kthread+0xe9/0x110
> [  257.794195]  ? kthread_complete_and_exit+0x20/0x20
> [  257.794233]  ret_from_fork+0x1f/0x30
> [  257.794280]  </TASK>
> [  257.794298] ---[ end trace 0000000000000000 ]---
> [  257.854563] bq25890-charger i2c-bq25892: S:CHG/PG/VSYS=3D2/1/0, F:CH=
G/BOOST/BAT/NTC=3D0/0/0/0
>=20

