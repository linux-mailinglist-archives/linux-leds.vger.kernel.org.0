Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BC6521749F
	for <lists+linux-leds@lfdr.de>; Tue,  7 Jul 2020 19:00:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728346AbgGGRAU (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 7 Jul 2020 13:00:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728324AbgGGRAL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 7 Jul 2020 13:00:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94020C08C5DC
        for <linux-leds@vger.kernel.org>; Tue,  7 Jul 2020 10:00:10 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1jsqwt-0004FO-U6; Tue, 07 Jul 2020 19:00:03 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1jsqws-00038k-Gs; Tue, 07 Jul 2020 19:00:02 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     kernel@pengutronix.de, linux-serial@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v7 0/3] leds: trigger: implement a tty trigger
Date:   Tue,  7 Jul 2020 18:59:55 +0200
Message-Id: <20200707165958.16522-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.27.0
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

this is v7 of a series adding support for tty triggers. See patch 3 for
how to use it. The first two patches provide the necessary
infrastructure in the tty subsystem to make the trigger possible.

Changes compared to v6 sent with Message-Id:
20200213091600.554-1-uwe@kleine-koenig.org on 13 Feb 2020:

 - use the tty's name instead of its major:minor
 - drop kstrtodev_t helper
 - retry opening the tty in case it only appears after it was configured
   in the trigger

Uwe Kleine-König (3):
  tty: rename tty_kopen() and add new function tty_kopen_shared()
  tty: new helper function tty_get_icount()
  leds: trigger: implement a tty trigger

 .../ABI/testing/sysfs-class-led-trigger-tty   |   6 +
 drivers/leds/trigger/Kconfig                  |   7 +
 drivers/leds/trigger/Makefile                 |   1 +
 drivers/leds/trigger/ledtrig-tty.c            | 192 ++++++++++++++++++
 drivers/staging/speakup/spk_ttyio.c           |   2 +-
 drivers/tty/tty_io.c                          |  87 ++++++--
 include/linux/tty.h                           |   7 +-
 7 files changed, 277 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-tty
 create mode 100644 drivers/leds/trigger/ledtrig-tty.c

base-commit: dcb7fd82c75ee2d6e6f9d8cc71c52519ed52e258
-- 
2.27.0

