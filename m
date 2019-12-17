Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63F8012267D
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 09:18:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbfLQIR4 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 03:17:56 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:56675 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726536AbfLQIRy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Dec 2019 03:17:54 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ih839-0000yG-65; Tue, 17 Dec 2019 09:17:47 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ih837-0002IT-CK; Tue, 17 Dec 2019 09:17:45 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-serial@vger.kernel.org, kernel@pengutronix.de
Subject: [PATCH v2 0/3] tty/leds: implement a trigger for ttys
Date:   Tue, 17 Dec 2019 09:17:15 +0100
Message-Id: <20191217081718.23807-1-u.kleine-koenig@pengutronix.de>
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

back in November last year I sent my last approach to implement an led
trigger for UARTs (Message-Id:
20181106213739.29628-1-u.kleine-koenig@pengutronix.de). This was parked
on my todo list since then somewhere far from the top.

This is a new approach. Similar to the netdev trigger the tty trigger
introduced here periodically checks the statistics related to a given
tty and if that changed the LED is flashed once.

I had to introduce two functions in the tty layer to be able to get my
hands on the needed data in the first two patches, the third patch then
adds the trigger.

Best regards
Uwe

Uwe Kleine-König (3):
  tty: new helper function tty_kopen_shared
  tty: new helper function tty_get_icount()
  leds: trigger: implement a tty trigger

 drivers/leds/trigger/Kconfig       |   7 ++
 drivers/leds/trigger/Makefile      |   1 +
 drivers/leds/trigger/ledtrig-tty.c | 146 +++++++++++++++++++++++++++++
 drivers/tty/tty_io.c               |  47 ++++++++-
 include/linux/tty.h                |   3 +
 5 files changed, 200 insertions(+), 4 deletions(-)
 create mode 100644 drivers/leds/trigger/ledtrig-tty.c

-- 
2.24.0

