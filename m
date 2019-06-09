Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C59EB3AB46
	for <lists+linux-leds@lfdr.de>; Sun,  9 Jun 2019 21:08:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729199AbfFITI2 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 9 Jun 2019 15:08:28 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:39051 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729082AbfFITI1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 9 Jun 2019 15:08:27 -0400
Received: by mail-wm1-f68.google.com with SMTP id z23so6171812wma.4;
        Sun, 09 Jun 2019 12:08:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=QAjK2NW6UzyuGmQY2jA13HwAwuGrKIWYNWL+Kra1FPQ=;
        b=DII9gk+KGOqp9l6U1tBR7x85bW+1Ym82HaqVmaPWrekUKjI0kENpD7BlFku3m+KYBr
         NQMSjv1JfDWcXqmvIPIlDHYfmW1jEKcpABidbOocsjUm0TbaCWVaOgmFlJCbK28/SukQ
         +/lqlP2uDmw1oME7RMNG9Af99OjEQofkB/1QmLG6a4WinX4JDBu9u7ix4QKhaV0dRp5Y
         NvzOr1A2VyK92O8wIfUS4ynXq8+tFX64QJ+fEGI6sRWB9PqHX/eX7ZxB8MEHIBcYH9aF
         Ex3LRyFOOGswJdl1AWOnH0DQ1S+JZMjzFJmngR7yEqSVDD5O7VZCWltgESQwVrXe2EwR
         61tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=QAjK2NW6UzyuGmQY2jA13HwAwuGrKIWYNWL+Kra1FPQ=;
        b=shCu/Rvi+mXF3m5cBUM5nhi1Vnr35zBfjmO6GNxnYPQxoqHCQ5t+kP5mxeIV9vZeLU
         sljevt1DBDJU9cZmRS9k0yJjHqIsIJuWXs4UetLCEq25IVvORd68dD8Lsn9z1uYTEro0
         kFXyZQBiT076WDfhidAXzDAuLCIUOCIJpWimaf+201IQm9jlfwrLhGoRQIhSqY5dwl5K
         Loet/rIxJraHTVJzmU7ZklTDKNi8jTbdQN3cHcDBIeh8nSZhaTvtKkjKWIkJpw/PfUeQ
         7svjVoPBc2mIewgLTIpMeYJqnbY+Y68KnlcGTJzObIY6CAa88l/IJNAOMJ0OtFG7Iton
         x5eg==
X-Gm-Message-State: APjAAAUwq8lRKqiBidd+fIot89zvfJbaw+RRCkbOrn3jCQDa/nka2oHl
        L/N6s+QMbaiMpDOrrgh4kPoe4H9y
X-Google-Smtp-Source: APXvYqxYxI0Vm+18zNqcerSt8RO18OyT86cwuI82LtVpbPYQsUzMoISp9H6+SMclZqmLt+gbQESAYw==
X-Received: by 2002:a1c:7ec8:: with SMTP id z191mr10626519wmc.66.1560107303909;
        Sun, 09 Jun 2019 12:08:23 -0700 (PDT)
Received: from myhost.home (ckm12.neoplus.adsl.tpnet.pl. [83.31.88.12])
        by smtp.gmail.com with ESMTPSA id y38sm14725041wrd.41.2019.06.09.12.08.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 09 Jun 2019 12:08:23 -0700 (PDT)
From:   Jacek Anaszewski <jacek.anaszewski@gmail.com>
To:     linux-leds@vger.kernel.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        pavel@ucw.cz, robh@kernel.org, dtor@google.com, linux@roeck-us.net,
        dmurphy@ti.com, jacek.anaszewski@gmail.com
Subject: [PATCH v5 00/26] Add generic support for composing LED class device name
Date:   Sun,  9 Jun 2019 21:07:37 +0200
Message-Id: <20190609190803.14815-1-jacek.anaszewski@gmail.com>
X-Mailer: git-send-email 2.11.0
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Changes from v4:

- switched "charge" function name to "charging"
- added "cpu", "mute", "micmute", "disk-activity", "panic", "mtd" LED functions
  to cover all existing triggers and removed now redundant "nand" and "mmc"
- added "capslock", "scrollock", "numlock" LED functions
- removed now redundant "keyboard" and "keypad" since there is "kbd_backlight"
  already available
- removed "tv" LED function as depreciated
- switched LED_COLOR_ID_COUNT to LED_COLOR_ID_MAX
- fixed led_classdev_register_ext() to not leave struct led_classdev's
  name pointing to no longer existing composed_name stack variable
- fixed leds-as3645 and leds-aat1290 to no longer rely on struct led_classdev's
  name property
- added basic LED class device name validation to get_led_device_info.sh
- tweaked LED naming section in leds_class.txt to allow devicename section
  also for non hot-pluggable devices
- always initialize all fields of struct led_init_data to zero on declaration
  in drivers
- fix leds-gpio to avoid overwriting the LED name coming from platform_data
- add description of LED function names with regard to whether devicename
  section is initialized or not

Changes from v3:

- allow for devicename section for hot-pluggable devices
- move led_colors array to led-core.c to avoid build break
  due to Kconfig dependency issue
- add a patch fixing led_colors array name clash with ALSA driver
- change led-enumerator DT property name to more meaningful function-enumerator
- add LED_FUNCTION_KBD_BACKLIGHT
- change naming and add new proprties to struct led_init_data
  and struct led_properties

Changes from v2:

- removed from drivers the responsibility of calling led_compose_name()
- added struct device* argument to led_compose_name() to allow using
  dev_<level> logging functions for more informative logs
- adjusted the list of LED_FUNCTION definitions according to the v2 review
  remarks
- renamed default_desc to default_label in the struct led_init_data
- added led-enumerator DT property to the common LED bindings
- removed LED_COLOR_NAME definitions from include/dt-bindings/leds/common.h
- change DT color property type from string to integer
- change struct initialization list to explicit property assignment in leds-sc27xx-bltc.c
- use led->client->name for led_hw_name in leds-lm3692x.c
- few other minor improvements to docs etc.

Changes from v1:

- improved led_parse_properties() to parse label property at first
  and return immediately after parsing succeeds
- added tool get_led_device_info.sh for retrieving LED class device's
  parent device related information
- extended LED naming section of Documentation/leds/leds-class.txt
- adjusted the list of LED_FUNCTION definitions according to the v1 review
  remarks
- added standard LED_COLOR_NAME definitions
- removed functions.h and moved both LED_FUNCTION and LED_COLOR_NAME
  definitions to include/dt-bindings/common.h
- rebased leds-as3645a changes on top of the patch switching to fwnode
  property API
- updated DT bindings to use new LED_COLOR_NAME definitions
- improved common LED bindings to not use address unit for sub-nodes
  without reg property

Generally I still insist on deprecating label property and devicename
section of LED name. The tool I added for obtaining LED device name
proves availability of the related information in other places in
the sysfs. Other discussed use cases are covered in the updated
Documentation/leds/leds-class.txt.

Beside that, I tried also to create macros for automatic composition
of "-N" suffixed LED functions, so that it would not be necessary
to pollute common.h with plenty repetitions of the same function,
differing only with the postfix. Unfortunately, the preprocessor
of the dtc compiler seems not to accept string concatenetation.
I.e. it is not possible to to the following assighment:

function = "hdd""-1"

If anyone knows how to obviate this shortocoming please let me know.

Original cover letter:

LED class device naming pattern included devicename section, which had
unpleasant effect of varying userspace interface dependent on underlaying
hardware. Moreover, this information was redundant in the LED name, since
the LED controller name could have been obtained from sysfs device group

This patch set introduces a led_compose_name() function in the LED core,
which unifies and simplifies LED class device name composition. This
change is accompanied by the improvements in the common LED DT bindings
where two new properties are introduced: "function" and "color" . The two
deprecate the old "label" property which was leaving too much room for
interpretation, leading to inconsistent LED naming.

There are also changes in LED DT node naming, which are in line with
DT maintainer's request from [0].

Since some DT LED naming unification, related to not including devicename
section in "label" DT property, is being requested during reviews of new
LED class drivers for almost a year now, then those drivers are the first
candidates for optimalization and the first users of the new
led_compose_name() API. The modifications were tested with Qemu,
by stubbing the driver internals where hardware interaction was needed
for proper probing.

Thanks,
Jacek Anaszewski

Jacek Anaszewski (26):
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
  leds: Document standard LED functions

 .../devicetree/bindings/leds/ams,as3645a.txt       |  22 +-
 Documentation/devicetree/bindings/leds/common.txt  |  62 +++++-
 .../devicetree/bindings/leds/leds-aat1290.txt      |  12 +-
 .../devicetree/bindings/leds/leds-an30259a.txt     |  22 +-
 .../devicetree/bindings/leds/leds-cr0014114.txt    |  26 ++-
 .../devicetree/bindings/leds/leds-gpio.txt         |  23 ++-
 .../devicetree/bindings/leds/leds-lm3601x.txt      |  10 +-
 .../devicetree/bindings/leds/leds-lm3692x.txt      |   9 +-
 .../devicetree/bindings/leds/leds-lp8860.txt       |   9 +-
 .../devicetree/bindings/leds/leds-lt3593.txt       |  11 +-
 .../devicetree/bindings/leds/leds-sc27xx-bltc.txt  |  10 +-
 Documentation/leds/led-functions.txt               | 223 +++++++++++++++++++++
 Documentation/leds/leds-class.txt                  |  70 ++++++-
 drivers/leds/led-class-flash.c                     |   9 +-
 drivers/leds/led-class.c                           |  49 +++--
 drivers/leds/led-core.c                            | 127 ++++++++++++
 drivers/leds/leds-aat1290.c                        |  16 +-
 drivers/leds/leds-an30259a.c                       |  25 +--
 drivers/leds/leds-as3645a.c                        |  74 +++----
 drivers/leds/leds-cr0014114.c                      |  33 +--
 drivers/leds/leds-gpio.c                           |  26 +--
 drivers/leds/leds-lm3601x.c                        |  38 ++--
 drivers/leds/leds-lm3692x.c                        |  22 +-
 drivers/leds/leds-lp8860.c                         |  35 ++--
 drivers/leds/leds-lt3593.c                         |  20 +-
 drivers/leds/leds-pwm.c                            |   2 +-
 drivers/leds/leds-sc27xx-bltc.c                    |  22 +-
 drivers/leds/leds.h                                |   1 +
 include/dt-bindings/leds/common.h                  |  55 ++++-
 include/linux/led-class-flash.h                    |  15 +-
 include/linux/leds.h                               |  79 +++++++-
 tools/leds/get_led_device_info.sh                  | 201 +++++++++++++++++++
 32 files changed, 1086 insertions(+), 272 deletions(-)
 create mode 100644 Documentation/leds/led-functions.txt
 create mode 100755 tools/leds/get_led_device_info.sh

-- 
2.11.0

