Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49FE6226EAE
	for <lists+linux-leds@lfdr.de>; Mon, 20 Jul 2020 21:06:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729683AbgGTTGL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 20 Jul 2020 15:06:11 -0400
Received: from lelv0143.ext.ti.com ([198.47.23.248]:33308 "EHLO
        lelv0143.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728324AbgGTTGL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 20 Jul 2020 15:06:11 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 06KJ5r7H112895;
        Mon, 20 Jul 2020 14:05:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1595271953;
        bh=N75Wh7ZzcWXLgwUMfugPduR0KXHPJ9OzKFWdt1ltmt8=;
        h=From:To:CC:Subject:Date;
        b=ejfi+HozrSt109jvnNblVQdeKIxvRY8O72pEX1XKjATmUKMKz1ltFbucdxqFiNwxh
         TiAyRuHE4RYwumqB901UOWEZNXm49UwpXwmk/qbhcn9c/h5A+6waFtxC+7+KXkpuW+
         8Yhf9iXrAeTxrM6FevZJ6MaxlliGQhO3PzZZ5b2Q=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 06KJ5rov055290
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 20 Jul 2020 14:05:53 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Mon, 20
 Jul 2020 14:05:53 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Mon, 20 Jul 2020 14:05:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 06KJ5qhS075552;
        Mon, 20 Jul 2020 14:05:52 -0500
From:   Dan Murphy <dmurphy@ti.com>
To:     <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh@kernel.org>,
        <marek.behun@nic.cz>
CC:     <devicetree@vger.kernel.org>, <linux-leds@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] leds: multicolor: Fix camel case in documentation
Date:   Mon, 20 Jul 2020 14:05:47 -0500
Message-ID: <20200720190547.4735-1-dmurphy@ti.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix the camel case of MultiColor to Multicolor.

Fixes: f5a6eb5c5e38 ("leds: multicolor: Introduce a multicolor class definition")
Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 Documentation/leds/leds-class-multicolor.rst | 2 +-
 drivers/leds/Kconfig                         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/leds/leds-class-multicolor.rst b/Documentation/leds/leds-class-multicolor.rst
index 6204f391fd40..c57b98bfd387 100644
--- a/Documentation/leds/leds-class-multicolor.rst
+++ b/Documentation/leds/leds-class-multicolor.rst
@@ -1,7 +1,7 @@
 .. SPDX-License-Identifier: GPL-2.0
 
 ====================================
-MultiColor LED handling under Linux
+Multicolor LED handling under Linux
 ====================================
 
 Description
diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index a2c72212ddfc..1de6e8e264a0 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -31,7 +31,7 @@ config LEDS_CLASS_FLASH
 	  as a module.
 
 config LEDS_CLASS_MULTICOLOR
-	tristate "LED MultiColor Class Support"
+	tristate "LED Multicolor Class Support"
 	depends on LEDS_CLASS
 	help
 	  This option enables the multicolor LED sysfs class in /sys/class/leds.
-- 
2.27.0

