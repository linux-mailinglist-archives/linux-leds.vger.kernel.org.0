Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9FB67285585
	for <lists+linux-leds@lfdr.de>; Wed,  7 Oct 2020 02:50:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726785AbgJGAt7 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 6 Oct 2020 20:49:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgJGAt6 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Oct 2020 20:49:58 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71CE5C0613D2
        for <linux-leds@vger.kernel.org>; Tue,  6 Oct 2020 17:49:58 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id l24so357035edj.8
        for <linux-leds@vger.kernel.org>; Tue, 06 Oct 2020 17:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n01MKJ7pcB5R49YVHzoVbmQ3+llauqhHFsVp4UeOt6M=;
        b=Me9YDOViqBP/zNPc1EZsVidJxhjEs7D+f1pBs/hni9ivlrdcLYrgH9KII5c2ld/LaS
         m+qbWu70BXBOBDbTVfqCdQQOC3pHOre2UAmid9rMW2HFiCyOUADmC8Zpm4iDe8zKDIVr
         zH2MOOm8/t5R8Yp7IDbt0n6nc3GERe2VB6aUUsxKw3xGoEPlFQEBWjN+P64cxgrHjuLR
         y7oFepIhX60QJnU929nU5XmNVqqusPhRHlebW2kLiVTMPmIep1cJwnU4FdqqEKidfGQT
         jA5ANWOWv49G7FNy+6MWVciVgTJ7RT0dI/d8qFdn0yfun5mLKaO0QpPH1gtNchJTUf76
         fLWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=n01MKJ7pcB5R49YVHzoVbmQ3+llauqhHFsVp4UeOt6M=;
        b=IhXEwZes5rxOxvAbREn2el3+/uY1AczaVDtZMXwXfIkQ5Z3U4uX2/eAF6T8JiOH/fw
         bSdOW/s+B6D5W2XHvkub0dv2Oe3qm7GvdPalrRiyHNhWj0/OWs1SUdGo95UjhTO0/738
         iQE4YWerAqI69gts0XysDSwF1BWEjoiMuvtqGB3qkVPgvLLYV7k1IR9qOFombCKSRcch
         pR8J6fxYIUw/t0M+4G8kY7vbf8Fd45QAgfN39lNWXT/zOColA9axmuReFGi8Cj/fYkoG
         iwuP1DIDHEongixxdabu774/70YuK4Y+/mZMHm3NxIlpXiQd2niwnVr+xOYZnJ+xJNpt
         +t4A==
X-Gm-Message-State: AOAM531ss1Ku9NjfTXry1+LNRSpk2p9kRZgM89OoLLRxi3Q5Jwuv/yGw
        LxIncO5KzQBOPmvKpjd4FfjYnSxbuushEnJF
X-Google-Smtp-Source: ABdhPJzLWY4gphtkLM2bVQCWr4fLMSIJUsfhCgkAp68W0xr87A3Jk8KiZDzteYP15NLJidEFmj/eZg==
X-Received: by 2002:a05:6402:396:: with SMTP id o22mr781601edv.361.1602031796961;
        Tue, 06 Oct 2020 17:49:56 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3002:290:faff:fe54:449c])
        by smtp.gmail.com with ESMTPSA id bw25sm261090ejb.119.2020.10.06.17.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 17:49:56 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        robert.marko@sartura.hr, Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v4 0/6] Add support for the iEi WT61P803 PUZZLE MCU
Date:   Wed,  7 Oct 2020 02:48:55 +0200
Message-Id: <20201007004901.39859-1-luka.kovacic@sartura.hr>
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
 MAINTAINERS                                   |   13 +
 drivers/hwmon/Kconfig                         |    8 +
 drivers/hwmon/Makefile                        |    1 +
 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c     |  457 +++++++
 drivers/leds/Kconfig                          |    8 +
 drivers/leds/Makefile                         |    1 +
 drivers/leds/leds-iei-wt61p803-puzzle.c       |  156 +++
 drivers/mfd/Kconfig                           |    8 +
 drivers/mfd/Makefile                          |    1 +
 drivers/mfd/iei-wt61p803-puzzle.c             | 1053 +++++++++++++++++
 include/linux/mfd/iei-wt61p803-puzzle.h       |   69 ++
 16 files changed, 2000 insertions(+)
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

