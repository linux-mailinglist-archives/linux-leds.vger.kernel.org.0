Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BC19D63A37
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jul 2019 19:34:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbfGIRed (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 9 Jul 2019 13:34:33 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:42092 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfGIRed (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 9 Jul 2019 13:34:33 -0400
Received: by mail-pg1-f193.google.com with SMTP id t132so9795601pgb.9
        for <linux-leds@vger.kernel.org>; Tue, 09 Jul 2019 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CGG3HoLHZpHBLNS37Lh0pMFQmZu9nHvRs7BZvQWECO8=;
        b=DXumJdQorc3PjtIwwXDtEF9AefRkRVsq20v1PjMstI13DuZHJgsgAtdcGFoy/ZuN4U
         jZ+OSGg561FVOqE2htTitna4YZkIk7Eavyt8rM6FSZ7nNiC5XalvS13+vB43Y7i0OFPs
         aUZi51qGwj2jyJMpk/29fcKl3VctLdXybjzYtoHLAT+m+1nyn9Gi8kJntu6C7nyrJEnr
         pYI3euL/iCr6rriPdlDlU3isZazR13pcAj26CiNJXUJL66CbYsYgDF4Y7+nHmxAJEV99
         ESkZ5LzobEfJ5pQnfCKLdkNtxHA6zC+ZaTE2i7BjKiQPQTAGZG/oT8RhZbZ7+YPIuAga
         oArw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CGG3HoLHZpHBLNS37Lh0pMFQmZu9nHvRs7BZvQWECO8=;
        b=W4rD9V9wjZjfd5IdEsr6uqneG8pJH0fslFeZ6b3kl91n1JKxB8puweifR8jTdaQtuE
         HDzwPP3/DYfIWySs0N9DIna/dJy1DBlhxzXxlxkkkAcr6t9XWDkm2QzH28h3cCuXKSN2
         gVhilZrhm/pPFUE3sA0+bDVwcWZeWFnxLfuWNKSxi6CTht4VUDbgbvLxD1Ck+z6T+JD9
         QI1gLOSTdJohMLEoeykHdxwX4AajZjrERiFo4wffqSVSUxTe3Ko5iZkhw7bylWhZhsvX
         fXaNn7p1UkETF5E49wf6+8JaNy+c2JT0d1lrQqZQ13oC3JgcBefO1Mb+8+P/grT1M6j3
         yhLQ==
X-Gm-Message-State: APjAAAXZf1g9We2khqgN/UKBpUZglnYr06ZV6GH/JP13K0Pq/aoBU/lN
        5L9hSGvDEK8/EyHTBcPXhzo+ra0p
X-Google-Smtp-Source: APXvYqwxhd0OgtbhnxfcoGBVj7LZfje9DW5zJZfgQbOhtie/tZ178mv1DA2RBqJMEYBs7ciDxlPSYQ==
X-Received: by 2002:a17:90a:1b4a:: with SMTP id q68mr1344411pjq.61.1562693672588;
        Tue, 09 Jul 2019 10:34:32 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
        by smtp.gmail.com with ESMTPSA id j6sm3793213pjd.19.2019.07.09.10.34.30
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 09 Jul 2019 10:34:32 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] leds: leds-ns2: Add of_node_put() before return
Date:   Tue,  9 Jul 2019 23:04:20 +0530
Message-Id: <20190709173420.13949-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a return from the middle of the loop, there is no put, thus
causing a memory leak. Hence add an of_node_put before the return in
four places.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/leds/leds-ns2.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index f92e2c07c1c6..6e47c21ef1c4 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -263,12 +263,16 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
 		struct ns2_led_modval *modval;
 
 		ret = of_get_named_gpio(child, "cmd-gpio", 0);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(child);
 			return ret;
+		}
 		led->cmd = ret;
 		ret = of_get_named_gpio(child, "slow-gpio", 0);
-		if (ret < 0)
+		if (ret < 0) {
+			of_node_put(child);
 			return ret;
+		}
 		led->slow = ret;
 		ret = of_property_read_string(child, "label", &string);
 		led->name = (ret == 0) ? string : child->name;
@@ -281,6 +285,7 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
 		if (ret < 0 || ret % 3) {
 			dev_err(dev,
 				"Missing or malformed modes-map property\n");
+			of_node_put(child);
 			return -EINVAL;
 		}
 
@@ -289,8 +294,10 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
 				      num_modes,
 				      sizeof(struct ns2_led_modval),
 				      GFP_KERNEL);
-		if (!modval)
+		if (!modval) {
+			of_node_put(child);
 			return -ENOMEM;
+		}
 
 		for (i = 0; i < num_modes; i++) {
 			of_property_read_u32_index(child,
-- 
2.19.1

