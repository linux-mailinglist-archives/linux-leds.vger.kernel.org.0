Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0207E125DCE
	for <lists+linux-leds@lfdr.de>; Thu, 19 Dec 2019 10:40:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726757AbfLSJkC (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Dec 2019 04:40:02 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:49015 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726752AbfLSJkA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 19 Dec 2019 04:40:00 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihsHi-0004Lc-Nk; Thu, 19 Dec 2019 10:39:54 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihsHg-0004As-K4; Thu, 19 Dec 2019 10:39:52 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH v5 0/3] tty/leds: implement a trigger for ttys
Date:   Thu, 19 Dec 2019 10:39:44 +0100
Message-Id: <20191219093947.15502-1-u.kleine-koenig@pengutronix.de>
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

Hello,

the only change since v4 (sent starting with Message-Id:
<20191217165816.19324-1-u.kleine-koenig@pengutronix.de> is that I now
added a file Documentation/ABI/testing/sysfs-class-led-trigger-tty in
patch 3.

As before this depends on patch "tty: drop useless variable
initialisation in tty_kopen()" which is already on tty-next.

Best regards
Uwe

Uwe Kleine-König (3):
  tty: rename tty_kopen() and add new function tty_kopen_shared()
  tty: new helper function tty_get_icount()
  leds: trigger: implement a tty trigger

 .../ABI/testing/sysfs-class-led-trigger-tty   |   6 +
 drivers/leds/trigger/Kconfig                  |   7 +
 drivers/leds/trigger/Makefile                 |   1 +
 drivers/leds/trigger/ledtrig-tty.c            | 153 ++++++++++++++++++
 drivers/staging/speakup/spk_ttyio.c           |   2 +-
 drivers/tty/tty_io.c                          |  87 +++++++---
 include/linux/tty.h                           |   7 +-
 7 files changed, 238 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-tty
 create mode 100644 drivers/leds/trigger/ledtrig-tty.c

-- 
2.24.0

