Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C8EB3F5E32
	for <lists+linux-leds@lfdr.de>; Tue, 24 Aug 2021 14:46:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237075AbhHXMr0 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 24 Aug 2021 08:47:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236992AbhHXMr0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 24 Aug 2021 08:47:26 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D11CCC0613CF
        for <linux-leds@vger.kernel.org>; Tue, 24 Aug 2021 05:46:41 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id u15so12712733wmj.1
        for <linux-leds@vger.kernel.org>; Tue, 24 Aug 2021 05:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ITgBrnsXxYt5ExpwAjy0F9kmoKjlzzIxaEpH+sT/Rk=;
        b=QBtxPtjwG4dfo9XZYXEZnqNkMHCffokDdBKiI5SeAVA8McCkKuICiG38qL7tujK4OE
         Fkse0XEGHa0/LrCkdnBufyDDk/i4kgUbk5h0/DqumwDMK8y2L1+3AV0kgvaqUEnquuI0
         T/AYhpSvdJ9MGy+Mf/3Y2jr+fwvQodi/UMw2lpElHMvFuHmp6MW9iSYFIn2ZMpm5Jkab
         O3a2T+/S2D85S0ixmw40pU0mYjDQtbOCuZvxCT/s9Pog/NTuoVKx0okGH0Jdj+AULYUu
         lvMMe/ZC76gIcMKUISEBlZBvqKpp/P6bkJ8ROBxcjLQPttqaJh5qHpdoBAqfHLQFwShU
         2cbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2ITgBrnsXxYt5ExpwAjy0F9kmoKjlzzIxaEpH+sT/Rk=;
        b=oAokYSpncWJWr/8e52Zs7uTZLydV59x5Vo/jJjn/KOQqpZwxOCJf13GO9ErtZViyBD
         bd3Tu2bpkRk1K4TUQ1157Xq12zUNxYb4JTOX+cLFZ7UV76ZY17MAN70i3d2hJ7qvXDzt
         hKGEVCV3iQHRRaW2MUltYqbIxSW0aBWAi+n8DQ9bmRbOoeGUo2atasNFZntwisnNyNaS
         PF383lSnYW7nOCT/kG+xAVmxDpjfAzwRgAwZ04X7IeJZAuFpo8dOJEWoOYtHFdtwCgHc
         1njYPnz3CGO6Kky2q5WSr3Xva4ROqx2fXmI17BoNSS1fy6ZWOu6EEnNep5QeZNxBCaF0
         J+sA==
X-Gm-Message-State: AOAM530EZe/VMQ3tAxMsFP0Fbr8B/pQXi1p2qcCaAOgzKTQW7+r/dZIa
        b+n2oI7gHgxxWwypFoQmkcCGhA==
X-Google-Smtp-Source: ABdhPJyQncu3C98MMppeelVklXU66lwyJO4PyyVNy0drV5Eh39UqMaUwwAgDeOaLk3lOd2fu/Waofw==
X-Received: by 2002:a1c:f610:: with SMTP id w16mr4023868wmc.116.1629809200179;
        Tue, 24 Aug 2021 05:46:40 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fe74:75c8:e909:251b])
        by smtp.gmail.com with ESMTPSA id i14sm2255454wmq.40.2021.08.24.05.46.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Aug 2021 05:46:39 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-doc@vger.kernel.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org, geert+renesas@glider.be,
        Max.Merchel@tq-group.com, linux@rempel-privat.de, daniel@0x0f.com,
        shawnguo@kernel.org, sam@ravnborg.org, arnd@arndb.de,
        krzysztof.kozlowski@canonical.com, pavo.banicevic@sartura.hr,
        corbet@lwn.net, lee.jones@linaro.org, pavel@ucw.cz,
        robh+dt@kernel.org, linux@roeck-us.net, jdelvare@suse.com,
        goran.medic@sartura.hr, luka.perkov@sartura.hr,
        robert.marko@sartura.hr
Cc:     Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v9 0/7] Add support for the IEI WT61P803 PUZZLE MCU
Date:   Tue, 24 Aug 2021 14:44:31 +0200
Message-Id: <20210824124438.14519-1-luka.kovacic@sartura.hr>
X-Mailer: git-send-email 2.31.1
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
Changes for v9:
   - Add hwmon documentation to index.rst
   - Describe the temperature sensors in hwmon documentation
   - Only describe 1 LED in the dt-bindings
   - Use absoulute references in dt-bindings, instead of relative ones

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
 .../leds/iei,wt61p803-puzzle-leds.yaml        |  39 +
 .../bindings/mfd/iei,wt61p803-puzzle.yaml     |  82 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../hwmon/iei-wt61p803-puzzle-hwmon.rst       |  43 +
 Documentation/hwmon/index.rst                 |   1 +
 MAINTAINERS                                   |  16 +
 drivers/hwmon/Kconfig                         |   8 +
 drivers/hwmon/Makefile                        |   1 +
 drivers/hwmon/iei-wt61p803-puzzle-hwmon.c     | 413 ++++++++
 drivers/leds/Kconfig                          |   8 +
 drivers/leds/Makefile                         |   1 +
 drivers/leds/leds-iei-wt61p803-puzzle.c       | 147 +++
 drivers/mfd/Kconfig                           |   8 +
 drivers/mfd/Makefile                          |   1 +
 drivers/mfd/iei-wt61p803-puzzle.c             | 908 ++++++++++++++++++
 include/linux/mfd/iei-wt61p803-puzzle.h       |  66 ++
 18 files changed, 1858 insertions(+)
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

