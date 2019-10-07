Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E8A41CE210
	for <lists+linux-leds@lfdr.de>; Mon,  7 Oct 2019 14:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727838AbfJGMpD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 7 Oct 2019 08:45:03 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:38396 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727801AbfJGMpD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 7 Oct 2019 08:45:03 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x97CitGu030289;
        Mon, 7 Oct 2019 07:44:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1570452295;
        bh=UKYNlQrAnqYHdLObzAAphAQPvbt/6HFXaFAp/AGJipk=;
        h=From:To:CC:Subject:Date;
        b=swLnqi6AwNfzDlhYP5J9keUG1KcsL4skefAR55w8Pz2OMMn08OqjivTAXjr91v/y3
         SckiArG3Sf2ECvZ199k9uSOKNvYthRKzsyVh7cm/bdBoUlxvFSv7SUXVZ1+GMvVDu1
         rjqBP58vKmIjF/EKnavTGlHpU1xuauD6GHYpwLS4=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x97Cit91109873
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 7 Oct 2019 07:44:55 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 7 Oct
 2019 07:44:54 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 7 Oct 2019 07:44:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x97CirYU093802;
        Mon, 7 Oct 2019 07:44:54 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
        <robh+dt@kernel.org>, <mark.rutland@arm.com>,
        <lee.jones@linaro.org>, <daniel.thompson@linaro.org>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v9 0/5] Add a generic driver for LED-based backlight
Date:   Mon, 7 Oct 2019 14:44:32 +0200
Message-ID: <20191007124437.20367-1-jjhiblot@ti.com>
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

Jean-Jacques Hiblot (3):
  leds: populate the device's of_node
  leds: Add managed API to get a LED from a device driver
  dt-bindings: backlight: Add led-backlight binding

Tomi Valkeinen (2):
  leds: Add of_led_get() and led_put()
  backlight: add led-backlight driver

 .../bindings/leds/backlight/led-backlight.txt |  28 ++
 drivers/leds/led-class.c                      | 103 ++++++-
 drivers/video/backlight/Kconfig               |   7 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/led_bl.c              | 258 ++++++++++++++++++
 include/linux/leds.h                          |   6 +
 6 files changed, 402 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
 create mode 100644 drivers/video/backlight/led_bl.c

-- 
2.17.1

