Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6393925E7AC
	for <lists+linux-leds@lfdr.de>; Sat,  5 Sep 2020 15:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgIENFg (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 5 Sep 2020 09:05:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726261AbgIENFf (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 5 Sep 2020 09:05:35 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2800C061244
        for <linux-leds@vger.kernel.org>; Sat,  5 Sep 2020 06:05:33 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id gr14so10964366ejb.1
        for <linux-leds@vger.kernel.org>; Sat, 05 Sep 2020 06:05:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pjbRvbzQYX8+5j4uAJTuhnE/qBNrVlyoM0TpetFlM1Q=;
        b=d+/NisIVaIakFDZSkmgTgQ7Wh5nZKj7D93Q+ZZ0KED00elEpXzdO1HV/JGcHPsoECW
         CGCONpf/by9+sal0O40iUyZi2yM5dVCDadPPcTMNhOSF82VMjbUBMqj8jkARyDZYxgj2
         Z4K1fRLcVtV0+c7k0ZVuHHUjLOtNrnCJLGx7lyQExE2zs14P2MpFOSKxcrzLEOZ4y51l
         ebljnHVjHeDqe0Es2Q4FWnb87bdcZwhaMZ0d7N1DjTGuY4NiLhdgHaNiAJF2Hmf1KlN9
         NdN4wBGOS5uQgk2AuI39aVXigCLjlDyRkSBD99x8oWKuAglZZhwZ9z7Y82zRFOIlzsRh
         0NHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pjbRvbzQYX8+5j4uAJTuhnE/qBNrVlyoM0TpetFlM1Q=;
        b=JDGRYKxtMK+iG+edT+c86pz/rkfL52UetYQfDE2cQ0JYPLjESHgGnmkHZGiMIHxhps
         i+KZ33zkHkz5N9tSDVmfRZjDwhK9QdvjHmh9cuM/NMSmfoSPjXTGpVGhihjFmeiwHOGZ
         cWm7LNtpDrXLWsvC8gQL7WNhGAOh1n0y0nfcsx/2pBfX5ar3pMdDXWg6ycN3L3NTKR9O
         gDIGpwK3iqzvTomsdlFGdDJimeRONOHDTVDJiI0ThkojRtmwvu/S59wflZAMult595Hj
         Ag5r0lOHAXmFDv/JXFaFzZ39mW5QbKnVgjuUByXkEm6gue3VBHnXu+usieVynkhWjmkm
         LqWg==
X-Gm-Message-State: AOAM530euC71ZYPYFqNAX8o6FDeTU9Qr8w6C520ByvFGb0FFVke4UuVX
        PQwZyh6w6JhkCjNNh8bPGEqxhAw8dN5dDvuL
X-Google-Smtp-Source: ABdhPJw4qncjAf7blDg/PkStkUNmbheZclSDB3J/kfBUdRf5F8d3FOMK9ZcAdfbpLaq8vm8hDfEx0g==
X-Received: by 2002:a17:906:cb98:: with SMTP id mf24mr12916030ejb.90.1599311132444;
        Sat, 05 Sep 2020 06:05:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3002:290:faff:fe54:449c])
        by smtp.gmail.com with ESMTPSA id s18sm9372655ejd.54.2020.09.05.06.05.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 06:05:31 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr, Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH 0/7] Add support for the iEi Puzzle-M801 board
Date:   Sat,  5 Sep 2020 15:03:29 +0200
Message-Id: <20200905130336.967622-1-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patchset adds support for the iEi Puzzle-M801 1U Rackmount Network
Appliance and for the iEi WT61P803 PUZZLE microcontroller, which enables
some board specific features like fan and LED control, system power
management and temperature sensor reading.

The platform is based on the popular Marvell Armada 8040 SoC and supports
up to 16 GB of DDR4 2400 MHz ECC RAM.
It has a PCIe x16 slot (x2 lanes only) and an M.2 type B slot.

External chassis ports:
2x 10 GbE SFP+
4x 1 GbE (Marvell 88E1512P)
2x USB 3.0
1x RJ45 serial port

All notable board components are supported in this patchset.

Luka Kovacic (7):
  dt-bindings: Add iEi vendor prefix and iEi WT61P803 PUZZLE driver
    bindings
  drivers: mfd: Add a driver for iEi WT61P803 PUZZLE MCU
  drivers: hwmon: Add the iEi WT61P803 PUZZLE HWMON driver
  drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
  Documentation/ABI: Add iei-wt61p803-puzzle driver sysfs interface
    documentation
  MAINTAINERS: Add an entry for the iEi WT61P803 PUZZLE driver
  arm64: dts: marvell: Add a device tree for the iEi Puzzle-M801 board

 .../stable/sysfs-driver-iei-wt61p803-puzzle   |   65 +
 .../hwmon/iei,wt61p803-puzzle-hwmon.yaml      |   41 +
 .../leds/iei,wt61p803-puzzle-leds.yaml        |   48 +
 .../bindings/mfd/iei,wt61p803-puzzle.yaml     |   82 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |   13 +
 arch/arm64/boot/dts/marvell/Makefile          |    1 +
 .../dts/marvell/armada-8040-puzzle-m801.dts   |  519 +++++++
 drivers/hwmon/Kconfig                         |    8 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c     |  613 ++++++++
 drivers/leds/Kconfig                          |    8 +
 drivers/leds/Makefile                         |    1 +
 drivers/leds/leds-iei-wt61p803-puzzle.c       |  184 +++
 drivers/mfd/Kconfig                           |    8 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/iei-wt61p803-puzzle.c             | 1242 +++++++++++++++++
 include/linux/mfd/iei-wt61p803-puzzle.h       |   27 +
 18 files changed, 2864 insertions(+)
 create mode 100644 Documentation/ABI/stable/sysfs-driver-iei-wt61p803-puzzle
 create mode 100644 Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
 create mode 100644 arch/arm64/boot/dts/marvell/armada-8040-puzzle-m801.dts
 create mode 100644 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
 create mode 100644 drivers/leds/leds-iei-wt61p803-puzzle.c
 create mode 100644 drivers/mfd/iei-wt61p803-puzzle.c
 create mode 100644 include/linux/mfd/iei-wt61p803-puzzle.h

-- 
2.20.1

