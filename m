Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 00F18B43EB
	for <lists+linux-leds@lfdr.de>; Tue, 17 Sep 2019 00:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732461AbfIPWVm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 16 Sep 2019 18:21:42 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:54598 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728897AbfIPWVm (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 16 Sep 2019 18:21:42 -0400
Received: by mail-wm1-f68.google.com with SMTP id p7so963887wmp.4;
        Mon, 16 Sep 2019 15:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=nKoTFnP2/sw+MzHjqEsPSUWv07lXTqRgvUBHxy8c4T8=;
        b=QtsWfAqo4JkUzgPKzDlC4fQCjX0vgsc15DJvBiJ14XOXIwJ6p+F/nyqVOnf/Xv7GuF
         gimK11Z2gNxZADTrA2YU7MdKSc3iI/7enCsv3yLwfEyhE84QhxtDo10NLsZsS32A4lUq
         3sONaXrZuA5mG9VhSWqe1i95VAUFUw3mWrbwuwAHcL9vEJs4cfPRDBxt12gr5Zrf3ly7
         /RY4wydc+w0YqFYHjP73eVoIOg+cxeCXN+DwJF7WWPQokEhfP42y4n3XNTSd6ewH7z1q
         etekLd9XFA026GmBmJgS1fos+m3xPcuaomOBZEGkLa7Q8D4NrMKjdMEThTrtqqICcLuA
         aqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=nKoTFnP2/sw+MzHjqEsPSUWv07lXTqRgvUBHxy8c4T8=;
        b=Qa7jP27iBlaoW3sBKkYpNN8A6ATp2oFsKzSSnJwgrOIGuBpHmlyM2eVVCdbYZlN7Ir
         uC/LUEDgeVUAEafOSgIa9bP5t3rFVPaMQvj1J4sLX5HnVCQGejlCeFEJqeVKkT9bBpmS
         9x7wtpdJClovpmZnCmWkux4ZTyCNoUmq999V73dnQV3Y6JfwopY25fEnJ04/g2HAUXZU
         Q72mO/KfHJ15x5+NNT9eF/Hc094/V1QkqhlApMfQmpQbGggVl68K7GKCfG6ufgwbPJo1
         GWk3H7QK+eOWZtVsBtAgHmsEce3ttkvUJto5z5+mwLblcMdRhllu/A29ni59gNMZAB7j
         BKvg==
X-Gm-Message-State: APjAAAVpkAft3BO8SeLzQ/2w7kfMgivbHJrzT20wRLNtuyOhczYQ1H2R
        tD6M1EFwIk9GMXoIY2PQaPQ=
X-Google-Smtp-Source: APXvYqzosns+bPvr817B+GjgW5cJX6MwpNcDX2A/G2Ons3CKh63vYCeJDPIGZ8Ho+KucaPPoXdBoXw==
X-Received: by 2002:a1c:a74f:: with SMTP id q76mr967187wme.16.1568672499309;
        Mon, 16 Sep 2019 15:21:39 -0700 (PDT)
Received: from myhost.home (bgp90.neoplus.adsl.tpnet.pl. [83.28.79.90])
        by smtp.gmail.com with ESMTPSA id u10sm516357wrg.55.2019.09.16.15.21.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 16 Sep 2019 15:21:38 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     torvalds@linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        ada@thorsis.com, andriy.shevchenko@linux.intel.com,
        bgolaszewski@baylibre.com, christophe.jaillet@wanadoo.fr,
        dmurphy@ti.com, gustavo@embeddedor.com, info@metux.net,
        jacek.anaszewski@gmail.com, joe@perches.com, kw@linux.com,
        linus.walleij@linaro.org, nishkadg.linux@gmail.com,
        nstoughton@logitech.com, oleg@kaa.org.ua, suzuki.poulose@arm.com,
        tony@atomide.com, wenwen@cs.uga.edu,
        wsa+renesas@sang-engineering.com, yamada.masahiro@socionext.com
Subject: [GIT PULL] LED updates for 5.4-rc1
Date:   Tue, 17 Sep 2019 00:21:33 +0200
Message-Id: <20190916222133.9119-1-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Hi Linus,

Please pull LED updates for 5.4-rc1.


There is one merge of tag with generic_lookup_helpers since
LED class has been made using class_find_device_by_name() helper:

    Merge tag 'generic_lookup_helpers' into for-next
    platform: Add platform_find_device_by_driver() helper
    drivers: Add generic helper to match any device
    drivers: Introduce device lookup variants by ACPI_COMPANION device
    drivers: Introduce device lookup variants by device type
    drivers: Introduce device lookup variants by fwnode
    drivers: Introduce device lookup variants by of_node
    drivers: Introduce device lookup variants by name

In this cycle we've finally managed to contribute the patch set sorting out
LED naming issues. Besides that there are many changes scattered among various
LED class drivers and triggers.

LED naming related improvements:

    - add new 'function' and 'color' fwnode properties and deprecate
      'label' property which has been frequently abused for conveying vendor
      specific names that have been available in sysfs anyway
    - introduce a set of standard LED_FUNCTION* definitions
    - introduce a set of standard LED_COLOR_ID* definitions
    - add a new {devm_}led_classdev_register_ext() API with the capability
      of automatic LED name composition basing on the properties available
      in the passed fwnode; the function is backwards compatible in a sense
      that it uses 'label' data, if present in the fwnode, for creating LED name
    - add tools/leds/get_led_device_info.sh script for retrieving LED vendor,
      product and bus names, if applicable; it also performs basic validation
      of an LED name
    - update following drivers and their DT bindings to use the new
      LED registration API:

        - leds-an30259a, leds-gpio, leds-as3645a, leds-aat1290, leds-cr0014114,
          leds-lm3601x, leds-lm3692x, leds-lp8860, leds-lt3593, leds-sc27xx-blt

Other LED class improvements:

    - replace {devm_}led_classdev_register() macros with inlines
    - allow to call led_classdev_unregister() unconditionally
    - switch to use fwnode instead of be stuck with OF one

LED triggers improvements:

    - led-triggers:
        - fix dereferencing of null pointer
        - fix a memory leak bug
    - ledtrig-gpio:
        - GPIO 0 is valid

Drop superseeded apu2/3 support from leds-apu since for apu2+ a newer, more
complete driver exists, based on a generic driver for the AMD SOCs
gpio-controller, supporting LEDs as well other devices:

    - drop profile field from priv data
    - drop iosize field from priv data
    - drop enum_apu_led_platform_types
    - drop superseeded apu2/3 led support
    - add pr_fmt prefix for better log output
    - fix error message on probing failure

Add of_node_put() before return:

    - leds-ns2, leds-max77650

Use struct_size() helper:

    - leds-pwm, leds-is31fl32xx

Switch to use fwnode_property_count_uXX()

    - leds-lm3697, leds-lm36274, leds-lm3532

Other misc fixes and improvements to existing LED class drivers:

    - leds-lm3532:
        - fix brightness control for i2c mode
        - change the define for the fs current register
        - fixes for the driver for stability
        - add full scale current configuration
        - dt: Add property for full scale current.
        - avoid potentially unpaired regulator calls
        - move static keyword to the front of declarations
        - fix optional led-max-microamp prop error handling
    - leds-max77650:
	- add of_node_put() before return
        - add MODULE_ALIAS()
        - Switch to fwnode property API
    - leds-as3645a:
        - fix misuse of strlcpy
    - leds-netxbig:
        - add of_node_put() in netxbig_leds_get_of_pdata()
        - remove legacy board-file support
    - leds-is31fl319x:
        - simplify getting the adapter of a client
    - leds-ti-lmu-common:
        - fix coccinelle issue
        - move static keyword to the front of declaration
    - leds-syscon:
        - use resource managed variant of device register
    - leds-ktd2692:
        - fix a typo in the name of a constant
    - leds-lp5562:
        - allow firmware files up to the maximum length
    - leds-an30259a:
        - fix typo
    - leds-pca953x:
        - include the right header


The following changes since commit 5f9e832c137075045d15cd6899ab0505cfb2ca4b:

  Linus 5.3-rc1 (2019-07-21 14:05:38 -0700)

are available in the git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git tags/leds-for-5.4-rc1

for you to fetch changes up to 6d4faf3b6b6eb3c8a750b2e6659a5b1ff3dd9e75:

  leds: lm3532: Fix optional led-max-microamp prop error handling (2019-09-12 20:45:52 +0200)

Thanks,
Jacek Anaszewski

----------------------------------------------------------------
LED updates for 5.4-rc1
----------------------------------------------------------------
Alexander Dahl (1):
      leds: syscon: Use resource managed variant of device register

Andy Shevchenko (7):
      leds: lm3532: Switch to use fwnode_property_count_uXX()
      leds: lm36274: Switch to use fwnode_property_count_uXX()
      leds: lm3697: Switch to use fwnode_property_count_uXX()
      leds: max77650: Switch to fwnode property API
      leds: Switch to use fwnode instead of be stuck with OF one
      leds: Allow to call led_classdev_unregister() unconditionally
      leds: trigger: gpio: GPIO 0 is valid

Bartosz Golaszewski (1):
      leds: max77650: add MODULE_ALIAS()

Christophe JAILLET (2):
      leds: an30259a: Fix typo
      leds: ktd2692: Fix a typo in the name of a constant

Dan Murphy (7):
      leds: lm3532: Fix brightness control for i2c mode
      leds: lm3532: Change the define for the fs current register
      leds: lm3532: Fixes for the driver for stability
      dt: lm3532: Add property for full scale current.
      leds: lm3532: Add full scale current configuration
      leds: ti-lmu-common: Fix coccinelle issue in TI LMU
      leds: lm3532: Fix optional led-max-microamp prop error handling

Enrico Weigelt (6):
      leds: apu: drop superseeded apu2/3 led support
      leds: apu: drop enum_apu_led_platform_types
      leds: apu: drop iosize field from priv data
      leds: apu: drop profile field from priv data
      leds: apu: fix error message on probing failure
      leds: apu: add pr_fmt prefix for better log output

Gustavo A. R. Silva (2):
      leds: is31fl32xx: Use struct_size() helper
      leds: pwm: Use struct_size() helper

Jacek Anaszewski (27):
      leds: class: Improve LED and LED flash class registration API
      dt-bindings: leds: Add LED_COLOR_ID definitions
      dt-bindings: leds: Add LED_FUNCTION definitions
      dt-bindings: leds: Add properties for LED name construction
      leds: core: Add support for composing LED class device names
      dt-bindings: sc27xx-blt: Add function and color properties
      leds: sc27xx-blt: Use generic support for composing LED names
      dt-bindings: lt3593: Add function and color properties
      leds: lt3593: Use generic support for composing LED names
      dt-bindings: lp8860: Add function and color properties
      leds: lp8860: Use generic support for composing LED names
      dt-bindings: lm3692x: Add function and color properties
      leds: lm3692x: Use generic support for composing LED names
      dt-bindings: lm36010: Add function and color properties
      leds: lm3601x: Use generic support for composing LED names
      dt-bindings: cr0014114: Add function and color properties
      leds: cr0014114: Use generic support for composing LED names
      dt-bindings: aat1290: Add function and color properties
      leds: aat1290: Use generic support for composing LED names
      dt-bindings: as3645a: Add function and color properties
      leds: as3645a: Use generic support for composing LED names
      dt-bindings: leds-gpio: Add function and color properties
      leds: gpio: Use generic support for composing LED names
      dt-bindings: an30259a: Add function and color properties
      leds: an30259a: Use generic support for composing LED names
      Merge tag 'generic_lookup_helpers' into for-next
      leds: Replace {devm_}led_classdev_register() macros with inlines

Joe Perches (1):
      leds: as3645a: Fix misuse of strlcpy

Krzysztof Wilczynski (2):
      leds: lm3532: Move static keyword to the front of declarations
      leds: ti-lmu-common: Move static keyword to the front of declaration

Linus Walleij (1):
      leds: pca953x: Include the right header

Masahiro Yamada (1):
      leds: netxbig: remove legacy board-file support

Nick Stoughton (1):
      leds: leds-lp5562 allow firmware files up to the maximum length

Nishka Dasgupta (3):
      leds: max77650: Add of_node_put() before return
      leds: ns2: Add of_node_put() before return
      leds: netxbig: Add of_node_put() in netxbig_leds_get_of_pdata()

Oleh Kravchenko (1):
      led: triggers: Fix dereferencing of null pointer

Suzuki K Poulose (7):
      drivers: Introduce device lookup variants by name
      drivers: Introduce device lookup variants by of_node
      drivers: Introduce device lookup variants by fwnode
      drivers: Introduce device lookup variants by device type
      drivers: Introduce device lookup variants by ACPI_COMPANION device
      drivers: Add generic helper to match any device
      platform: Add platform_find_device_by_driver() helper

Tony Lindgren (1):
      leds: lm3532: Avoid potentially unpaired regulator calls

Wenwen Wang (1):
      led: triggers: Fix a memory leak bug

Wolfram Sang (1):
      leds: is31fl319x: simplify getting the adapter of a client

 .../devicetree/bindings/leds/ams,as3645a.txt       |  22 +-
 Documentation/devicetree/bindings/leds/common.txt  |  62 +++++-
 .../devicetree/bindings/leds/leds-aat1290.txt      |  12 +-
 .../devicetree/bindings/leds/leds-an30259a.txt     |  22 +-
 .../devicetree/bindings/leds/leds-cr0014114.txt    |  26 ++-
 .../devicetree/bindings/leds/leds-gpio.txt         |  23 +-
 .../devicetree/bindings/leds/leds-lm3532.txt       |   4 +
 .../devicetree/bindings/leds/leds-lm3601x.txt      |  10 +-
 .../devicetree/bindings/leds/leds-lm3692x.txt      |   9 +-
 .../devicetree/bindings/leds/leds-lp8860.txt       |   9 +-
 .../devicetree/bindings/leds/leds-lt3593.txt       |  11 +-
 .../devicetree/bindings/leds/leds-sc27xx-bltc.txt  |  10 +-
 Documentation/leds/leds-class.rst                  |  70 +++++-
 drivers/amba/tegra-ahb.c                           |  11 +-
 drivers/base/bus.c                                 |  24 ---
 drivers/base/core.c                                |  39 +++-
 drivers/base/devcon.c                              |   8 +-
 drivers/base/platform.c                            |  14 ++
 drivers/fpga/fpga-bridge.c                         |   8 +-
 drivers/fpga/fpga-mgr.c                            |   8 +-
 drivers/gpu/drm/drm_mipi_dsi.c                     |   7 +-
 drivers/gpu/drm/exynos/exynos_drm_drv.c            |   9 +-
 drivers/gpu/drm/mcde/mcde_drv.c                    |   3 +-
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c        |   3 +-
 drivers/gpu/drm/vc4/vc4_drv.c                      |   3 +-
 drivers/hwtracing/coresight/coresight-platform.c   |  11 +-
 drivers/hwtracing/coresight/coresight-priv.h       |   2 -
 drivers/hwtracing/coresight/coresight.c            |   4 +-
 drivers/hwtracing/intel_th/core.c                  |  10 +-
 drivers/hwtracing/stm/core.c                       |   9 +-
 drivers/i2c/busses/i2c-amd-mp2-pci.c               |   8 +-
 drivers/i2c/i2c-core-acpi.c                        |  11 +-
 drivers/i2c/i2c-core-of.c                          |   7 +-
 drivers/infiniband/hw/hns/hns_roce_hw_v1.c         |   8 +-
 drivers/iommu/arm-smmu-v3.c                        |   9 +-
 drivers/iommu/arm-smmu.c                           |   9 +-
 drivers/leds/Kconfig                               |   6 +-
 drivers/leds/led-class-flash.c                     |   9 +-
 drivers/leds/led-class.c                           |  62 ++++--
 drivers/leds/led-core.c                            | 136 +++++++++++-
 drivers/leds/led-triggers.c                        |   5 +-
 drivers/leds/leds-aat1290.c                        |  16 +-
 drivers/leds/leds-an30259a.c                       |  29 +--
 drivers/leds/leds-apu.c                            | 157 ++------------
 drivers/leds/leds-as3645a.c                        |  74 +++----
 drivers/leds/leds-cr0014114.c                      |  33 +--
 drivers/leds/leds-gpio.c                           |  26 +--
 drivers/leds/leds-is31fl319x.c                     |   3 +-
 drivers/leds/leds-is31fl32xx.c                     |   8 +-
 drivers/leds/leds-ktd2692.c                        |   4 +-
 drivers/leds/leds-lm3532.c                         | 138 +++++++++---
 drivers/leds/leds-lm3601x.c                        |  38 ++--
 drivers/leds/leds-lm36274.c                        |   4 +-
 drivers/leds/leds-lm3692x.c                        |  22 +-
 drivers/leds/leds-lm3697.c                         |   5 +-
 drivers/leds/leds-lp5562.c                         |   6 +-
 drivers/leds/leds-lp8860.c                         |  35 ++-
 drivers/leds/leds-lt3593.c                         |  20 +-
 drivers/leds/leds-max77650.c                       |  44 ++--
 drivers/leds/leds-netxbig.c                        |  76 +++++--
 drivers/leds/leds-ns2.c                            |  21 +-
 drivers/leds/leds-pca9532.c                        |   2 +-
 drivers/leds/leds-pwm.c                            |  11 +-
 drivers/leds/leds-sc27xx-bltc.c                    |  22 +-
 drivers/leds/leds-syscon.c                         |   2 +-
 drivers/leds/leds-ti-lmu-common.c                  |  15 +-
 drivers/leds/leds.h                                |   1 +
 drivers/leds/trigger/ledtrig-gpio.c                |  12 +-
 drivers/mfd/altera-sysmgr.c                        |  14 +-
 drivers/misc/mei/main.c                            |   9 +-
 drivers/mux/core.c                                 |   7 +-
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_misc.c |   8 +-
 drivers/net/phy/mdio_bus.c                         |   9 +-
 drivers/nvmem/core.c                               |   7 +-
 drivers/of/of_mdio.c                               |   8 +-
 drivers/of/platform.c                              |   7 +-
 drivers/pci/probe.c                                |   7 +-
 drivers/regulator/of_regulator.c                   |   7 +-
 drivers/rtc/interface.c                            |  11 +-
 drivers/s390/cio/ccwgroup.c                        |  18 +-
 drivers/s390/cio/device.c                          |  15 +-
 drivers/s390/crypto/zcrypt_api.c                   |  22 +-
 drivers/scsi/scsi_proc.c                           |   9 +-
 drivers/spi/spi.c                                  |  28 +--
 drivers/tty/tty_io.c                               |   8 +-
 drivers/usb/core/devio.c                           |   8 +-
 drivers/usb/roles/class.c                          |  16 +-
 drivers/usb/typec/class.c                          |  16 +-
 include/dt-bindings/leds/common.h                  |  55 ++++-
 include/linux/device.h                             | 237 ++++++++++++++++++++-
 include/linux/led-class-flash.h                    |  15 +-
 include/linux/leds.h                               | 100 ++++++++-
 .../linux/platform_data/leds-kirkwood-netxbig.h    |  54 -----
 include/linux/platform_device.h                    |   3 +
 net/ieee802154/core.c                              |   7 +-
 sound/soc/rockchip/rk3399_gru_sound.c              |   9 +-
 tools/leds/get_led_device_info.sh                  | 201 +++++++++++++++++
 97 files changed, 1484 insertions(+), 988 deletions(-)
 delete mode 100644 include/linux/platform_data/leds-kirkwood-netxbig.h
 create mode 100755 tools/leds/get_led_device_info.sh
