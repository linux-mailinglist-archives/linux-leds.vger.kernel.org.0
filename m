Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77384297FAA
	for <lists+linux-leds@lfdr.de>; Sun, 25 Oct 2020 02:59:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1765964AbgJYA7e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sat, 24 Oct 2020 20:59:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1765967AbgJYA7e (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 24 Oct 2020 20:59:34 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A925C0613D2
        for <linux-leds@vger.kernel.org>; Sat, 24 Oct 2020 17:59:33 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id l16so5689192eds.3
        for <linux-leds@vger.kernel.org>; Sat, 24 Oct 2020 17:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rRFExTA2lhZm31X7K2KDAHg/6waCL2I0kQolJrIPLTE=;
        b=luZcn9KJFwKIe4SO62Ve9E1pYoooPVvLTgOLPtA+qfsvMA8vKZsMg+Gm2V506j0KKA
         6UZGH4fj1xh++2DN7JUZBlCrdImTGkR3mvd3JvweRPclMxQT/cyf1Wssmf3UMEiwFUMk
         lSka1LCv+6L0D5gF6lYTEkwBm+hVrYyPNZaQSylBkWKAfn9c6RkeE8mfPnx4b8RwMLcQ
         hqwtq7F8FTaeYEXsby4JbU1Jz8iZ/iNRlaE9VNWdDRvwKQ8foV2h+AlCTO8HYpRHShzo
         lexrwlDqGxb8QhVWOoJBndQEwc/13aj7ZCY3DhKFXzt+ZI7gHW3dEZUlbrCV++C3I/So
         0HJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rRFExTA2lhZm31X7K2KDAHg/6waCL2I0kQolJrIPLTE=;
        b=cBm1cooyGqnBWxhpEdhDWCR4bxqtLD68ItUcLx7CkqI+WV53GKKnKHnYTvazSz/dN8
         zm166m0l0O8P8tcNs6u/qY06d4IAfAnuV4fehBAyYbYSNKg4tHsF6zhJrT94gcE8EqmI
         F8Gxp4FxhVmKMXwSL4I6MizCxD8xBS3OzDxk4YLnHYe9DX8PpAtBiWXGMKdq7pC9a/CD
         5WcwVCspbfzSe0fJaepios1V/3lqd3yyh+KGxvf2lN8IYVhrjyLv2Zkn5RZbzMO+5rnC
         ZwD/eAQTlrkrCEhAZ2oGC2qO4UHilNpKZ6dLdvDqYA9qMl55WtFJiNwvIsmJZe/9S9Co
         956Q==
X-Gm-Message-State: AOAM5321SSdyfR4dvOacH3oFr19yAYCFP5La7vOGAGGF/VfDqPVkeGn1
        C0X/FbeU3WkGoMgAh3BWc3kOQg==
X-Google-Smtp-Source: ABdhPJyEv+Q9lwjmpx5uc6jg0zTl7PQSZ+FHXi5ctdK+/9JTfg/0FEcq2K5ls9EFa6L9ctltRcllEw==
X-Received: by 2002:a50:8c24:: with SMTP id p33mr9374112edp.330.1603587570568;
        Sat, 24 Oct 2020 17:59:30 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id q5sm2797274edt.79.2020.10.24.17.59.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2020 17:59:29 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        andy.shevchenko@gmail.com, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v7 0/6] Add support for the IEI WT61P803 PUZZLE MCU
Date:   Sun, 25 Oct 2020 02:59:10 +0200
Message-Id: <20201025005916.64747-1-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This patchset adds support for the IEI WT61P803 PUZZLE microcontroller,
which enables some board specific features like fan and LED control,
system power management and temperature sensor reading on some IEI
Puzzle series boards.

The first board to use this functionality is IEI Puzzle-M801 1U
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
   - Sync dt-bindings examples with the IEI Puzzle-M801 board dts
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
   - Break up the patchset and send the IEI Puzzle-M801 board support
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
   - Add Luka Perkov to MAINTAINERS
Changes for v6:
   - Use the container_of() macro to get the led_cdev parent struct
   - Use %u instead of %lu in a printf() (LED driver)
Changes for v7:
   - Use the correct vendor title (IEI instead of iEi)
   - Add missing properties to dt-bindings and fix styling issues
   - Styling changes in the IEI WT61P803 PUZZLE HWMON driver
   - Add missing commas in array definitions
   - Check reply_size, where possible
   - Clean up kernel-doc comments

Luka Kovacic (6):
  dt-bindings: Add IEI vendor prefix and IEI WT61P803 PUZZLE driver
    bindings
  drivers: mfd: Add a driver for IEI WT61P803 PUZZLE MCU
  drivers: hwmon: Add the IEI WT61P803 PUZZLE HWMON driver
  drivers: leds: Add the IEI WT61P803 PUZZLE LED driver
  Documentation/ABI: Add iei-wt61p803-puzzle driver sysfs interface
    documentation
  MAINTAINERS: Add an entry for the IEI WT61P803 PUZZLE driver

 .../testing/sysfs-driver-iei-wt61p803-puzzle  |   55 +
 .../hwmon/iei,wt61p803-puzzle-hwmon.yaml      |   53 +
 .../leds/iei,wt61p803-puzzle-leds.yaml        |   45 +
 .../bindings/mfd/iei,wt61p803-puzzle.yaml     |   83 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +
 MAINTAINERS                                   |   14 +
 drivers/hwmon/Kconfig                         |    8 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c     |  412 +++++++
 drivers/leds/Kconfig                          |    8 +
 drivers/leds/Makefile                         |    1 +
 drivers/leds/leds-iei-wt61p803-puzzle.c       |  161 +++
 drivers/mfd/Kconfig                           |    8 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/iei-wt61p803-puzzle.c             | 1039 +++++++++++++++++
 include/linux/mfd/iei-wt61p803-puzzle.h       |   66 ++
 16 files changed, 1957 insertions(+)
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

