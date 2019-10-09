Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1650ED0A2D
	for <lists+linux-leds@lfdr.de>; Wed,  9 Oct 2019 10:51:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbfJIIvu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 9 Oct 2019 04:51:50 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:46854 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbfJIIvu (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 9 Oct 2019 04:51:50 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x998pdU5016790;
        Wed, 9 Oct 2019 03:51:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570611099;
        bh=2z8YgTtODIlrawxiMLn2c8ZI7bBATmOhOqscoBx++x8=;
        h=From:To:CC:Subject:Date;
        b=D60ko1orhIerWI00abYbJIBXI+8nWD2vdDsV3LyyZqhHcfBBXKxuEqUc+Nqip+3M/
         599PsfYopNqStfkLh33B3Cs1bGtkm0xqsRCdpzyYrVwU0S2p3hdmlvtTEi0E/tVLW2
         uBWx0RQsxJ9O8PvUsDtOWpO/qAZbt+sPL1udPw4w=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x998pdxZ043360
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 9 Oct 2019 03:51:39 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 03:51:39 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 03:51:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x998pcYp094169;
        Wed, 9 Oct 2019 03:51:39 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <lee.jones@linaro.org>, <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v10 0/6] Add a generic driver for LED-based backlight
Date:   Wed, 9 Oct 2019 10:51:21 +0200
Message-ID: <20191009085127.22843-1-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This series aims to add a led-backlight driver, similar to pwm-backlight,
but using a LED class device underneath.

A few years ago (2015), Tomi Valkeinen posted a series implementing a
backlight driver on top of a LED device:
https://patchwork.kernel.org/patch/7293991/
https://patchwork.kernel.org/patch/7294001/
https://patchwork.kernel.org/patch/7293981/

The discussion stopped because Tomi lacked the time to work on it.

changes in v10:
- Provide a YAML schema instead of text file for the documentation of the
  LED backlight device-tree bindings.
- Add a short description of how the LED properties should be named in
  the common LED binding documentation. (new patch)
- rename property "default-brightness-level" as "default-brightness",
  following the majority here.

changes in v9:
- let to_of_node() check if the fwnode is actually a of_node
- add some checks in of_led_get()
- let dev_of_node() do the check about OF availabilty
- refactor led_bl_probe() to register a cleanup function with
  devm_add_action_or_reset(). This simplifies the error handling (which
  was not 100% done in v7) and allows to get rid of led_bl_remove()

changes in v8:
- use class_find_device_by_of_node() instead of class_find_device()
- renamed devm_led_get() as devm_of_led_get()

changes in v7:
- rebased on top of linux-leds/for-next
- populate the of_node member of the LED device if fwnode is a of_node
  (this is a new patch and the first of the series).
- devm_led_get() works only when the device tree is used. Add a few checks
  for that.  

changes in v6:
- trim the list of included headers
- remove useless definition of BKL_FULL_BRIGHTNESS

changes in v5:
- removed LED brightness scaling
- disable sysfs the interface of the LEDs when used by the backlight device

changes in v4:
- fix dev_err() messages and commit logs following the advices of Pavel
- cosmetic changes (indents, getting rid of  "? 1 : 0" in
  led_match_led_node())

changes in v3:
- dt binding: don't limit the brightness range to 0-255. Use the range of
  the underlying LEDs. as a side-effect, all LEDs must now have the same
  range
- driver: Adapt to dt binding update.
- driver: rework probe() for clarity and remove the remaining goto.

changes in v2:
- handle more than one LED.
- don't make the backlight device a child of the LED controller.
- make brightness-levels and default-brightness-level optional
- removed the option to use a GPIO enable.
- removed the option to use a regulator. It should be handled by the LED
  core
- don't make any change to the LED core (not needed anymore)

Jean-Jacques Hiblot (4):
  leds: populate the device's of_node
  leds: Add managed API to get a LED from a device driver
  dts-bindings: leds: Document the naming requirement for LED properties
  dt-bindings: backlight: Add led-backlight binding

Tomi Valkeinen (2):
  leds: Add of_led_get() and led_put()
  backlight: add led-backlight driver

 .../leds/backlight/led-backlight.yaml         |  55 ++++
 .../devicetree/bindings/leds/common.txt       |  20 +-
 drivers/leds/led-class.c                      | 103 ++++++-
 drivers/video/backlight/Kconfig               |   7 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/led_bl.c              | 258 ++++++++++++++++++
 include/linux/leds.h                          |   6 +
 7 files changed, 446 insertions(+), 4 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.yaml
 create mode 100644 drivers/video/backlight/led_bl.c

-- 
2.17.1

