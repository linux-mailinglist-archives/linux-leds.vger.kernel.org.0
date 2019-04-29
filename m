Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A7F67E6B0
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 17:39:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728587AbfD2PjV (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 11:39:21 -0400
Received: from mail.nic.cz ([217.31.204.67]:41408 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728448AbfD2PjV (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 29 Apr 2019 11:39:21 -0400
Received: from dellmb.labs.office.nic.cz (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTP id 770E2636E9;
        Mon, 29 Apr 2019 17:39:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556552359; bh=CPNC1r2Dysov89uJJqTG5jnflJKu4CrK/vN57c10se0=;
        h=From:To:Date;
        b=NYbWmKrWRMKJUbeA9n2SMmvKsASYfSq+RoegCr+yfCyUhu0TH9fxdALkJ/kX/N7Kr
         stGqCgYyobg+CGkJ/7q1sTTXHGudqzDkc+Y13c67ndnbM2iYn0bp1eN26Xopr+xtbV
         KPe6Io9n1k3NNvFcVCrp6UmydcfS6ZhzhjvEgexw=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH leds/for-next 1/1] leds: turris_omnia: add I2C dependency to Kconfig
Date:   Mon, 29 Apr 2019 17:39:18 +0200
Message-Id: <20190429153918.11948-1-marek.behun@nic.cz>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.99.2 at mail
X-Virus-Status: Clean
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

This driver depends on I2C. There are linking problems otherwise, if for
example CONFIG_LEDS_TURRIS_OMNIA=y and CONFIG_I2C=m.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Reported-by: Randy Dunlap <rdunlap@infradead.org>
---
 drivers/leds/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d5b31a71a112..6a2bb35ae682 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -131,6 +131,7 @@ config LEDS_CR0014114
 config LEDS_TURRIS_OMNIA
 	tristate "LED support for CZ.NIC's Turris Omnia"
 	depends on LEDS_CLASS
+	depends on I2C
 	depends on OF
 	help
 	  This option enables basic support for the LEDs found on the front
-- 
2.21.0

