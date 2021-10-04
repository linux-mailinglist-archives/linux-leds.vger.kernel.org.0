Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E8DF421A85
	for <lists+linux-leds@lfdr.de>; Tue,  5 Oct 2021 01:20:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234035AbhJDXWr (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 4 Oct 2021 19:22:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233517AbhJDXWq (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 4 Oct 2021 19:22:46 -0400
Received: from bombadil.infradead.org (unknown [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FE0FC061745;
        Mon,  4 Oct 2021 16:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=udlZ2LI6YhWfdeiPC0VHFH087x2QjntE+6m4CSM8KV4=; b=R2wNux4aOX/kY83UreaAwXM6XE
        WtSBFNQZn1H0JEl5983gEuL5qBdjBjhrSeqrqrfD1uV4zMq3dB2TaUYucFUyWToTtnTCu1DyMZw6A
        +OvdMWdoumabwi+bQy8m6ksS4hiel1KIwTqgIceMvKmrXqUYWqbeBmybnqBsbgkv+XFBVgz5YiKVp
        I35M/4sRYSYSOvLjg1ZqSmSQ2Jslg85aOucVFr+anO4b044Jtyjl0LYBqJVanmm8epylsD/dF6SJa
        NORo+4q+YcamqHMy/Pgjz9zKIc5NUYkvHGzYp6hk+Lz/f8BhEhe79+5/mKMhuJ3escVvyTIrTURRH
        2n6QtAKw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mXXGS-008O6b-Jl; Mon, 04 Oct 2021 23:20:56 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
        linux-leds@vger.kernel.org
Subject: [PATCH] leds: LP50XX should select REGMAP_I2C
Date:   Mon,  4 Oct 2021 16:20:55 -0700
Message-Id: <20211004232055.23452-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

REGMAP_I2C is not a user visible kconfig symbol so driver configs
should not "depend on" it. They should depend on I2C and then
select REGMAP_I2C.

If this worked, it was only because some other driver had set/enabled
REGMAP_I2C.

Fixes: 242b81170fb8 ("leds: lp50xx: Add the LP50XX family of the RGB LED driver")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: linux-leds@vger.kernel.org
---
 drivers/leds/Kconfig |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

--- lnx-515-rc4.orig/drivers/leds/Kconfig
+++ lnx-515-rc4/drivers/leds/Kconfig
@@ -370,7 +370,8 @@ config LEDS_LP3952
 
 config LEDS_LP50XX
 	tristate "LED Support for TI LP5036/30/24/18/12/09 LED driver chip"
-	depends on LEDS_CLASS && REGMAP_I2C
+	depends on LEDS_CLASS && I2C
+	select REGMAP_I2C
 	depends on LEDS_CLASS_MULTICOLOR || !LEDS_CLASS_MULTICOLOR
 	help
 	  If you say yes here you get support for the Texas Instruments
