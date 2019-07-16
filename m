Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3E22A6A2DE
	for <lists+linux-leds@lfdr.de>; Tue, 16 Jul 2019 09:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726528AbfGPHYi (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Tue, 16 Jul 2019 03:24:38 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:35580 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726463AbfGPHYi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 16 Jul 2019 03:24:38 -0400
Received: by mail-pg1-f196.google.com with SMTP id s1so2671235pgr.2
        for <linux-leds@vger.kernel.org>; Tue, 16 Jul 2019 00:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kdV0GjxaWO6Y8iHlzAUy39ZOtzGux2+F/UOJkAqaCPk=;
        b=pmOnu209A5IGEbSFYWfPNlVs/lhog4i6+muFMjp3iF9I8qYCh0m06zpveXRjb8jGA7
         sAXsiWy1CL1R3UHhE3G4PvAVnPgVEj7vhuQMi9zbgdzdx58onomqw8FxdBo3hI8o+MD/
         dQfr0C98yk6TLmGicd3vn47G/naCgCKxqU8VThTzbBl6aTSCcJ5itJcLNDAj0G7BRirU
         FGZ4taNXjs+eT1157FKa7YHELdWDNTSVAr+a6Cm6bRTrxgWa65j0WLkrluUZEUehTmd4
         WqDepnUqbwa/lIzLHQeW+tR2m6Wrcb6gXhuvHSMagStLQ2uSGf5JMhakskwvyqEQiSfk
         jjSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kdV0GjxaWO6Y8iHlzAUy39ZOtzGux2+F/UOJkAqaCPk=;
        b=cuc3dy5+zvk+ebbIw/uqcf/gAMLFmLqdRd/6iMBnWtGJFheWqwCALkbInX3dxIhMI5
         fNi43lK8pu/NiuGTMHcRMc8C3uy8MmPDvMx5uf4c4suRSSaMaEPzL9Sr8hdtjSnDdkvn
         J7rUUmmqguNcMeuPYZvcQ3kKo24+YiOxD7FhnhXJQHyTjIYBBP8Y++8EDCP/yUBtpc2q
         AXMF+jLEoCR/xU2GLp6uk20wvsS7rU6CdYilCFXv7sEyZs6LLvhcZRazOGGy7fLNi8td
         YWKUhtpfCa/UKZQMNCKfm5k9AYshEKtLgYsK/MOSvsEWVF3lEqOHHlef93snPJAO02ZW
         /yng==
X-Gm-Message-State: APjAAAUj411D5LmOXibDgpzkkEt1S/qlt31hKVV/6XgUyWzZIsv0Q0u/
        icalIZj+owOyBCD5AoH07To=
X-Google-Smtp-Source: APXvYqzd1Ap46L/A/u6qceQSIMxyJkoGD6uqwWhtwLjRduvWqkPZNhMlvDmlnYddBNRHmFafqJ01bQ==
X-Received: by 2002:a17:90a:bf08:: with SMTP id c8mr34271062pjs.75.1563261877730;
        Tue, 16 Jul 2019 00:24:37 -0700 (PDT)
Received: from localhost.localdomain ([110.227.64.207])
        by smtp.gmail.com with ESMTPSA id 81sm30615165pfx.111.2019.07.16.00.24.34
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 00:24:37 -0700 (PDT)
From:   Nishka Dasgupta <nishkadg.linux@gmail.com>
To:     jacek.anaszewski@gmail.com, pavel@ucw.cz, dmurphy@ti.com,
        linux-leds@vger.kernel.org
Cc:     Nishka Dasgupta <nishkadg.linux@gmail.com>
Subject: [PATCH v2] leds: ns2: Add of_node_put() before return
Date:   Tue, 16 Jul 2019 12:54:24 +0530
Message-Id: <20190716072424.14676-1-nishkadg.linux@gmail.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Each iteration of for_each_child_of_node puts the previous node, but in
the case of a return from the middle of the loop, there is no put, thus
causing a memory leak. Hence create a new label, err_node_put, that puts
the previous node before returning the required value. Edit the mid-loop
return sites to instead go to this new label.
Issue found with Coccinelle.

Signed-off-by: Nishka Dasgupta <nishkadg.linux@gmail.com>
---
Changes in v2:
- Put the of_node_put statement under a label instead of at each return
  site.
- Modify subject line to reflect previous patches on this driver.

 drivers/leds/leds-ns2.c | 17 ++++++++++++-----
 1 file changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/leds-ns2.c b/drivers/leds/leds-ns2.c
index f92e2c07c1c6..83cdce0f801a 100644
--- a/drivers/leds/leds-ns2.c
+++ b/drivers/leds/leds-ns2.c
@@ -264,11 +264,11 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
 
 		ret = of_get_named_gpio(child, "cmd-gpio", 0);
 		if (ret < 0)
-			return ret;
+			goto err_node_put;
 		led->cmd = ret;
 		ret = of_get_named_gpio(child, "slow-gpio", 0);
 		if (ret < 0)
-			return ret;
+			goto err_node_put;
 		led->slow = ret;
 		ret = of_property_read_string(child, "label", &string);
 		led->name = (ret == 0) ? string : child->name;
@@ -281,7 +281,8 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
 		if (ret < 0 || ret % 3) {
 			dev_err(dev,
 				"Missing or malformed modes-map property\n");
-			return -EINVAL;
+			ret = -EINVAL;
+			goto err_node_put;
 		}
 
 		num_modes = ret / 3;
@@ -289,8 +290,10 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
 				      num_modes,
 				      sizeof(struct ns2_led_modval),
 				      GFP_KERNEL);
-		if (!modval)
-			return -ENOMEM;
+		if (!modval) {
+			ret = -ENOMEM;
+			goto err_node_put;
+		}
 
 		for (i = 0; i < num_modes; i++) {
 			of_property_read_u32_index(child,
@@ -314,6 +317,10 @@ ns2_leds_get_of_pdata(struct device *dev, struct ns2_led_platform_data *pdata)
 	pdata->num_leds = num_leds;
 
 	return 0;
+
+err_node_put:
+	of_node_put(child);
+	return ret;
 }
 
 static const struct of_device_id of_ns2_leds_match[] = {
-- 
2.19.1

