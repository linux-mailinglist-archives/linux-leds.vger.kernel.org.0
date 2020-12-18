Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20572DE143
	for <lists+linux-leds@lfdr.de>; Fri, 18 Dec 2020 11:43:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728248AbgLRKnh (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 18 Dec 2020 05:43:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389127AbgLRKng (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 18 Dec 2020 05:43:36 -0500
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B0A7C061285
        for <linux-leds@vger.kernel.org>; Fri, 18 Dec 2020 02:42:55 -0800 (PST)
Received: from ptx.hi.pengutronix.de ([2001:67c:670:100:1d::c0])
        by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kqDDk-00006v-RX; Fri, 18 Dec 2020 11:42:48 +0100
Received: from ukl by ptx.hi.pengutronix.de with local (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kqDDj-0004hN-Jz; Fri, 18 Dec 2020 11:42:47 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     linux-serial@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        Johan Hovold <johan@kernel.org>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
Subject: [PATCH v10 0/3] leds: trigger: implement a tty trigger
Date:   Fri, 18 Dec 2020 11:42:43 +0100
Message-Id: <20201218104246.591315-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c0
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Uwe Kleine-König <uwe@kleine-koenig.org>

Hello,

here comes v10 of this series. Changes compared to v9 sent with
Message-Id: 20201018204022.910815-1-u.kleine-koenig@pengutronix.de in
October:

 - Bump date and kernel version in ABI doc
 - Fix double unlock in error path; found by Pavel
 - Don't stop the workqueue in ttyname_store() to
   fix error behaviour on memory allocation failure.
   Now it continues with the previous configuration instead of
   stopping. Also found by Pavel.

Unaddressed review comments by Pavel are:

 - Unused assignment to len in ttyname_show
   This is wrong
 - "Poll every 100 msec... Hmm.... Okay, I guess?"
   Yes, I think there is no way around this given the trigger uses
   polling. There is no easy way to get notified instead.
 - "Are you sure about LED_ON [in the worker]? It should use current
   brightness selected by brightness file..."
   I found no consistent behaviour in other triggers. ledtrig-gpio
   implements a dedicated "desired_brightness" sysfs file, several use
   led_cdev->blink_brightness (via led_trigger_blink_oneshot),
   ledtrig-cpu uses led_trigger_event with LED_FULL.
 - "How is [the data initialized in ledtrig_tty_activate()] protected
   from concurrent access from sysfs?"
   I think there is no need to protect this. But I'm not sure I
   understood the question correctly, so please recheck and if needed
   point out the problem you see in more detail.

Uwe Kleine-König (3):
  tty: rename tty_kopen() and add new function tty_kopen_shared()
  tty: new helper function tty_get_icount()
  leds: trigger: implement a tty trigger

 .../ABI/testing/sysfs-class-led-trigger-tty   |   6 +
 drivers/accessibility/speakup/spk_ttyio.c     |   2 +-
 drivers/leds/trigger/Kconfig                  |   9 +
 drivers/leds/trigger/Makefile                 |   1 +
 drivers/leds/trigger/ledtrig-tty.c            | 188 ++++++++++++++++++
 drivers/tty/tty_io.c                          |  85 ++++++--
 include/linux/tty.h                           |   7 +-
 7 files changed, 273 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-tty
 create mode 100644 drivers/leds/trigger/ledtrig-tty.c

-- 
2.29.2

