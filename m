Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 86D9E123307
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 17:58:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727998AbfLQQ6e (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 11:58:34 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:59049 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727843AbfLQQ6e (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Dec 2019 11:58:34 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihGAx-0003dJ-Im; Tue, 17 Dec 2019 17:58:23 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihGAv-0003zw-PV; Tue, 17 Dec 2019 17:58:21 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH v4 0/3] tty/leds: implement a trigger for ttys
Date:   Tue, 17 Dec 2019 17:58:13 +0100
Message-Id: <20191217165816.19324-1-u.kleine-koenig@pengutronix.de>
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

v3 of this series was sent earlier today starting with Message-Id:
20191217150736.1479-1-u.kleine-koenig@pengutronix.de.

v4 only changes patch 3 dropping a few printks, fixing the show callback
for the dev attribute to match its store function. And I moved
ledtrig_tty_restart() into the already existing if (tty) {...} block in
dev_store and dropped the same check from the former function.

Best regards
Uwe

Uwe Kleine-König (3):
  tty: rename tty_kopen() and add new function tty_kopen_shared()
  tty: new helper function tty_get_icount()
  leds: trigger: implement a tty trigger

 drivers/leds/trigger/Kconfig        |   7 ++
 drivers/leds/trigger/Makefile       |   1 +
 drivers/leds/trigger/ledtrig-tty.c  | 153 ++++++++++++++++++++++++++++
 drivers/staging/speakup/spk_ttyio.c |   2 +-
 drivers/tty/tty_io.c                |  87 ++++++++++++----
 include/linux/tty.h                 |   7 +-
 6 files changed, 232 insertions(+), 25 deletions(-)
 create mode 100644 drivers/leds/trigger/ledtrig-tty.c

-- 
2.24.0

