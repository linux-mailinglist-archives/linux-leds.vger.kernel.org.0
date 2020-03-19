Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D181D18C2C5
	for <lists+linux-leds@lfdr.de>; Thu, 19 Mar 2020 23:11:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbgCSWLx (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Thu, 19 Mar 2020 18:11:53 -0400
Received: from gateway24.websitewelcome.com ([192.185.51.196]:22326 "EHLO
        gateway24.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727411AbgCSWLx (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Thu, 19 Mar 2020 18:11:53 -0400
X-Greylist: delayed 1238 seconds by postgrey-1.27 at vger.kernel.org; Thu, 19 Mar 2020 18:11:52 EDT
Received: from cm17.websitewelcome.com (cm17.websitewelcome.com [100.42.49.20])
        by gateway24.websitewelcome.com (Postfix) with ESMTP id 5DD381CE87
        for <linux-leds@vger.kernel.org>; Thu, 19 Mar 2020 16:51:14 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id F34MjjxnxAGTXF34Mj9uCV; Thu, 19 Mar 2020 16:51:14 -0500
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=r1OkkVLKJe2+AiskQxxbFjMMb5GWePgr3r6Djtjenbk=; b=Rp9p2gPASRhgQiAw88td9Kyu6v
        o3If2CjXo0l/GIMOq6ywCBvmQWikt/MVDcjNB6CMbpjFaJKcGTffpKXJil/YATEXIHU1Zb/p9I36l
        PW4xUPfLPtJdrcLlOI3/+T9H31fuON3b4ElJeBsEzL9B+TyhIM5VVN6IOmQmHBKkyhpX29MWLwXhR
        BQ6PyK8P3CCgPEjs4uKGFbkEl2HDSCvU0kFSjhC74/olcMHRp2YqgbRCXSRZnkapL48YsNW1kO3Zl
        ZxLgvLf2kD32nW0zI1jUqvgSOGpvHwveQiXbHZYZYtN/lsJiRePknl/TMRmNY+6gPYXsBM0FR5v44
        wQPC4LUg==;
Received: from cablelink-189-218-116-241.hosts.intercable.net ([189.218.116.241]:53538 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1jF34K-001nXP-LA; Thu, 19 Mar 2020 16:51:12 -0500
Date:   Thu, 19 Mar 2020 16:51:12 -0500
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH][next] leds: leds-is31fl32xx: Replace zero-length array with
 flexible-array member
Message-ID: <20200319215112.GA23858@embeddedor.com>
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
X-Source-IP: 189.218.116.241
X-Source-L: No
X-Exim-ID: 1jF34K-001nXP-LA
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: cablelink-189-218-116-241.hosts.intercable.net (embeddedor) [189.218.116.241]:53538
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 68
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
inadvertently introduced[3] to the codebase from now on.

Also, notice that, dynamic memory allocations won't be affected by
this change:

"Flexible array members have incomplete type, and so the sizeof operator
may not be applied. As a quirk of the original implementation of
zero-length arrays, sizeof evaluates to zero."[1]

This issue was found with the help of Coccinelle.

[1] https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
[2] https://github.com/KSPP/linux/issues/21
[3] commit 76497732932f ("cxgb3/l2t: Fix undefined behaviour")

Signed-off-by: Gustavo A. R. Silva <gustavo@embeddedor.com>
---
 drivers/leds/leds-is31fl32xx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 6f29b8943913..cd768f991da1 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -44,7 +44,7 @@ struct is31fl32xx_priv {
 	const struct is31fl32xx_chipdef *cdef;
 	struct i2c_client *client;
 	unsigned int num_leds;
-	struct is31fl32xx_led_data leds[0];
+	struct is31fl32xx_led_data leds[];
 };
 
 /**
-- 
2.23.0

