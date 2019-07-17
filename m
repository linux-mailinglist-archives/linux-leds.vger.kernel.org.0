Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 317036BE04
	for <lists+linux-leds@lfdr.de>; Wed, 17 Jul 2019 16:16:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727637AbfGQOP3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 17 Jul 2019 10:15:29 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:49622 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725873AbfGQOP3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 17 Jul 2019 10:15:29 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x6HEFJVe036361;
        Wed, 17 Jul 2019 09:15:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1563372919;
        bh=wmbVRRCj0IguumeyCLY5alwgve2QCszThM26fNaNT+Y=;
        h=From:To:CC:Subject:Date;
        b=FL+rfY1tSw0CRmepUeFIGKWqbgEIkpZ8eJccIH74o24uxCCleH9Zj51c4aCuwdP2Q
         uFDEUT4yOz8UC6L7x43DFU1HhdEs4ABUw2ArnBm3Qj2hcgltu8QBmD3z7wfQekmEiE
         GmAp5CHpQv0munbNjwly3GORfeXCHvNCtHsaBsIk=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x6HEFJTe075585
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 17 Jul 2019 09:15:19 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 17
 Jul 2019 09:15:18 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 17 Jul 2019 09:15:18 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x6HEFISC094769;
        Wed, 17 Jul 2019 09:15:18 -0500
From:   Jean-Jacques Hiblot <jjhiblot@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
        <mark.rutland@arm.com>, <lee.jones@linaro.org>,
        <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
CC:     <dmurphy@ti.com>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ti.com>, Jean-Jacques Hiblot <jjhiblot@ti.com>
Subject: [PATCH v4 0/4] Add a generic driver for LED-based backlight
Date:   Wed, 17 Jul 2019 16:15:10 +0200
Message-ID: <20190717141514.21171-1-jjhiblot@ti.com>
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

Jean-Jacques Hiblot (2):
  leds: Add managed API to get a LED from a device driver
  dt-bindings: backlight: Add led-backlight binding

Tomi Valkeinen (2):
  leds: Add of_led_get() and led_put()
  backlight: add led-backlight driver

 .../bindings/leds/backlight/led-backlight.txt |  28 ++
 drivers/leds/led-class.c                      |  92 ++++++
 drivers/video/backlight/Kconfig               |   7 +
 drivers/video/backlight/Makefile              |   1 +
 drivers/video/backlight/led_bl.c              | 268 ++++++++++++++++++
 include/linux/leds.h                          |   6 +
 6 files changed, 402 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/backlight/led-backlight.txt
 create mode 100644 drivers/video/backlight/led_bl.c

-- 
2.17.1

