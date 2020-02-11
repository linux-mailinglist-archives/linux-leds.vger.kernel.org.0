Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6C5B159AE9
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2020 22:05:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729690AbgBKVFz (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Feb 2020 16:05:55 -0500
Received: from gateway36.websitewelcome.com ([192.185.188.18]:36720 "EHLO
        gateway36.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729031AbgBKVFy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 11 Feb 2020 16:05:54 -0500
X-Greylist: delayed 1232 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Feb 2020 16:05:53 EST
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
        by gateway36.websitewelcome.com (Postfix) with ESMTP id DBB5040363814
        for <linux-leds@vger.kernel.org>; Tue, 11 Feb 2020 13:59:20 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 1cPIjbhBgRP4z1cPIj3XOO; Tue, 11 Feb 2020 14:45:20 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=efFfxVn8Jb7KD27vuCCDwjZQRJzIwoCIi3Vzmh6cNFE=; b=w08LqxD5luSX2N4SRteiaVp4oW
        gSISNaLG49i17JIKLbyLAAiJssaXB5sYAzltOBV7x0KjfBGhmCZzD427tzobAeC/FhMLxYMS0jscM
        /qtmE4nphazCw6n1fxbGP9kYVohxR29NTME8+qoeqOCB2qG3GLZOu6Ij2V+Zlr6ELtGkB0PzY7rW0
        AyDjUUr6GYiSmKQbPVJEecawdyy5Fc7ASVYtttQob2ofhdt9IBTdkxeUBeZ4w5lcUfs3MuxtIHLsR
        M1S21lGZF4X83AoduO1ulSVd3NRn+hyzAL2wb1Xg+L77P/o+q4D1GXg9bhE6RHxd5t9lpco0Bb9oZ
        r8cOSDeA==;
Received: from [200.68.140.36] (port=23001 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j1cPH-001tlJ-FQ; Tue, 11 Feb 2020 14:45:19 -0600
Date:   Tue, 11 Feb 2020 14:47:54 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] leds: is31fl32xx: Replace zero-length array with
 flexible-array member
Message-ID: <20200211204754.GA19451@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 200.68.140.36
X-Source-L: No
X-Exim-ID: 1j1cPH-001tlJ-FQ
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.36]:23001
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 32
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The current codebase makes use of the zero-length array language
extension to the C90 standard, but the preferred mechanism to declare
variable-length types such as these ones is a flexible array member[1][2],
introduced in C99:

struct foo {
        int stuff;
        struct boo array[];
};

By making use of the mechanism above, we will get a compiler warning
in case the flexible array does not occur last in the structure, which
will help us prevent some kind of undefined behavior bugs from being
inadvertenly introduced[3] to the codebase from now on.

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/leds/leds-is31fl32xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 31a9d749c8be..67032a799860 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -48,7 +48,7 @@ struct is31fl32xx_priv {
 	const struct is31fl32xx_chipdef *cdef;
 	struct i2c_client *client;
 	unsigned int num_leds;
-	struct is31fl32xx_led_data leds[0];
+	struct is31fl32xx_led_data leds[];
 };
 
 /**
-- 
2.25.0

