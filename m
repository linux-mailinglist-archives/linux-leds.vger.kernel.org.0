Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B0E5F28B4AC
	for <lists+linux-leds@lfdr.de>; Mon, 12 Oct 2020 14:34:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388510AbgJLMeL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 12 Oct 2020 08:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388334AbgJLMeL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 12 Oct 2020 08:34:11 -0400
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E50B5C0613D0
        for <linux-leds@vger.kernel.org>; Mon, 12 Oct 2020 05:34:09 -0700 (PDT)
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
        by metis.ext.pengutronix.de with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
        (Exim 4.92)
        (envelope-from <ukl@pengutronix.de>)
        id 1kRx1f-0001Ew-N6; Mon, 12 Oct 2020 14:34:03 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
        (envelope-from <ukl@pengutronix.de>)
        id 1kRx1c-0007Sl-Mz; Mon, 12 Oct 2020 14:34:00 +0200
From:   =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, linux-leds@vger.kernel.org,
        linux-serial@vger.kernel.org, kernel@pengutronix.de,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/3] leds: trigger: implement a tty trigger
Date:   Mon, 12 Oct 2020 14:33:55 +0200
Message-Id: <20201012123358.1475928-1-u.kleine-koenig@pengutronix.de>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-leds@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

this is v8 of a series adding support for tty triggers. See patch 3 for
how to use it. The first two patches provide the necessary
infrastructure in the tty subsystem to make the trigger possible.

Changes compared to v7 sent with Message-Id
20200707165958.16522-1-u.kleine-koenig@pengutronix.de on 7 Jul 2020:

 - ensure the worker function doesn't monopolize the context it is
   running in
 - Add a missing mutex_unlock in an error path

Pavel Machek wondered in reply to v7 if led_set_brightness was a good
idea. I didn't understand the issue and didn't get a reply to my
question. So if this is indeed a problem, this one still persists.

Best regards
Uwe

Uwe Kleine-König (3):
  tty: rename tty_kopen() and add new function tty_kopen_shared()
  tty: new helper function tty_get_icount()
  leds: trigger: implement a tty trigger

 .../ABI/testing/sysfs-class-led-trigger-tty   |   6 +
 drivers/accessibility/speakup/spk_ttyio.c     |   2 +-
 drivers/leds/trigger/Kconfig                  |   9 +
 drivers/leds/trigger/Makefile                 |   1 +
 drivers/leds/trigger/ledtrig-tty.c            | 187 ++++++++++++++++++
 drivers/tty/tty_io.c                          |  85 +++++---
 include/linux/tty.h                           |   7 +-
 7 files changed, 272 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/ABI/testing/sysfs-class-led-trigger-tty
 create mode 100644 drivers/leds/trigger/ledtrig-tty.c

-- 
2.28.0

