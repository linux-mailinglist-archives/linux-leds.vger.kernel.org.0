Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 33FD95E026
	for <lists+linux-leds@lfdr.de>; Wed,  3 Jul 2019 10:47:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727184AbfGCIrn (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Wed, 3 Jul 2019 04:47:43 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:50743 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727045AbfGCIrn (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 3 Jul 2019 04:47:43 -0400
Received: by mail-wm1-f68.google.com with SMTP id n9so1318904wmi.0
        for <linux-leds@vger.kernel.org>; Wed, 03 Jul 2019 01:47:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vToO8p1g9fcXX+PhVJh6ccrR2JJj+qaLGHac875fuoU=;
        b=ya7HF0SCJS7/lw63dHyStkFXeBgGqRCZr5oVuE2MJ4fjoX2KS14jmsuTRZSYk/27Wp
         +ugvp7jtNkcycrDNDT8HnmTYFSxjRbuUl/DcpEeD9J4Q9DW9npCkTvnUmCkc0Q5vIhfY
         ZMW7DYk5A/Oog+aqQRD6fhuV+8U7aud+caXVLw91OLAXH5qolczQ2sLITrEeg/7RewS8
         K5fuYkc/xfyFk2N5drRiUeNA0+Cdp/AJvtE5hSbYObZz4PpS0GItlYWt5/YZvDJ9mkg1
         STAbw69epP6gZPXrZwLKsfQJE8LruNlAEf0RA94wkzkbNBII3XP+ukymAYW5B7eKCSwd
         R1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=vToO8p1g9fcXX+PhVJh6ccrR2JJj+qaLGHac875fuoU=;
        b=I1x2+56EUC3FI6SoHvtbEex+zK5pBM11z0ChERJvrbi7fPFw01+eVUFQEh6ZEzPfv1
         jDqNjApYwtNrGPZwx7WCqXl1cs7N+MdJZyh6YBUCTiwIIHdbhcO6kzBBhWppcGlpBnTy
         LNpqzsp9fh5nLaCBfukc02adfWwMz8OqVsI1HBpw+g31nUo2aVSG23rXumgCURgBXvUu
         Iq4Gxij7CKYtUTGHXjS/q4apG2C9rJQPDbHT3yUQheiMkQ9bpMKJUcfqEpPfGn32JRDG
         jh77HmtWrlvIWWDoYdTb8aqxAp8zFpWKFe62X3EDfx5xan4s1qLWZkrb9Eq0sX0FA5q+
         RqBw==
X-Gm-Message-State: APjAAAXi4tXf8Ve3FJkBEhA8unKCfTPQUqz/d9vi+W32l0wbxZTAoVEV
        pR0kc8dJDSi+YFRhhwS0iSo=
X-Google-Smtp-Source: APXvYqxWyocLK7e4QV2o5aZyfxZMd2py5upZayOd6/FoAhxElUp8QUkZ4T5jht5X+E1+cBnlQ1+X/Q==
X-Received: by 2002:a7b:c4c1:: with SMTP id g1mr1534498wmk.14.1562143661194;
        Wed, 03 Jul 2019 01:47:41 -0700 (PDT)
Received: from debian-brgl.home ([2a01:cb1d:af:5b00:6d6c:8493:1ab5:dad7])
        by smtp.gmail.com with ESMTPSA id b2sm1797968wrp.72.2019.07.03.01.47.40
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Jul 2019 01:47:40 -0700 (PDT)
From:   Bartosz Golaszewski <brgl@bgdev.pl>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH] leds: max77650: add MODULE_ALIAS()
Date:   Wed,  3 Jul 2019 10:47:38 +0200
Message-Id: <20190703084738.9501-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

Define a MODULE_ALIAS() in the LED sub-driver for max77650 so that
the appropriate module gets loaded together with the core mfd driver.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
 drivers/leds/leds-max77650.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-max77650.c b/drivers/leds/leds-max77650.c
index 6b74ce9cac12..70166cd3816c 100644
--- a/drivers/leds/leds-max77650.c
+++ b/drivers/leds/leds-max77650.c
@@ -145,3 +145,4 @@ module_platform_driver(max77650_led_driver);
 MODULE_DESCRIPTION("MAXIM 77650/77651 LED driver");
 MODULE_AUTHOR("Bartosz Golaszewski <bgolaszewski@baylibre.com>");
 MODULE_LICENSE("GPL v2");
+MODULE_ALIAS("platform:max77650-led");
-- 
2.21.0

