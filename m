Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C14715BB54
	for <lists+linux-leds@lfdr.de>; Thu, 13 Feb 2020 10:16:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729619AbgBMJQM (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 13 Feb 2020 04:16:12 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:57221 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729531AbgBMJQM (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 13 Feb 2020 04:16:12 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1j2AbQ-000802-Sl; Thu, 13 Feb 2020 10:16:08 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1j2AbP-0005qx-BI; Thu, 13 Feb 2020 10:16:07 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@pengutronix.de,
        linux-serial@vger.kernel.org
Subject: [PATCH v6 0/4] leds: trigger: implement a tty trigger
Date:   Thu, 13 Feb 2020 10:15:56 +0100
Message-Id: <20200213091600.554-1-uwe@kleine-koenig.org>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Hello,

This is v6 of my quest to introduce ledtriggers for UARTs. The previous
series is available at

	http://lore.kernel.org/r/20191219093947.15502-1-u.kleine-koenig@pengutronix.de

The changes compared to that are that parsing of the dev parameter is
more strict and that I set brightness directly from the kworker instead
of using led_blink_set_oneshot which makes use of another kworker. (Both
requested by Pavel Machek.)

For the former I introduced a new helper kstrtodev_t() in the spirit of
kstrtoul() to implement the stricter parsing (instead of the lax one
using plain sscanf() in v5).

Best regards
Uwe

Uwe Kleine-König (4):
  lib: new helper kstrtodev_t()
  tty: rename tty_kopen() and add new function tty_kopen_shared()
  tty: new helper function tty_get_icount()
  leds: trigger: implement a tty trigger

 .../ABI/testing/sysfs-class-led-trigger-tty   |   6 +
 drivers/leds/trigger/Kconfig                  |   7 +
 drivers/leds/trigger/Makefile                 |   1 +
 drivers/leds/trigger/ledtrig-tty.c            | 159 ++++++++++++++++++
 drivers/staging/speakup/spk_ttyio.c           |   2 +-
 drivers/tty/tty_io.c                          |  87 +++++++---
 include/linux/kdev_t.h                        |   2 +
 include/linux/kernel.h                        |   1 +
 include/linux/tty.h                           |   7 +-
 lib/kstrtox.c                                 |  46 +++++
 10 files changed, 293 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-tty
 create mode 100644 drivers/leds/trigger/ledtrig-tty.c


base-commit: 0bf999f9c5e74c7ecf9dafb527146601e5c848b9
-- 
2.24.0

