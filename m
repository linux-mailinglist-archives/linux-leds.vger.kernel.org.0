Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3948EA1D
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 20:29:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728949AbfD2S3L (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 14:29:11 -0400
Received: from mail.nic.cz ([217.31.204.67]:48531 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728908AbfD2S3L (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 29 Apr 2019 14:29:11 -0400
Received: from dellmb.labs.office.nic.cz (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTP id 178ED630D2;
        Mon, 29 Apr 2019 20:29:09 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556562549; bh=L9ZfIwZt+QtsKqYlRRiWGjkgA7beCzb9YHzNaOyxS4U=;
        h=From:To:Date;
        b=e9xQJGaRJ1MTr+yfwXUM7MA7zS7Edk5gXZqbfcn0iAiQtHyNIBZvOiGqtbRamAbid
         YrDLB44+c/VcPRYzaHJT8YQb1QBL19oYfcTtSSQgdD3RPUyEirK82tFOzvpP4YaSHS
         EdwuzTvkukcT1NeFHseaqq/ol2zhtRsDQ8BYOny8=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH leds/for-next v2 1/1] leds: turris_omnia: add I2C and MACH_ARMADA_38X dependencies
Date:   Mon, 29 Apr 2019 20:29:06 +0200
Message-Id: <20190429182906.13422-1-marek.behun@nic.cz>
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

Also add MACH_ARMADA_38X dependency, since it is unlikely that some
other device will ever have a microcontroller with software compatible
to that of Turris Omnia microcontroller.

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

