Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317A03BBDB9
	for <lists+linux-leds@lfdr.de>; Mon,  5 Jul 2021 15:48:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhGENvB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 5 Jul 2021 09:51:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231310AbhGENur (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 5 Jul 2021 09:50:47 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37A66C061574
        for <linux-leds@vger.kernel.org>; Mon,  5 Jul 2021 06:48:09 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id eb14so1878879edb.0
        for <linux-leds@vger.kernel.org>; Mon, 05 Jul 2021 06:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TkgjoBiZT+tKcnm7z9WAGyt2rcr4zjhxHUlq3d5ZD88=;
        b=HhJ2RVN9syadDWTYvbHbxlvBV53TJrJrO4V4IyLg1XdAAHeCsHxr1Drfi6n/aPFtBs
         WyPD7G+UC7ShK6csIfdnXnn9/85d75+B/l2/NGkkEMhiq5C4aqVoE7/lfCI5XBsWm9V2
         bGYvmIrtMsH9QntBbs53qrC9gEYtI3x1vOwb3qchzJK+ltiA56dm5zPxHFAcP3h2lWs6
         0rDQCDQs9VUtl27l2QBv/H+euh30XaWvwdDj7aubPe+W6tulbcr+bZDuuN726dab3y1d
         URrPYNdRieyLRU5mvN3KEYnOe2s6RGhHtc8IwNfwcjL8sdLu126TmRj4iIPjOWp6T3Zv
         e9BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TkgjoBiZT+tKcnm7z9WAGyt2rcr4zjhxHUlq3d5ZD88=;
        b=sRYVXSg6QrH0Zf9mWOqtFcXAu1FWfRBnI8qafX+ZK0ptea+S4W+Lq6MYBMDUwUSmPS
         DgaebpyJ+KeukejWUa+lUqaIqjJhsxCuK62cQ50xBCo4UbnD/kHLqRVC+epC4a6x5NFI
         Rny1BI9Cu0JDI24rU3S/XrTyvtgiIpKE/UdRGbVnxWXsHmQhOT9lfQSppR4KcF03ZElV
         lJfuo19swEFc2z6PboZGyg5wjYFfP08a1FSGTjmU8IydSRZSPf5CqtVDIFfJQvEfhrmN
         4eZN/nv2XtXo94PPGp66HcrZGP5deiACxTzzFc4WW2r9cBNYKsu4bBnkH+i9zSS4iXRG
         xyUg==
X-Gm-Message-State: AOAM532P8VtfGpTFRalamb38oP31+M5Sn3Pc8bi28DtjEaHuCJQUWoeJ
        oJKuRSDoMxMkGEv0EPCD6FjXnQ==
X-Google-Smtp-Source: ABdhPJxamgcyzuojUncjcL2L66DdZbrFQAeHkW9otBtaW923SkWEnNq2fib4MBWf3JqZkJVhqxgCUQ==
X-Received: by 2002:aa7:ccca:: with SMTP id y10mr16460065edt.47.1625492887768;
        Mon, 05 Jul 2021 06:48:07 -0700 (PDT)
Received: from localhost.localdomain ([89.18.44.40])
        by smtp.gmail.com with ESMTPSA id cf29sm1557637edb.14.2021.07.05.06.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jul 2021 06:48:07 -0700 (PDT)
From:   Pavo Banicevic <pavo.banicevic@sartura.hr>
To:     linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, pavo.banicevic@sartura.hr,
        corbet@lwn.net, lee.jones@linaro.org, pavel@ucw.cz,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        goran.medic@sartura.hr, luka.perkov@sartura.hr,
        luka.kovacic@sartura.hr
Subject: [PATCH v8 0/7] Add support for the IEI WT61P803 PUZZLE MCU
Date:   Mon,  5 Jul 2021 15:49:32 +0200
Message-Id: <20210705134939.28691-1-pavo.banicevic@sartura.hr>
X-Mailer: git-send-email 2.32.0
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
Changes for v8:
   - Fix multiple style issues
   - Reduce number of special allocations
   - Remove unnecessary special state tracking with write/read commands
   - Remove most of commands calls from probing of driver
   - Add hwmon documentation file
   - Replace some sprintf() calls with safer scnprintf()
   - Remove unused defines
   - Remove all explicit castings
   - Shorter name of device for hwmon driver so snprintf() can
     store device number
   - Remove special kobj usage
   - Use dev groups in place of deprecated device attributes
   - Extend documentation for some descriptions of ABI documentation
   - Add missing locking for response buffer in hwmon driver
   - Fix inconsistency with license versions
   - Check return value of iei_wt61p803_puzzle_sysfs_create()
   - Remove unneeded initializations of reply_size variable in drivers
   - Use define for fixed number of MAC addresses
   - Reorder some variable declarations to follow preferred style
   - Spell whole WoL acronym
   - Drop __func__ from device error message
   - Use sizeof() where it is possible
   - Use hex_asc[] array for converting number to ascii value
   - Remove unnecessary hwmon-sysfs.h include
   - Stop being overly verbose when probing mfd driver


Luka Kovacic (7):
  dt-bindings: Add IEI vendor prefix and IEI WT61P803 PUZZLE driver
    bindings
  drivers: mfd: Add a driver for IEI WT61P803 PUZZLE MCU
  drivers: hwmon: Add the IEI WT61P803 PUZZLE HWMON driver
  drivers: leds: Add the IEI WT61P803 PUZZLE LED driver
  Documentation/ABI: Add iei-wt61p803-puzzle driver sysfs interface
    documentation
  Documentation/hwmon: Add iei-wt61p803-puzzle hwmon driver
    documentation
  MAINTAINERS: Add an entry for the IEI WT61P803 PUZZLE driver

 .../testing/sysfs-driver-iei-wt61p803-puzzle  |  61 ++
 .../hwmon/iei,wt61p803-puzzle-hwmon.yaml      |  53 +
 .../leds/iei,wt61p803-puzzle-leds.yaml        |  44 +
 .../bindings/mfd/iei,wt61p803-puzzle.yaml     |  82 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../hwmon/iei-wt61p803-puzzle-hwmon.rst       |  40 +
 MAINTAINERS                                   |  16 +
 drivers/hwmon/Kconfig                         |   8 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c     | 413 ++++++++
 drivers/leds/Kconfig                          |   8 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-iei-wt61p803-puzzle.c       | 156 +++
 drivers/mfd/Kconfig                           |   8 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/iei-wt61p803-puzzle.c             | 908 ++++++++++++++++++
 include/linux/mfd/iei-wt61p803-puzzle.h       |  66 ++
 17 files changed, 1868 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-driver-iei-wt61p803-puzzle
 create mode 100644 Documentation/devicetree/bindings/hwmon/iei,wt61p803-puzzle-hwmon.yaml
 create mode 100644 Documentation/devicetree/bindings/leds/iei,wt61p803-puzzle-leds.yaml
 create mode 100644 Documentation/devicetree/bindings/mfd/iei,wt61p803-puzzle.yaml
 create mode 100644 Documentation/hwmon/iei-wt61p803-puzzle-hwmon.rst
 create mode 100644 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c
 create mode 100644 drivers/leds/leds-iei-wt61p803-puzzle.c
 create mode 100644 drivers/mfd/iei-wt61p803-puzzle.c
 create mode 100644 include/linux/mfd/iei-wt61p803-puzzle.h

-- 
2.31.1

