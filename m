Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 090A1122FB5
	for <lists+linux-leds@lfdr.de>; Tue, 17 Dec 2019 16:08:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727768AbfLQPHy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 17 Dec 2019 10:07:54 -0500
Received: from metis.ext.pengutronix.de ([85.220.165.71]:51769 "EHLO
        metis.ext.pengutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727595AbfLQPHr (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 17 Dec 2019 10:07:47 -0500
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihERp-0008EA-9l; Tue, 17 Dec 2019 16:07:41 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1ihERn-0000VM-24; Tue, 17 Dec 2019 16:07:39 +0100
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     kernel@pengutronix.de, linux-kernel@vger.kernel.org,
        linux-leds@vger.kernel.org, linux-serial@vger.kernel.org
Subject: [PATCH v3 0/3] tty/leds: implement a trigger for ttys
Date:   Tue, 17 Dec 2019 16:07:33 +0100
Message-Id: <20191217150736.1479-1-u.kleine-koenig@pengutronix.de>
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

next iteration of the tty-led-trigger series. This addresses the review
comments I got from Greg.

This depends on patch "tty: drop useless variable initialisation in
tty_kopen()" which is already on tty-testing.

Best regards
Uwe

Uwe Kleine-König (3):
  tty: rename tty_kopen() and add new function tty_kopen_shared()
  tty: new helper function tty_get_icount()
  leds: trigger: implement a tty trigger

 drivers/leds/trigger/Kconfig        |   7 ++
 drivers/leds/trigger/Makefile       |   1 +
 drivers/leds/trigger/ledtrig-tty.c  | 159 ++++++++++++++++++++++++++++
 drivers/staging/speakup/spk_ttyio.c |   2 +-
 drivers/tty/tty_io.c                |  87 +++++++++++----
 include/linux/tty.h                 |   7 +-
 6 files changed, 238 insertions(+), 25 deletions(-)
 create mode 100644 drivers/leds/trigger/ledtrig-tty.c

-- 
2.24.0

