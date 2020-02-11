Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 979CC159AF7
	for <lists+linux-leds@lfdr.de>; Tue, 11 Feb 2020 22:10:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbgBKVKB (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 11 Feb 2020 16:10:01 -0500
Received: from gateway32.websitewelcome.com ([192.185.145.18]:49489 "EHLO
        gateway32.websitewelcome.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728894AbgBKVKB (ORCPT
        <rfc822;linux-leds@vger.kernel.org>);
        Tue, 11 Feb 2020 16:10:01 -0500
X-Greylist: delayed 1398 seconds by postgrey-1.27 at vger.kernel.org; Tue, 11 Feb 2020 16:10:01 EST
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
        by gateway32.websitewelcome.com (Postfix) with ESMTP id 23A41B75C5D
        for <linux-leds@vger.kernel.org>; Tue, 11 Feb 2020 14:46:43 -0600 (CST)
Received: from gator4166.hostgator.com ([108.167.133.22])
        by cmsmtp with SMTP
        id 1cQdjVjIS8vkB1cQdjTtvJ; Tue, 11 Feb 2020 14:46:43 -0600
X-Authority-Reason: nr=8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=embeddedor.com; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
        Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
        Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
        :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=/FMhIrq5BpFrUC9zx3anUJVmYnzfBgatLaHuFwJIoQM=; b=MeMsZ2Kz3+N22ONp7xJJdeIa3c
        TxzeaBvytZxe5lZsUU7/PRh09m6PN0rMSD+AXcx0W7Zw+K/HZplH4dLiv7vjHaGVL/wnURlRmfqsb
        SmfsnDz6wgCM8nMQPbOfPOc58DUAIMMfABDj+Ep72V3HfCe5PL6KMXLIRLNZk2mQexLZHuYYRtP2G
        hxwTVAeNlqdtV2hqsr0Yh4llaW8LyiByO4IlxKfEBF0Mv4+FtAyUlYT2tyaoPctuuWrwqA8Ei0TZI
        /Jqe7hX6d5xGmGawyZmWc3cHqiKCx1Wza2MIFBQ5zeFhGz+D2QhSfLCV1gHKa5h8R6RvSYAIETlT0
        /XxWW/Jw==;
Received: from [200.68.140.36] (port=18749 helo=embeddedor)
        by gator4166.hostgator.com with esmtpa (Exim 4.92)
        (envelope-from <gustavo@embeddedor.com>)
        id 1j1cQb-001uRh-MN; Tue, 11 Feb 2020 14:46:41 -0600
Date:   Tue, 11 Feb 2020 14:49:16 -0600
From:   "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>
Cc:     linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Subject: [PATCH] leds: pwm: Replace zero-length array with flexible-array
 member
Message-ID: <20200211204916.GA20344@embeddedor>
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
X-Exim-ID: 1j1cQb-001uRh-MN
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [200.68.140.36]:18749
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 36
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
 drivers/leds/leds-pwm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pwm.c b/drivers/leds/leds-pwm.c
index af08bcdc4fd8..904a74ebbe6a 100644
--- a/drivers/leds/leds-pwm.c
+++ b/drivers/leds/leds-pwm.c
@@ -32,7 +32,7 @@ struct led_pwm_data {
 
 struct led_pwm_priv {
 	int num_leds;
-	struct led_pwm_data leds[0];
+	struct led_pwm_data leds[];
 };
 
 static void __led_pwm_set(struct led_pwm_data *led_dat)
-- 
2.25.0

