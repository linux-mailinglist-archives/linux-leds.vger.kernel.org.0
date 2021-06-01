Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8B439721D
	for <lists+linux-leds@lfdr.de>; Tue,  1 Jun 2021 13:09:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233509AbhFALKy (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 1 Jun 2021 07:10:54 -0400
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132]:50046 "EHLO
        out30-132.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231219AbhFALKy (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Jun 2021 07:10:54 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R141e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04395;MF=jiapeng.chong@linux.alibaba.com;NM=1;PH=DS;RN=4;SR=0;TI=SMTPD_---0UawU26r_1622545748;
Received: from j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com fp:SMTPD_---0UawU26r_1622545748)
          by smtp.aliyun-inc.com(127.0.0.1);
          Tue, 01 Jun 2021 19:09:11 +0800
From:   Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To:     pavel@ucw.cz
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Subject: [PATCH] leds: is31fl32xx: Fix missing error code in is31fl32xx_parse_dt()
Date:   Tue,  1 Jun 2021 19:09:03 +0800
Message-Id: <1622545743-21240-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The error code is missing in this code scenario, add the error code
'-EINVAL' to the return value 'ret'.

Eliminate the follow smatch warning:

drivers/leds/leds-is31fl32xx.c:388 is31fl32xx_parse_dt() warn: missing
error code 'ret'.

Reported-by: Abaci Robot <abaci@linux.alibaba.com>
Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
---
 drivers/leds/leds-is31fl32xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 2180255..899ed94 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -385,6 +385,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 			dev_err(dev,
 				"Node %pOF 'reg' conflicts with another LED\n",
 				child);
+			ret = -EINVAL;
 			goto err;
 		}
 
-- 
1.8.3.1

