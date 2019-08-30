Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 15D7EA336D
	for <lists+linux-leds@lfdr.de>; Fri, 30 Aug 2019 11:10:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727976AbfH3JKD (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Aug 2019 05:10:03 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:40477 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbfH3JKD (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 30 Aug 2019 05:10:03 -0400
Received: by mail-wr1-f65.google.com with SMTP id c3so6189362wrd.7;
        Fri, 30 Aug 2019 02:10:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6fnLh7tQX3N9usyfotPT6mkswbVLXc4JZHd92mBiSTI=;
        b=UThDoyvJovedyEVEXczjXIcorK/1oLmGtGTD5dB5j7I95uLfANogl2CrLnDudO2Vn3
         M9IAYsrZg9aJgwlP8mYO/GwcG9UR0QJ3B/buOOG1w+ymnCWnGnug9MpIiqRqD1j8URlL
         xBcxgiToiu/YsDj9MvWGOxNBYfVPhtFEJbt7BpCaYhrfNkK8oubZVDrYDOpypXBJRkZH
         ReZUVa0w6VY6SQj8bJPQbKP8o/Mm8xwFZ6Udw6v2wgmMhMwcdafjEhJdBTepXmUU/V/S
         v0OR37akbFwy4GyKY/NH3GsVcGZdyXVwfk+ZaVtgf4+Cvuo+pgbAQJRxECKguVnorRUl
         GF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=6fnLh7tQX3N9usyfotPT6mkswbVLXc4JZHd92mBiSTI=;
        b=qWDXcUtLA/LYyuGBondHGi9Jjb4UIWHqp13cI1xbW2MJnOHrzNdY84PMulATn+9H7S
         IHlUftB+dJ5KZ/WdAO31QLlQ4/ZEdb82ULqr+YwKcdBaZTOCu6nnEyt/nx5e6tdYrgjW
         wC13k6DjvhjEFoolL3czn7Q9PhYD6bP1nLkEcN7TTLKBHWrmWOtZXS0AVL3lxfTMIvah
         iES5R7zl9yMo94iGUctGu5gLKPDVSA14JlSaLh6jlB+5fcQy4usv1pUSv7NZwtANTwdO
         RML+7FGveKea8YjtDMsOzvgbpuyAz+AFjC1bjySFywn2u0caOZgDod38A+G0TZuIS830
         wNIg==
X-Gm-Message-State: APjAAAVKM1kIX5KC1fK7xPTV137CgM5kqlj5emkrXNhzOvyjac+81FBZ
        F2hZDRzJ+t+GUbTl5weEOUo=
X-Google-Smtp-Source: APXvYqxbABh+dd1Rf1D71USHqNcez973FQDDAf+AphQcfgWi+VoXc+1TvM51tIppmYXFVliCVYJnOw==
X-Received: by 2002:adf:f30e:: with SMTP id i14mr2486634wro.288.1567156200472;
        Fri, 30 Aug 2019 02:10:00 -0700 (PDT)
Received: from localhost.localdomain (ip5b4096c3.dynamic.kabel-deutschland.de. [91.64.150.195])
        by smtp.gmail.com with ESMTPSA id b144sm13108169wmb.3.2019.08.30.02.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 02:09:59 -0700 (PDT)
From:   Krzysztof Wilczynski <kw@linux.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] leds: Move static keyword to the front of declarations
Date:   Fri, 30 Aug 2019 11:09:58 +0200
Message-Id: <20190830090958.27108-1-kw@linux.com>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Move the static keyword to the front of declarations.

In drivers/leds/leds-lm3532.c for ramp_table, als_avrg_table
and als_imp_table, and in drivers/leds/leds-lm3532.c for
ramp_table.

This will resolve the following compiler warnings that can
be seen when building with warnings enabled (W=1):

drivers/leds/leds-lm3532.c:209:1: warning:
  ‘static’ is not at beginning of declaration [-Wold-style-declaration]

drivers/leds/leds-lm3532.c:266:1: warning:
  ‘static’ is not at beginning of declaration [-Wold-style-declaration]

drivers/leds/leds-lm3532.c:281:1: warning:
  ‘static’ is not at beginning of declaration [-Wold-style-declaration]

drivers/leds/leds-ti-lmu-common.c:14:1: warning:
  ‘static’ is not at beginning of declaration [-Wold-style-declaration]

Signed-off-by: Krzysztof Wilczynski <kw@linux.com>
---
Related: https://lore.kernel.org/r/20190827233017.GK9987@google.com

 drivers/leds/leds-lm3532.c        | 6 +++---
 drivers/leds/leds-ti-lmu-common.c | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-lm3532.c b/drivers/leds/leds-lm3532.c
index c5cfd8e3f15f..62ace6698d25 100644
--- a/drivers/leds/leds-lm3532.c
+++ b/drivers/leds/leds-lm3532.c
@@ -208,7 +208,7 @@ static const struct regmap_config lm3532_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
-const static int als_imp_table[LM3532_NUM_IMP_VALS] = {37000, 18500, 12330,
+static const int als_imp_table[LM3532_NUM_IMP_VALS] = {37000, 18500, 12330,
 						       92500, 7400, 6170, 5290,
 						       4630, 4110, 3700, 3360,
 						       3080, 2850, 2640, 2440,
@@ -265,7 +265,7 @@ static int lm3532_get_index(const int table[], int size, int value)
 	return -EINVAL;
 }
 
-const static int als_avrg_table[LM3532_NUM_AVG_VALS] = {17920, 35840, 71680,
+static const int als_avrg_table[LM3532_NUM_AVG_VALS] = {17920, 35840, 71680,
 							1433360, 286720, 573440,
 							1146880, 2293760};
 static int lm3532_get_als_avg_index(int avg_time)
@@ -280,7 +280,7 @@ static int lm3532_get_als_avg_index(int avg_time)
 				avg_time);
 }
 
-const static int ramp_table[LM3532_NUM_RAMP_VALS] = { 8, 1024, 2048, 4096, 8192,
+static const int ramp_table[LM3532_NUM_RAMP_VALS] = { 8, 1024, 2048, 4096, 8192,
 						     16384, 32768, 65536};
 static int lm3532_get_ramp_index(int ramp_time)
 {
diff --git a/drivers/leds/leds-ti-lmu-common.c b/drivers/leds/leds-ti-lmu-common.c
index e294a0b097e3..d7f10ad721ba 100644
--- a/drivers/leds/leds-ti-lmu-common.c
+++ b/drivers/leds/leds-ti-lmu-common.c
@@ -11,7 +11,7 @@
 
 #include <linux/leds-ti-lmu-common.h>
 
-const static unsigned int ramp_table[16] = {2048, 262000, 524000, 1049000,
+static const unsigned int ramp_table[16] = {2048, 262000, 524000, 1049000,
 				2090000, 4194000, 8389000, 16780000, 33550000,
 				41940000, 50330000, 58720000, 67110000,
 				83880000, 100660000, 117440000};
-- 
2.22.1

