Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 717AB78583
	for <lists+linux-leds@lfdr.de>; Mon, 29 Jul 2019 08:54:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727091AbfG2GyL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 29 Jul 2019 02:54:11 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40870 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726900AbfG2GyK (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 29 Jul 2019 02:54:10 -0400
Received: by mail-pf1-f196.google.com with SMTP id p184so27493956pfp.7
        for <linux-leds@vger.kernel.org>; Sun, 28 Jul 2019 23:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PfPOyQGoUrfE8GBocFzwq0dVyfFjB/YWNXXqpxjKWJo=;
        b=TIPIH68Vt9DBaVmaHfShryiHjLbHxn2lNF5HG+3RNgQ0EJC7PH0ZOnns/n5Vclh03w
         nmks7r0PtJVOgKuQ0NSE/di1zEU6Cqhc8BptzoebdQIdWAfOB5HsMc/d7fx9EgZWq9G0
         9QwmT/xweZw7BulRN0FFSZKeqsIoTItsPPfoIdlT4YykInOgu/t9RxU+k0taWuu7xgC+
         E1jxfxrKMdkTE4MlPIbPJtZf3BDDm2ukd3W6qI/19FwoTLrQ58fvjDBJLRVBsEo8yoUo
         hMTGAsfSOrp/8Hkhypu7+6+ZXHaXlSd1DvlwnU9EIBu2W3imd6tuWGq3XN+oe9pdj3Hg
         cspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=PfPOyQGoUrfE8GBocFzwq0dVyfFjB/YWNXXqpxjKWJo=;
        b=hhY0CJyxYVbLYhTnGRxBcRGNKM6nQSJFci4KibhRhFe646WSAoYlIxIQ8iyEF6C0Va
         EXO5sRww934PFpnCBeUxl+rgCY5DMJSYjk2Xslj+UQ0d9g0AdFmz9Xtk4Q+dHHYURJHd
         t2mCdM2PJMb7myspcuBj+4l32es1AS7ao39WXhIYHd4iTYkoKd0zIVAKEscjBRI14qWY
         UIxXwFYjpZ66ZDGEiwSS07KUlgR3WUtPOCja5Ug287J49FdQgYdV7UCr+o5E0eFDinwA
         tM6FmtyZO4kGR+rk5ZV6ADaJAR5/E2Uh9zdTY6epSLtaZjVjjFXmXtmEOlh4tSeuAJla
         M/TA==
X-Gm-Message-State: APjAAAX4NL71n18FMAKxZX0ivsV/GXhkzSjWv4/LKSbnfbelhtlO/ilu
        AKgRERitqb+tRqwB9WSMaKWavZMl
X-Google-Smtp-Source: APXvYqw/szhgmBVMO45JIcTPb2eVr2KxVt3UDd1WVm0fY1BWN3qesppTXVwAiwO9x/poQVkGvW/ykw==
X-Received: by 2002:a62:14c4:: with SMTP id 187mr34032760pfu.241.1564383249897;
        Sun, 28 Jul 2019 23:54:09 -0700 (PDT)
Received: from localhost.localdomain ([157.40.39.227])
        by smtp.gmail.com with ESMTPSA id e11sm72977343pfm.35.2019.07.28.23.54.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Sun, 28 Jul 2019 23:54:09 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH] leds: netxbig: Add of_node_put() in netxbig_leds_get_of_pdata()
Date:   Mon, 29 Jul 2019 12:23:56 +0530
Message-Id: <20190729065356.26793-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The variable gpio_ext_np in the function netxbig_leds_get_of_pdata takes
the value returned by of_parse_phandle; hence, it must be put in order
to prevent a memory leak. Add an of_node_put for gpio_ext_np before a
return statement, and move a pre-existing of_node_put statement to right
after the last usage of this variable.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
 drivers/leds/leds-netxbig.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index 10497a466775..654d83bbc450 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -388,12 +388,14 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 	}
 
 	gpio_ext = devm_kzalloc(dev, sizeof(*gpio_ext), GFP_KERNEL);
-	if (!gpio_ext)
+	if (!gpio_ext) {
+		of_node_put(gpio_ext_np);
 		return -ENOMEM;
+	}
 	ret = gpio_ext_get_of_pdata(dev, gpio_ext_np, gpio_ext);
+	of_node_put(gpio_ext_np);
 	if (ret)
 		return ret;
-	of_node_put(gpio_ext_np);
 	pdata->gpio_ext = gpio_ext;
 
 	/* Timers (optional) */
-- 
2.19.1

