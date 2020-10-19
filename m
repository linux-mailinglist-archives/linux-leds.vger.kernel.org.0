Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E9E029310B
	for <lists+linux-leds@lfdr.de>; Tue, 20 Oct 2020 00:19:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733254AbgJSWTW (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 19 Oct 2020 18:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733219AbgJSWTW (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 19 Oct 2020 18:19:22 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA222C0613D0
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2020 15:19:21 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id a3so1214091ejy.11
        for <linux-leds@vger.kernel.org>; Mon, 19 Oct 2020 15:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=esjy4fO6uR8UuEGzW2jO/GdK5i6J6fi0x2H/iZ6R1N8=;
        b=wKPpET+Z60l85A7FrEPFHx6GoC8am5+vXgQcj7a1kyOBVmOLsyV0F80paN+bu/E3eT
         3LEZgQlkOhpB8ONFQVSK3mYafxu4Pe2lb2ZS+wwJnQS7L84uZ4Gmuf46olvAqzdtyEKr
         NRq7hidNW9My8I5LWq++lPJewjPyLCB2ujjOKkfwhACqEoUxn4zZjA3cHdf3ut7Qdz6B
         Tb3IdQHD5qvnwxbomnuI/K4RG1/TSBflctLX1gVXjHtECQuRNCKECRK4jVZeFQzMmjqK
         dsMEUZY87gJPdKl1WM1SkPWzb3K30rRDLoWwegSV7AkYN+D4h4KPMmwgKLzmJZyhnEiw
         XwMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=esjy4fO6uR8UuEGzW2jO/GdK5i6J6fi0x2H/iZ6R1N8=;
        b=PgcYQMhq4LRPpMZRNj607uoZj33npfjEBD5PWkh+oN8DGCUHPmjuDu2WQUe8/KwIet
         DWASSk1rBadeqGx1Lp7N5QV96wpscTA+5ACbfFbGUuA4/7RxTgkgZG7vUKjBggyP/3lw
         uKRimKM3STZ+i4sTXEsQHa8utP+8vfnAlQbxihKMieqTHShYjyYC2N3O973jaekh+upG
         DrMD7mgfPoFBP1tju+QIGFLz9cLMyOBsO93PqXZhKZ7KD4fbJYNqFdnSUN2fyXuj/bF+
         vl+1GnESnNMDvAF8OOroF7rAhPrKrfdUb5Iea0+Ubez2duLIXVRUplqZBgFKCY8pFXxs
         Xt6g==
X-Gm-Message-State: AOAM5318LcU5YbQQl8oyzh86HIvvFyC5WvsQDkMW7VW77MqcCqz979iv
        OQ27uk4oiZdQ9l/MQLxcGZJfSg==
X-Google-Smtp-Source: ABdhPJy0pzsymzb1hhgBD3YNQ2LOD5EEXAd8UaXkBPI2wO+SloqCc/wyfxC+hXnSptarjy1X3gtKeg==
X-Received: by 2002:a17:906:1246:: with SMTP id u6mr7411eja.432.1603145960487;
        Mon, 19 Oct 2020 15:19:20 -0700 (PDT)
Received: from localhost.localdomain ([2a00:ee2:4b0d:3001:fbc5:498b:ed6d:cfac])
        by smtp.gmail.com with ESMTPSA id e17sm1645400ejh.64.2020.10.19.15.19.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2020 15:19:19 -0700 (PDT)
From:   Luka Kovacic <luka.kovacic@sartura.hr>
To:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-leds@vger.kernel.org, devicetree@vger.kernel.org
Cc:     lee.jones@linaro.org, pavel@ucw.cz, dmurphy@ti.com,
        robh+dt@kernel.org, jdelvare@suse.com, linux@roeck-us.net,
        marek.behun@nic.cz, luka.perkov@sartura.hr,
        andy.shevchenko@gmail.com, robert.marko@sartura.hr,
        Luka Kovacic <luka.kovacic@sartura.hr>
Subject: [PATCH v6 0/6] Add support for the iEi WT61P803 PUZZLE MCU
Date:   Tue, 20 Oct 2020 00:18:53 +0200
Message-Id: <20201019221859.56680-1-luka.kovacic@sartura.hr>
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
   - Add Luka Perkov to MAINTAINERS
Changes for v6:
   - Use the container_of() macro to get the led_cdev parent struct
   - Use %u instead of %lu in a printf() (LED driver) 

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

