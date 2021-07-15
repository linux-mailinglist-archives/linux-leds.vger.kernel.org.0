Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D414C3CAE6D
	for <lists+linux-leds@lfdr.de>; Thu, 15 Jul 2021 23:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbhGOVWP (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 15 Jul 2021 17:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbhGOVWP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 15 Jul 2021 17:22:15 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703ADC06175F
        for <linux-leds@vger.kernel.org>; Thu, 15 Jul 2021 14:19:21 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id o4so3220216pgs.6
        for <linux-leds@vger.kernel.org>; Thu, 15 Jul 2021 14:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=student-cerritos-edu.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D0OhYkjJX+icCnS8y/R2T1NSb2j9lN0NsqfakqZJQhc=;
        b=U8Q50/trE+Q5ldn76TBWjJHBB5CMYImyxa0DoddZjUVD0BAf28Zr7M9G8xI0RnjJM9
         wlWpEHNQkx5dtU3ZKEmqeC94uOTYsgsZUs/uprBrvQ6Rh2twSrXlXxLSbo/FOy/BDLKE
         Ogvp04Xb5+s0dT2xXO765Jjxu3if+VY3v7I77yHHgLz0YOa+jhOOfUsMz5bncGAvHcQR
         dVBbswCgOkz0GqVfofhjCM6cfn5BOx6AhOwEMGpThIAZyklSg3Oe43BAT60cU6BdMk8h
         jamIEmiXx0ZjECnbFLmBV9WmPkIRQ+Mem4zU/BHGN2bhR4F6QnIFq5Gh4zFn9Tm0gX8I
         vsnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=D0OhYkjJX+icCnS8y/R2T1NSb2j9lN0NsqfakqZJQhc=;
        b=UEmW9TUomEdy/lYXevu2aACqU3kDXPWCWocZ87sYijZqO/E4oofHYiI/g7Qllno13K
         PeqCtinCfGxCoOF0jOKQKJ1cOFWIw0B1qsaTK7mdtiRxt6TlxhH8CvRXU21HpRSAcgvc
         2DAOl5Eoe31EaAWiJIYoYrWmuyMtnVWa0fGe8gtksYj3mC+x96uiLSdB4i/Sskm1Qa1c
         aL3ZBER84AQcxtqc9FCEKizFtUq1b9eISszkc+hfw+jCsSItkVJ9SMqFLoLY1PQJdb2L
         25jZTg7iAbFmazM/jPPPxd92Hi8OzTvreE4SgHfMdoa8iQD6iHv21dlByHqJlbT0WC2Y
         zgcg==
X-Gm-Message-State: AOAM5330t1LiL5e0LvFW3hwIkrsy49KU6gc7lJXo3h86DQk3C3uadN7A
        0z5Omkpag7ZukFCnJPYgWzVN0x6FFO30Rw==
X-Google-Smtp-Source: ABdhPJxX+wsrbSEY7lxOPuDSESPjKjsqxnhONORWQQY6K55aaa3aWQLY9IN7KwfoYh523KsHbYt+9g==
X-Received: by 2002:a65:6555:: with SMTP id a21mr6512902pgw.53.1626383960970;
        Thu, 15 Jul 2021 14:19:20 -0700 (PDT)
Received: from fedora.. (066-215-081-126.biz.spectrum.com. [66.215.81.126])
        by smtp.gmail.com with ESMTPSA id gb10sm9811371pjb.43.2021.07.15.14.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jul 2021 14:19:20 -0700 (PDT)
From:   Amy Parker <apark0006@student.cerritos.edu>
To:     pavel@ucw.cz
Cc:     Amy Parker <apark0006@student.cerritos.edu>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] leds: change led_brightness definition from enum to typedef
Date:   Thu, 15 Jul 2021 14:18:55 -0700
Message-Id: <cover.1626383424.git.apark0006@student.cerritos.edu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patch series solves the TODO listed in drivers/leds, and changes
the implementation of led_brightness from an enum to a combined typedef
of a u8 and set of macro definitions as suggested in the TODO.

Signed-off-by: Amy Parker <apark0006@student.cerritos.edu>

Amy Parker (2):
  swap led_brightness from enum to typedef
  drivers/leds/TODO: update TODO to reflect changes

 Documentation/leds/leds-class-flash.rst       |  2 +-
 arch/arm/mach-davinci/board-dm365-evm.c       |  4 +--
 arch/arm/mach-footbridge/ebsa285.c            |  4 +--
 arch/arm/mach-footbridge/netwinder-hw.c       |  4 +--
 arch/arm/mach-pxa/idp.c                       |  4 +--
 arch/arm/mach-pxa/lubbock.c                   |  4 +--
 arch/arm/mach-pxa/mainstone.c                 |  4 +--
 arch/arm/plat-omap/debug-leds.c               |  4 +--
 arch/mips/alchemy/devboards/db1000.c          |  4 +--
 arch/mips/alchemy/devboards/db1200.c          |  4 +--
 arch/mips/alchemy/devboards/db1300.c          |  4 +--
 arch/mips/txx9/rbtx4939/setup.c               |  2 +-
 arch/x86/platform/ts5500/ts5500.c             |  4 +--
 drivers/gpu/drm/nouveau/nouveau_led.c         |  4 +--
 drivers/hid/hid-asus.c                        |  4 +--
 drivers/hid/hid-bigbenff.c                    |  4 +--
 drivers/hid/hid-corsair.c                     |  6 ++--
 drivers/hid/hid-elan.c                        |  2 +-
 drivers/hid/hid-google-hammer.c               |  2 +-
 drivers/hid/hid-gt683r.c                      |  4 +--
 drivers/hid/hid-led.c                         | 20 ++++++------
 drivers/hid/hid-lenovo.c                      |  4 +--
 drivers/hid/hid-lg-g15.c                      | 24 +++++++-------
 drivers/hid/hid-lg4ff.c                       |  4 +--
 drivers/hid/hid-picolcd_leds.c                |  4 +--
 drivers/hid/hid-sony.c                        |  4 +--
 drivers/hid/hid-steelseries.c                 |  8 ++---
 drivers/hid/hid-u2fzero.c                     |  2 +-
 drivers/hid/hid-wiimote-modules.c             |  4 +--
 drivers/hid/wacom.h                           |  2 +-
 drivers/hid/wacom_sys.c                       |  8 ++---
 drivers/hwmon/applesmc.c                      |  2 +-
 drivers/hwmon/pmbus/ibm-cffps.c               |  2 +-
 drivers/input/input-leds.c                    |  4 +--
 drivers/input/joystick/xpad.c                 |  2 +-
 drivers/input/keyboard/applespi.c             |  2 +-
 drivers/input/keyboard/cap11xx.c              |  2 +-
 drivers/input/keyboard/lm8323.c               |  2 +-
 drivers/input/keyboard/qt2160.c               |  4 +--
 drivers/input/keyboard/tm2-touchkey.c         |  2 +-
 drivers/input/misc/apanel.c                   |  2 +-
 drivers/input/misc/ims-pcu.c                  |  4 +--
 drivers/input/misc/wistron_btns.c             |  4 +--
 drivers/input/touchscreen/stmfts.c            |  4 +--
 drivers/leds/TODO                             |  4 ---
 drivers/leds/blink/leds-lgm-sso.c             |  6 ++--
 drivers/leds/flash/leds-rt4505.c              |  4 +--
 drivers/leds/flash/leds-rt8515.c              |  2 +-
 drivers/leds/led-class-multicolor.c           |  2 +-
 drivers/leds/led-triggers.c                   |  2 +-
 drivers/leds/leds-88pm860x.c                  |  2 +-
 drivers/leds/leds-aat1290.c                   |  8 ++---
 drivers/leds/leds-acer-a500.c                 |  2 +-
 drivers/leds/leds-adp5520.c                   |  2 +-
 drivers/leds/leds-an30259a.c                  |  2 +-
 drivers/leds/leds-apu.c                       |  4 +--
 drivers/leds/leds-ariel.c                     |  4 +--
 drivers/leds/leds-as3645a.c                   |  4 +--
 drivers/leds/leds-asic3.c                     |  2 +-
 drivers/leds/leds-aw2013.c                    |  2 +-
 drivers/leds/leds-bcm6328.c                   |  2 +-
 drivers/leds/leds-bcm6358.c                   |  2 +-
 drivers/leds/leds-bd2802.c                    |  2 +-
 drivers/leds/leds-blinkm.c                    |  8 ++---
 drivers/leds/leds-clevo-mail.c                |  2 +-
 drivers/leds/leds-cobalt-qube.c               |  2 +-
 drivers/leds/leds-cobalt-raq.c                |  4 +--
 drivers/leds/leds-cpcap.c                     |  2 +-
 drivers/leds/leds-cr0014114.c                 |  2 +-
 drivers/leds/leds-da903x.c                    |  2 +-
 drivers/leds/leds-da9052.c                    |  4 +--
 drivers/leds/leds-dac124s085.c                |  2 +-
 drivers/leds/leds-el15203000.c                |  2 +-
 drivers/leds/leds-fsg.c                       | 12 +++----
 drivers/leds/leds-gpio.c                      |  4 +--
 drivers/leds/leds-hp6xx.c                     |  4 +--
 drivers/leds/leds-ip30.c                      |  2 +-
 drivers/leds/leds-ipaq-micro.c                |  2 +-
 drivers/leds/leds-is31fl319x.c                |  2 +-
 drivers/leds/leds-is31fl32xx.c                |  2 +-
 drivers/leds/leds-ktd2692.c                   |  6 ++--
 drivers/leds/leds-lm3530.c                    |  4 +--
 drivers/leds/leds-lm3532.c                    |  2 +-
 drivers/leds/leds-lm3533.c                    |  4 +--
 drivers/leds/leds-lm355x.c                    |  6 ++--
 drivers/leds/leds-lm3601x.c                   |  2 +-
 drivers/leds/leds-lm36274.c                   |  2 +-
 drivers/leds/leds-lm3642.c                    |  6 ++--
 drivers/leds/leds-lm3692x.c                   |  4 +--
 drivers/leds/leds-lm3697.c                    |  2 +-
 drivers/leds/leds-locomo.c                    |  6 ++--
 drivers/leds/leds-lp3944.c                    |  4 +--
 drivers/leds/leds-lp3952.c                    |  2 +-
 drivers/leds/leds-lp50xx.c                    |  2 +-
 drivers/leds/leds-lp55xx-common.c             |  4 +--
 drivers/leds/leds-lp8788.c                    |  2 +-
 drivers/leds/leds-lp8860.c                    |  2 +-
 drivers/leds/leds-lt3593.c                    |  2 +-
 drivers/leds/leds-max77650.c                  |  2 +-
 drivers/leds/leds-max77693.c                  |  2 +-
 drivers/leds/leds-max8997.c                   |  4 +--
 drivers/leds/leds-mc13783.c                   |  2 +-
 drivers/leds/leds-menf21bmc.c                 |  2 +-
 drivers/leds/leds-mlxcpld.c                   |  4 +--
 drivers/leds/leds-mlxreg.c                    |  8 ++---
 drivers/leds/leds-mt6323.c                    | 10 +++---
 drivers/leds/leds-net48xx.c                   |  2 +-
 drivers/leds/leds-netxbig.c                   |  2 +-
 drivers/leds/leds-nic78bx.c                   |  4 +--
 drivers/leds/leds-ns2.c                       |  4 +--
 drivers/leds/leds-ot200.c                     |  2 +-
 drivers/leds/leds-pca9532.c                   |  4 +--
 drivers/leds/leds-pca955x.c                   |  2 +-
 drivers/leds/leds-pca963x.c                   |  4 +--
 drivers/leds/leds-pm8058.c                    |  6 ++--
 drivers/leds/leds-powernv.c                   |  8 ++---
 drivers/leds/leds-pwm.c                       |  2 +-
 drivers/leds/leds-rb532.c                     |  4 +--
 drivers/leds/leds-regulator.c                 |  4 +--
 drivers/leds/leds-s3c24xx.c                   |  2 +-
 drivers/leds/leds-sc27xx-bltc.c               |  4 +--
 drivers/leds/leds-sgm3140.c                   |  2 +-
 drivers/leds/leds-spi-byte.c                  |  2 +-
 drivers/leds/leds-ss4200.c                    |  2 +-
 drivers/leds/leds-sunfire.c                   | 18 +++++------
 drivers/leds/leds-syscon.c                    |  2 +-
 drivers/leds/leds-tca6507.c                   |  2 +-
 drivers/leds/leds-tlc591xx.c                  |  2 +-
 drivers/leds/leds-tps6105x.c                  |  2 +-
 drivers/leds/leds-turris-omnia.c              |  2 +-
 drivers/leds/leds-wm831x-status.c             |  4 +--
 drivers/leds/leds-wm8350.c                    |  2 +-
 drivers/leds/leds-wrap.c                      |  6 ++--
 drivers/leds/trigger/ledtrig-audio.c          |  6 ++--
 drivers/leds/trigger/ledtrig-camera.c         |  4 +--
 drivers/leds/uleds.c                          |  2 +-
 drivers/macintosh/via-pmu-led.c               |  2 +-
 drivers/media/radio/radio-shark.c             |  6 ++--
 drivers/media/radio/radio-shark2.c            |  4 +--
 drivers/media/rc/redrat3.c                    |  2 +-
 drivers/media/rc/ttusbir.c                    |  4 +--
 drivers/media/rc/winbond-cir.c                |  4 +--
 .../media/v4l2-core/v4l2-flash-led-class.c    |  6 ++--
 drivers/mmc/host/rtsx_usb_sdmmc.c             |  2 +-
 drivers/mmc/host/sdhci.c                      |  2 +-
 drivers/net/arcnet/com20020-pci.c             |  4 +--
 drivers/net/dsa/hirschmann/hellcreek_ptp.c    | 12 +++----
 drivers/net/wireless/ath/ath5k/led.c          |  2 +-
 drivers/net/wireless/ath/ath9k/gpio.c         |  2 +-
 drivers/net/wireless/ath/ath9k/htc.h          |  2 +-
 drivers/net/wireless/ath/ath9k/htc_drv_gpio.c |  2 +-
 drivers/net/wireless/ath/carl9170/led.c       |  2 +-
 drivers/net/wireless/broadcom/b43/leds.c      |  2 +-
 .../net/wireless/broadcom/b43legacy/leds.c    |  2 +-
 .../broadcom/brcm80211/brcmsmac/led.c         |  2 +-
 drivers/net/wireless/intel/iwlegacy/common.c  |  2 +-
 drivers/net/wireless/intel/iwlwifi/dvm/led.c  |  2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/led.c  |  2 +-
 drivers/net/wireless/intersil/p54/led.c       |  2 +-
 .../net/wireless/mediatek/mt76/mt7603/init.c  |  2 +-
 .../wireless/mediatek/mt76/mt7615/pci_init.c  |  2 +-
 .../net/wireless/mediatek/mt76/mt76x02_util.c |  2 +-
 .../net/wireless/ralink/rt2x00/rt2400pci.c    |  2 +-
 .../net/wireless/ralink/rt2x00/rt2500pci.c    |  2 +-
 .../net/wireless/ralink/rt2x00/rt2500usb.c    |  2 +-
 .../net/wireless/ralink/rt2x00/rt2800lib.c    |  2 +-
 drivers/net/wireless/ralink/rt2x00/rt61pci.c  |  2 +-
 drivers/net/wireless/ralink/rt2x00/rt73usb.c  |  2 +-
 .../wireless/realtek/rtl818x/rtl8187/leds.c   |  2 +-
 .../platform/chrome/cros_kbd_led_backlight.c  |  4 +--
 .../platform/chrome/wilco_ec/keyboard_leds.c  |  4 +--
 drivers/platform/x86/acer-wmi.c               |  2 +-
 drivers/platform/x86/asus-laptop.c            |  8 ++---
 drivers/platform/x86/asus-wireless.c          |  4 +--
 drivers/platform/x86/asus-wmi.c               | 18 +++++------
 drivers/platform/x86/dell/alienware-wmi.c     |  4 +--
 drivers/platform/x86/dell/dell-laptop.c       | 16 +++++-----
 drivers/platform/x86/dell/dell-wmi-led.c      |  2 +-
 drivers/platform/x86/dell/dell-wmi-privacy.c  |  2 +-
 drivers/platform/x86/eeepc-laptop.c           |  4 +--
 drivers/platform/x86/fujitsu-laptop.c         | 22 ++++++-------
 drivers/platform/x86/hp_accel.c               |  8 ++---
 drivers/platform/x86/huawei-wmi.c             |  2 +-
 drivers/platform/x86/ideapad-laptop.c         |  4 +--
 drivers/platform/x86/lg-laptop.c              |  8 ++---
 drivers/platform/x86/samsung-laptop.c         |  4 +--
 drivers/platform/x86/system76_acpi.c          | 16 +++++-----
 drivers/platform/x86/thinkpad_acpi.c          | 20 ++++++------
 drivers/platform/x86/topstar-laptop.c         |  4 +--
 drivers/platform/x86/toshiba_acpi.c           | 12 +++----
 drivers/staging/greybus/light.c               |  4 +--
 drivers/staging/nvec/nvec_paz00.c             |  2 +-
 drivers/video/backlight/adp8860_bl.c          |  4 +--
 drivers/video/backlight/adp8870_bl.c          |  4 +--
 drivers/video/backlight/lm3639_bl.c           |  4 +--
 include/linux/led-class-multicolor.h          |  4 +--
 include/linux/leds-regulator.h                |  2 +-
 include/linux/leds.h                          | 31 +++++++++----------
 include/linux/mfd/wm8350/pmic.h               |  2 +-
 include/media/v4l2-flash-led-class.h          |  6 ++--
 net/rfkill/core.c                             |  2 +-
 sound/pci/hda/hda_generic.c                   |  6 ++--
 sound/pci/hda/hda_generic.h                   |  4 +--
 sound/pci/hda/patch_conexant.c                |  6 ++--
 sound/pci/hda/patch_realtek.c                 | 12 +++----
 sound/pci/hda/patch_sigmatel.c                |  4 +--
 sound/usb/line6/toneport.c                    |  2 +-
 207 files changed, 436 insertions(+), 441 deletions(-)

-- 
2.31.1

