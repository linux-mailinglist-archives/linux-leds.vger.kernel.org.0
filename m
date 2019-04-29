Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD365EA29
	for <lists+linux-leds@lfdr.de>; Mon, 29 Apr 2019 20:32:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729015AbfD2Sc3 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Apr 2019 14:32:29 -0400
Received: from mail.nic.cz ([217.31.204.67]:48600 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728844AbfD2Sc3 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 29 Apr 2019 14:32:29 -0400
Received: from dellmb.labs.office.nic.cz (unknown [172.20.6.125])
        by mail.nic.cz (Postfix) with ESMTP id BB8DE63352;
        Mon, 29 Apr 2019 20:32:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1556562747; bh=2XByUxBdT4F5t5U4FOLzn1nLzaM8Bb4nnE4jfntKI1s=;
        h=From:To:Date;
        b=R6JdhcUGoJgkJMMtPDOOXRqTfa47PptlHeRPFPezMFDBD4XIjNkDi0samh72qcfIL
         jH1Fxd9pMsaeKLvWPwcfDvJuiq7J+r1qg541CxAspuoaYAigSXEd0I3W4wUo9+0/kT
         +VwWxMt23KePt2So3Z8qAYFeaunIu27/RKUpRS2w=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH leds/for-next v3 1/1] leds: turris_omnia: add I2C and MACH_ARMADA_38X dependencies
Date:   Mon, 29 Apr 2019 20:32:26 +0200
Message-Id: <20190429183226.14078-1-marek.behun@nic.cz>
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
 drivers/leds/Kconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index d5b31a71a112..6b555d31c1be 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -131,6 +131,8 @@ config LEDS_CR0014114
 config LEDS_TURRIS_OMNIA
 	tristate "LED support for CZ.NIC's Turris Omnia"
 	depends on LEDS_CLASS
+	depends on I2C
+	depends on MACH_ARMADA_38X
 	depends on OF
 	help
 	  This option enables basic support for the LEDs found on the front
-- 
2.21.0

