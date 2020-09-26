Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4B9A2799CD
	for <lists+linux-leds@lfdr.de>; Sat, 26 Sep 2020 15:55:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725208AbgIZNzh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 26 Sep 2020 09:55:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgIZNzh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 26 Sep 2020 09:55:37 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BAF5C0613D3
        for <linux-leds@vger.kernel.org>; Sat, 26 Sep 2020 06:55:37 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id g4so5405184edk.0
        for <linux-leds@vger.kernel.org>; Sat, 26 Sep 2020 06:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RA7LUkzddUd10nvHC0mfviDAxL46W59IEg0s0KDNnzs=;
        b=hTMQSlxvuCL0c49x8QB5ZMUNX37toENDh2UPYetCeFdxc/RzFEHzeKZgQRME5O6BpR
         +uH2UlGRxOKi5JwNmMfVokQyyuYkzNk7C+qOKYysEvLNqWN/27yNGB16l+LXyVOzOkId
         RD4hF35RI00hLNSBzeOu4cnLfsiJJm0ffkE5bH0/ykPvGvbbSCA72Eq0kV5JguHOyQTI
         5AetR0I/1/B+NQ0Lw5qntq0C8CilpfiNNz2Pmpv1UR0ZlV7wXg2Onr3d97MxJjCjJhHk
         6QPv6MAW1xbJ+utWtyoB1PT4yiNWlLj52ngC6mVU3SxFK/uT9PmfUhkgOO4GF7EcP+iQ
         ntUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RA7LUkzddUd10nvHC0mfviDAxL46W59IEg0s0KDNnzs=;
        b=o8a1zHih+NndrmgwRJlQD4iwkbonPvi0mdrOrBA1CvjwY/s3EfXWtxvAZPiYcEkfzV
         Vmm61GlbSrGotYm8kdoA5A5K7v49rKalaIJgtHQa1v83ZowiMeHQc1XNSpvlN/E/9tvv
         t9thfm4tBnWyqzWESq7bMqOiL1ugmndl9KBp5MDxehGT8wwPI3C7SJf8iIXXqDjc1WIJ
         UXUbgrjnBmGEElKGx++J+4IP4KbNTE9VOf6/BGzCwSWfe6SlrADDOVMYGvpLY5czXqIp
         CQrYGIj/XUkzSYwIUwIP/9dj3U2GFQZd2TufnMU1Qx0swOKGtoztwColnofh7vbFWPE6
         x50A==
X-Gm-Message-State: AOAM531ix/wi1mNxY5xr2QYTLRgH64UIGWNJxlndgA9HjJTkzbPnD7sb
        qKWvCAo2d57YsYWoDGBilV8phA==
X-Google-Smtp-Source: ABdhPJzKYLKSJnB3/61ROxyjU6eOetHd+J/JlS3If2tE69OqdnCx9TbEf9TRq06FrqrMo+oLxr8ivw==
X-Received: by 2002:a05:6402:5:: with SMTP id d5mr6483588edu.376.1601128535538;
        Sat, 26 Sep 2020 06:55:35 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id oq8sm4165700ejb.32.2020.09.26.06.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2020 06:55:34 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        andrew@lunn.ch, jason@lakedaemon.net, gregory.clement@bootlin.com,
        luka.perkov@sartura.hr, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v2 0/7] Add support for the iEi Puzzle-M801 board
Date:   Sat, 26 Sep 2020 15:55:07 +0200
Message-Id: <20200926135514.26189-1-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Changes for v2:
   - Use LAAs for local-mac-address and match reg values
   - Code styling changes
   - Error handling moved to the end of the function
   - Define all magic numbers in the main header file
   - Convert the driver to make it OF independent
   - Refactor hwmon to use devm_hwmon_device_register_with_info()
   - Reduce the number of mutex locks
   - Allocate memory once for the response buffer
   - Reduce managed memory allocations

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
 .../dts/marvell/armada-8040-puzzle-m801.dts   |  519 ++++++++
 drivers/hwmon/Kconfig                         |    8 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c     |  511 ++++++++
 drivers/leds/Kconfig                          |    8 +
 drivers/leds/Makefile                         |    1 +
 drivers/leds/leds-iei-wt61p803-puzzle.c       |  174 +++
 drivers/mfd/Kconfig                           |    8 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/iei-wt61p803-puzzle.c             | 1069 +++++++++++++++++
 include/linux/mfd/iei-wt61p803-puzzle.h       |   69 ++
 18 files changed, 2621 insertions(+)
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
2.26.2

