Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8938916A97
	for <lists+linux-leds@lfdr.de>; Tue,  7 May 2019 20:42:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727419AbfEGSme (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 May 2019 14:42:34 -0400
Received: from mail-lf1-f68.google.com ([209.85.167.68]:39063 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727425AbfEGSme (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 May 2019 14:42:34 -0400
Received: by mail-lf1-f68.google.com with SMTP id z124so6470675lfd.6;
        Tue, 07 May 2019 11:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=l+0Pt9QcE8cQteNSHBBiNf32UMkhjCszFRdNxebMlOc=;
        b=nlkziPOHnatMrgjcwWMr2S1NWq3IRuFWTxzD+xZCyXnNguFCXY4vtTyuFKASElRNY6
         U/t2q1ENiF9ADOVYGonQP5Dq20SDYOG34D0R+793XiQtoDslO3LajsPwj1MIX4AaRkja
         yY2Qqvu6ueUu/TxOPioandCy1hH+0ZRctylQncwMBoIs41uHVrIdTW+3ox9/WaTaDUKq
         7N5laNr59vmyd139E4JnxNQAdJ36y6T+n5pHOi6ax5SatGvxPQau7lQaKNj1I2WPaEZe
         IuOzA9fK+5DWwixuSWnW91eLEp2A8TCd0O7jJsu3VQGPjpbDNIzmayhoI9TV4fN+9+dr
         p2gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=l+0Pt9QcE8cQteNSHBBiNf32UMkhjCszFRdNxebMlOc=;
        b=Q3WE9K0Z20iCiKSi1PoszqCcTHmPfrbnfCZc5FWLhaQ7FMfyPtU3YYPqtdkPjjQoQi
         migatZ3pw6MXkBcskuQSxxE+HA/qeq1YIS1YmXI9oEgB9A4NVWCJEWRxqW8PxJ4GwRH2
         5DdTTFho2aIs/DY/DjAQGlS4quLkzG9rRFr8sFUs45riwxo3hhYKg+6S6XySCliRLC9V
         /hp1hXcesTybN/zY5lbr8iD+tZoJe7q/o0gi7DRHiikPAdduuyviOYfrpt8xlQItGFi9
         If3PZr2ANd8iUUKpnBGzk0M7BMZCkVRQvvpnyPllaAtiV18sHBPAd73osZBB3ccztrud
         sIvQ==
X-Gm-Message-State: APjAAAWJsoDFJXOmmG99+VuvX1aodeIxDwca8WltkRRnFmN4XdjWmDc0
        KRCK3mAoY6KbILg/JZdSxPk=
X-Google-Smtp-Source: APXvYqxR79+zmld/+zt66xNJYQ+2Y/sOgCEBJi2Iz0RT9F8XqCw12yCbzsgv/6Y+x6z9j5eEtdn8BQ==
X-Received: by 2002:ac2:5621:: with SMTP id b1mr7465050lff.27.1557254551581;
        Tue, 07 May 2019 11:42:31 -0700 (PDT)
Received: from myhost.home (bgw158.neoplus.adsl.tpnet.pl. [83.28.86.158])
        by smtp.gmail.com with ESMTPSA id 9sm1262852ljc.93.2019.05.07.11.42.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 07 May 2019 11:42:30 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     torvalds@linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        andriy.shevchenko@linux.intel.com, colin.king@canonical.com,
        daniel@zonque.org, dmurphy@ti.com, info@metux.net,
        jacek.anaszewski@gmail.com, pavel@ucw.cz,
        sakari.ailus@linux.intel.com, yuehaibing@huawei.com
Subject: [GIT PULL] LED updates for 5.2-rc1
Date:   Tue,  7 May 2019 20:42:25 +0200
Message-Id: <20190507184225.5309-1-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Linus,

Please pull LED updates for 5.2-rc1.

At first, the things touching other subsystems:

Merge of immutable branch between LED, MFD and OMAP Device Tree:

lm3532 driver relocation from MFD to LED subsystem,
accompanied by various improvements and optimizations;
it entails also a change in omap4-droid4-xt894.dts:

	- leds: lm3532: Introduce the lm3532 LED driver
	- mfd: ti-lmu: Remove LM3532 backlight driver references
	- ARM: dts: omap4-droid4: Update backlight dt properties
	- dt: lm3532: Add lm3532 dt doc and update ti_lmu doc

LED related addition to ACPI documentation:

	- document how to refer to LEDs from remote nodes

LED related fix to ALSA line6/toneport driver:

	- avoid polluting led_* namespace

Besides that there are regular LED updates:

LED core fixes and improvements:

	- avoid races with workqueue
	- Kconfig: pedantic cleanup
	- small fixes for Flash class description

leds-lt3593:

	- remove unneeded assignment in lt3593_led_probe
	- drop pdata handling code

leds-blinkm:

	- clean up double assignment to data->i2c_addr

leds-pca955x, leds-pca963x:

	- revert ACPI support, as it turned out that there is no evidence
	  of officially registered ACPI IDs for these devices.
	- make use of device property API

leds-as3645a:

	- switch to fwnode property API


The following changes since commit 9e98c678c2d6ae3a17cb2de55d17f69dddaa231b:

  Linux 5.1-rc1 (2019-03-17 14:22:26 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds-for-5.2-rc1

for you to fetch changes up to 0db37915d912e8dc6588f25da76d3ed36718d92f:

  leds: avoid races with workqueue (2019-05-02 22:54:51 +0200)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED updates for 5.2-rc1.
----------------------------------------------------------------
Andy Shevchenko (4):
      leds: pca963x: Revert "Add ACPI support"
      leds: pca955x: Revert "Add ACPI support"
      leds: pca955x: Make use of device property API
      leds: pca963x: Make use of device property API

Colin Ian King (1):
      leds: blinkm: clean up double assignment to data->i2c_addr

Dan Murphy (5):
      leds: Small fixes for Flash class description
      dt: lm3532: Add lm3532 dt doc and update ti_lmu doc
      ARM: dts: omap4-droid4: Update backlight dt properties
      mfd: ti-lmu: Remove LM3532 backlight driver references
      leds: lm3532: Introduce the lm3532 LED driver

Daniel Mack (1):
      leds: lt3593: drop pdata handling code

Enrico Weigelt, metux IT consult (1):
      drivers: leds: Kconfig: pedantic cleanups

Jacek Anaszewski (2):
      Merge tag 'lm3532-driver-improvements' into for-next
      ALSA: line6: Avoid polluting led_* namespace

Pavel Machek (1):
      leds: avoid races with workqueue

Sakari Ailus (2):
      leds: as3645a: Switch to fwnode property API
      ACPI: Document how to refer to LEDs from remote nodes

YueHaibing (1):
      leds: lt3593: Remove unneeded assignment in lt3593_led_probe

 Documentation/acpi/dsd/leds.txt                    |  99 +++
 .../devicetree/bindings/leds/leds-lm3532.txt       | 101 +++
 Documentation/devicetree/bindings/mfd/ti-lmu.txt   |  20 -
 arch/arm/boot/dts/omap4-droid4-xt894.dts           |  27 +-
 drivers/leds/Kconfig                               |  33 +-
 drivers/leds/Makefile                              |   1 +
 drivers/leds/led-class.c                           |   1 +
 drivers/leds/led-core.c                            |   5 +
 drivers/leds/leds-as3645a.c                        |  93 +--
 drivers/leds/leds-blinkm.c                         |   1 -
 drivers/leds/leds-lm3532.c                         | 683 +++++++++++++++++++++
 drivers/leds/leds-lt3593.c                         |  64 +-
 drivers/leds/leds-pca955x.c                        |  57 +-
 drivers/leds/leds-pca963x.c                        |  66 +-
 drivers/mfd/ti-lmu.c                               |  11 -
 include/linux/mfd/ti-lmu-register.h                |  44 --
 include/linux/mfd/ti-lmu.h                         |   1 -
 sound/usb/line6/toneport.c                         |   8 +-
 18 files changed, 1023 insertions(+), 292 deletions(-)
 create mode 100644 Documentation/acpi/dsd/leds.txt
 create mode 100644 Documentation/devicetree/bindings/leds/leds-lm3532.txt
 create mode 100644 drivers/leds/leds-lm3532.c
