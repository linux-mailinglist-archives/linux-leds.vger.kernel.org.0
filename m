Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8827A291497
	for <lists+linux-leds@lfdr.de>; Sat, 17 Oct 2020 23:10:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438950AbgJQVKx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 17 Oct 2020 17:10:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438679AbgJQVKx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 17 Oct 2020 17:10:53 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 315D2C061755
        for <linux-leds@vger.kernel.org>; Sat, 17 Oct 2020 14:10:53 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id n18so7243965wrs.5
        for <linux-leds@vger.kernel.org>; Sat, 17 Oct 2020 14:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8KDp+nqNbVPOgp3bAV/6p8vEg+2PHJzwe6EsMolnsmw=;
        b=PJhibyXLu22Wl4/YaysOg6s/YKmPsse6dByPVIK61fX7f3tLYva+NLCOU5muhjKPB+
         bbD2g0y2a89dB2wKztHA4Al0edmOuNC9GpfVdLoTbwurf51b8OLgQRU4msb4dE+N+MnP
         vKEZsrj7fjqZ4Stkzejt7s48n7HfMJ21thZYghZeSv7OfhG++XytQlOvfpLFAV1wBy7S
         0JvcGcD8lKs+/cVhBH+zjn3SgumsjgO6cvh883GhKRngYtKS+BJbDjch/NxeV/NMxRuq
         xKbsc07HqaXqLnJmRkk0xJyIEY+AI1FbpzHlPHUVmuvqO8j34+4u3Vr6EGyfPvdsEj+U
         /NFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8KDp+nqNbVPOgp3bAV/6p8vEg+2PHJzwe6EsMolnsmw=;
        b=hmJTSNr/GjHPsKRbQU6MOuWz3oWvwwmLr8btnYSvmcIr20UUoXMMD4elo4hxMVc+KJ
         1L1Cc/x2VLdAO+INaoe9mUpHnxn7lTsKCbsgB7Bn+X7IO8bERmRFUBaK14RVuXNrPamL
         O6kknwAeyH9DPl0CzRjLc5gKWRv3NKmiRhV8SL/OVXAmiOioBy1fm/Jd2Cwz15tNL9j2
         14EoV83bn75btGk9fPb76CG9jWRMpwguphwv1gPqYz/xitW8CizuFL99A3nR3oM4N9ox
         T+uVh+bf4BFxZdfRJtR7QoH3keDXkNsB50Okvb0K1W42F+EwedQwV9N9VarG+8i7DCVf
         qfpA==
X-Gm-Message-State: AOAM531RD+mpLGvHnWWDxrQPQkb87Viha5mh/iD6dxs9GJ1X11m1v0b+
        9hCN6+whysMwLce37VLWUpTg6Q==
X-Google-Smtp-Source: ABdhPJwTMfVIiK95+XJsUP2duljYstLoVWA12P7Ye/VDHnOxuN+gdkjrv5+4cyGbf0QYAkFm5/vRxw==
X-Received: by 2002:a05:6000:104c:: with SMTP id c12mr11251268wrx.133.1602969051908;
        Sat, 17 Oct 2020 14:10:51 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id w11sm10337137wrs.26.2020.10.17.14.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2020 14:10:51 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        robert.marko@sartura.hr, Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v5 0/6] Add support for the iEi WT61P803 PUZZLE MCU
Date:   Sat, 17 Oct 2020 23:10:29 +0200
Message-Id: <20201017211035.257110-1-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patchset adds support for the iEi WT61P803 PUZZLE microcontroller,
which enables some board specific features like fan and LED control,
system power management and temperature sensor reading on some iEi
Puzzle series boards.

The first board to use this functionality is iEi Puzzle-M801 1U
Rackmount Network Appliance and is since v4 sent separately, as a
standalone patch.

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
Changes for v3:
   - Move iei-wt61p803-puzzle driver sysfs interface documentation to testing
   - Change some internal functions to static
   - Sync dt-bindings examples with the iEi Puzzle-M801 board dts
   - Remove obsolete device tree properties and correct LED functions
   - Reverse christmas tree variable declaration order, where possible
   - MAC address sysfs function rewrite
   - Fixed struct members size, where reasonable (MFD driver)
   - Add an error check for hwmon_dev
   - Use devm_led_classdev_register_ext() in the LED driver
Changes for v4:
   - Clean up sensible checks reported by checkpatch --strict
   - Document the mutex lock usage in the LED driver
   - Fix error handling and code styling issues in the HWMON driver
   - Break up the patchset and send the iEi Puzzle-M801 board support
patch separately
Changes for v5:
   - Remove the return before goto to also fwnode_handle_put(child)
when ret is 0 (LED driver)
   - Change unsigned char arrays to static where applicable
   - Fix unconventional line indentations
   - Remove unnecessary checks in the HWMON driver
   - Remove unnecessary type casts
   - Clear up command array assignments, where the command array is
modified before it is sent
   - Resolve a checksum calculation issue

Luka Kovacic (6):
  dt-bindings: Add iEi vendor prefix and iEi WT61P803 PUZZLE driver
    bindings
  drivers: mfd: Add a driver for iEi WT61P803 PUZZLE MCU
  drivers: hwmon: Add the iEi WT61P803 PUZZLE HWMON driver
  drivers: leds: Add the iEi WT61P803 PUZZLE LED driver
  Documentation/ABI: Add iei-wt61p803-puzzle driver sysfs interface
    documentation
  MAINTAINERS: Add an entry for the iEi WT61P803 PUZZLE driver

 .../testing/sysfs-driver-iei-wt61p803-puzzle  |   55 +
 .../hwmon/iei,wt61p803-puzzle-hwmon.yaml      |   41 +
 .../leds/iei,wt61p803-puzzle-leds.yaml        |   45 +
 .../bindings/mfd/iei,wt61p803-puzzle.yaml     |   82 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |   14 +
 drivers/hwmon/Kconfig                         |    8 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c     |  410 +++++++
 drivers/leds/Kconfig                          |    8 +
 drivers/leds/Makefile                         |    1 +
 drivers/leds/leds-iei-wt61p803-puzzle.c       |  147 +++
 drivers/mfd/Kconfig                           |    8 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/iei-wt61p803-puzzle.c             | 1043 +++++++++++++++++
 include/linux/mfd/iei-wt61p803-puzzle.h       |   66 ++
 16 files changed, 1932 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-iei-wt61p803-puzzle
 create mode 100644 Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
 create mode 100644 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
 create mode 100644 drivers/leds/leds-iei-wt61p803-puzzle.c
 create mode 100644 drivers/mfd/iei-wt61p803-puzzle.c
 create mode 100644 include/linux/mfd/iei-wt61p803-puzzle.h

-- 
2.26.2

