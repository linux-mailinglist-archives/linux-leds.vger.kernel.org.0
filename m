Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B6D45109063
	for <lists+linux-leds@lfdr.de>; Mon, 25 Nov 2019 15:51:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728204AbfKYOuu (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 25 Nov 2019 09:50:50 -0500
Received: from honk.sigxcpu.org ([24.134.29.49]:39280 "EHLO honk.sigxcpu.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728280AbfKYOuu (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 25 Nov 2019 09:50:50 -0500
Received: from localhost (localhost [127.0.0.1])
        by honk.sigxcpu.org (Postfix) with ESMTP id ACD1DFB03;
        Mon, 25 Nov 2019 15:50:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at honk.sigxcpu.org
Received: from honk.sigxcpu.org ([127.0.0.1])
        by localhost (honk.sigxcpu.org [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id fEh5mS4__lqC; Mon, 25 Nov 2019 15:50:45 +0100 (CET)
Received: by bogon.sigxcpu.org (Postfix, from userid 1000)
        id C616949289; Mon, 25 Nov 2019 15:47:58 +0100 (CET)
From:   =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Enrico Weigelt <info@metux.net>,
        Allison Randal <allison@lohutok.net>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] leds: backlight: Register with class backlight
Date:   Mon, 25 Nov 2019 15:47:57 +0100
Message-Id: <cover.1574692624.git.agx@sigxcpu.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

When using current LCD drivers as ledtrig backlight they're
not registered with the backlight device class. This has
two problems: they're usually not found by userspace since
these tools usually look in /sys/class/backlight and they
can't be used as backlight phandles in device tree for
e.g. LCD panels.

This is an RFC if this is worthwhile at all? A current problem
is that changing the LED brightness does currently not notify
the class backlight so they can get out of sync but i could
look into that if the approach makes sense.


Guido Günther (1):
  leds: backlight: register with class backlight too

 drivers/leds/trigger/ledtrig-backlight.c | 54 ++++++++++++++++++++++++
 1 file changed, 54 insertions(+)

-- 
2.23.0

