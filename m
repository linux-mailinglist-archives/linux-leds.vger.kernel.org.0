Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEAE6376365
	for <lists+linux-leds@lfdr.de>; Fri,  7 May 2021 12:17:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235929AbhEGKSX (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 7 May 2021 06:18:23 -0400
Received: from mail-41103.protonmail.ch ([185.70.41.103]:28117 "EHLO
        mail-41103.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229812AbhEGKSW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 7 May 2021 06:18:22 -0400
Received: from mail-02.mail-europe.com (mail-0201.mail-europe.com [51.77.79.158])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits))
        (No client certificate requested)
        by mail-41103.protonmail.ch (Postfix) with ESMTPS id 4Fc5wd455Kz4x2wq
        for <linux-leds@vger.kernel.org>; Fri,  7 May 2021 10:17:21 +0000 (UTC)
Authentication-Results: mail-41103.protonmail.ch;
        dkim=pass (1024-bit key) header.d=protonmail.com header.i=@protonmail.com header.b="D00nyvF6"
Date:   Fri, 07 May 2021 10:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1620382636;
        bh=g85Ew8Tb/6FsZ0QOeoCjVklxgjsla32xguQNz8Jl6Y0=;
        h=Date:To:From:Reply-To:Subject:From;
        b=D00nyvF6+FDGM7maN7C/tRF0mo+TulnTu75yuaJNPZsUbd/RQNnI4ml7s174UPnMT
         hZLRCPXIuIzB4ED+G862JnsiIAdb4w5FelM/cxn14hIUJAn5gElRqKMq0/UVWFL+wh
         49KLCM+G8IM6do299acAZdIg5JfKpIPn6ZIEO+mE=
To:     "linux-leds@vger.kernel.org" <linux-leds@vger.kernel.org>,
        "p.meerwald@bct-electronic.com" <p.meerwald@bct-electronic.com>
From:   pgeiem <pgeiem@protonmail.com>
Reply-To: pgeiem <pgeiem@protonmail.com>
Subject: [BUG] leds-pca963x : scheduling while atomic
Message-ID: <hFh8klMnKSVtC2DlYi8BTbKFyR5YoDUyC3kCzi_RkDoEN4N65TkUfs6QRbVZlZWMB2j7FxKKd88dw1096a3quleV8B_p6PK2crazdmzciOI=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

I have a PCA9633 I2C leds controller with hardware blinking enabled connect=
ed to a STM32MP1. I would like to blink one of the led connected on this co=
ntroller when the system goes in standby (backlight for the wakeup button).

I use a custom trigger which call led_trigger_blink function in pm_suspend.=
 When doing this I get a BUG: scheduling while atomic error message from th=
e kernel. If I replace the call to led_trigger_blink by a call to led_trigg=
er_event(trig, LED_FULL) I have no error and the led is turned ON.

The issue come from the pca963x_blink function when i2c_smbus_read_byte_dat=
a(client, PCA963X_MODE2) function is called. What is really surprising to m=
e is that i2c_smbus_read_byte_data is also called from pca963x_brightness w=
ithout issue this time.

Any idea what may cause such an error ?

Thanks in advance for your help
Patrick

[  306.029144] PM: suspend entry (deep)
[  306.034650] Filesystems sync: 0.001 seconds
[  306.039948] Freezing user space processes ... (elapsed 0.001 seconds) do=
ne.
[  306.048293] OOM killer disabled.
[  306.051469] Freezing remaining freezable tasks ... (elapsed 0.001 second=
s) done.
[  306.060167] printk: Suspending console(s) (use no_console_suspend to deb=
ug)
[  306.069415] BUG: scheduling while atomic: sh/104/0x00000002
[  306.069420] Modules linked in:
[  306.069445] CPU: 1 PID: 104 Comm: sh Tainted: G        W         5.10.10=
-00035-ge3756e37171c-dirty #108
[  306.069450] Hardware name: STM32 (Device Tree Support)
[  306.069490] [<c010d3a4>] (unwind_backtrace) from [<c0109d80>] (show_stac=
k+0x10/0x14)
[  306.069510] [<c0109d80>] (show_stack) from [<c0737424>] (dump_stack+0xc0=
/0xd4)
[  306.069529] [<c0737424>] (dump_stack) from [<c013e1e4>] (__schedule_bug+=
0x70/0x84)
[  306.069549] [<c013e1e4>] (__schedule_bug) from [<c073db30>] (__schedule+=
0x40c/0x51c)
[  306.069567] [<c073db30>] (__schedule) from [<c073dcd0>] (schedule+0x90/0=
x118)
[  306.069587] [<c073dcd0>] (schedule) from [<c0741ba4>] (schedule_timeout+=
0x80/0xfc)
[  306.069607] [<c0741ba4>] (schedule_timeout) from [<c073ea3c>] (wait_for_=
completion_timeout+0x8c/0x104)
[  306.069629] [<c073ea3c>] (wait_for_completion_timeout) from [<c05827b0>]=
 (stm32f7_i2c_smbus_xfer+0x1fc/0x618)
[  306.069649] [<c05827b0>] (stm32f7_i2c_smbus_xfer) from [<c057de70>] (__i=
2c_smbus_xfer+0x110/0x730)
[  306.069666] [<c057de70>] (__i2c_smbus_xfer) from [<c057e508>] (i2c_smbus=
_xfer+0x78/0x110)
[  306.069682] [<c057e508>] (i2c_smbus_xfer) from [<c057e680>] (i2c_smbus_r=
ead_byte_data+0x3c/0x6c)
[  306.069699] [<c057e680>] (i2c_smbus_read_byte_data) from [<c073acf8>] (p=
ca963x_blink_set+0x138/0x234)
[  306.069718] [<c073acf8>] (pca963x_blink_set) from [<c05ae12c>] (led_blin=
k_setup+0x2c/0xd4)
[  306.069737] [<c05ae12c>] (led_blink_setup) from [<c05af49c>] (led_trigge=
r_blink+0x40/0x5c)
[  306.069758] [<c05af49c>] (led_trigger_blink) from [<c05651a4>] (touchkey=
_suspend+0x38/0x64)
[  306.069779] [<c05651a4>] (touchkey_suspend) from [<c0479a4c>] (__device_=
suspend+0xf8/0x36c)
[  306.069798] [<c0479a4c>] (__device_suspend) from [<c047ad64>] (dpm_suspe=
nd+0x108/0x1c8)
[  306.069815] [<c047ad64>] (dpm_suspend) from [<c047b110>] (dpm_suspend_st=
art+0x64/0x6c)
[  306.069834] [<c047b110>] (dpm_suspend_start) from [<c015d8d0>] (suspend_=
devices_and_enter+0x148/0x524)
[  306.069851] [<c015d8d0>] (suspend_devices_and_enter) from [<c015deb8>] (=
pm_suspend+0x20c/0x27c)
[  306.069865] [<c015deb8>] (pm_suspend) from [<c015cbe0>] (state_store+0x6=
8/0xc8)
[  306.069882] [<c015cbe0>] (state_store) from [<c02992a4>] (kernfs_fop_wri=
te+0xf8/0x21c)
[  306.069902] [<c02992a4>] (kernfs_fop_write) from [<c020addc>] (vfs_write=
+0xec/0x44c)
[  306.069919] [<c020addc>] (vfs_write) from [<c020b284>] (ksys_write+0x60/=
0xe4)
[  306.069935] [<c020b284>] (ksys_write) from [<c0100060>] (ret_fast_syscal=
l+0x0/0x54)
[  306.069943] Exception stack(0xc26d9fa8 to 0xc26d9ff0)
[  306.069956] 9fa0:                   00000001 00000000 00000001 000db920 =
00000004 00000000
[  306.069970] 9fc0: 00000001 00000000 b6f04080 00000004 00000004 00000020 =
000d7598 000d749c
[  306.069979] 9fe0: 00000004 bed41810 b6e53087 b6dde766





