Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C3CDEA3D71
	for <lists+linux-leds@lfdr.de>; Fri, 30 Aug 2019 20:11:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727958AbfH3SLJ (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 30 Aug 2019 14:11:09 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33220 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727914AbfH3SLI (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 30 Aug 2019 14:11:08 -0400
Received: by mail-wm1-f67.google.com with SMTP id r17so7015408wme.0;
        Fri, 30 Aug 2019 11:11:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BsJZbGRix7+5K1tjuemItaLs8H0bgUtBBklvyw8W7P8=;
        b=XNcG6L9wNxDTPPidflouySHa0BUqIADKv5TRCPgfVTz9WWR1MlwkriC8oIBTNywlI7
         xyuDF0SnYoUOtIQeaOgj9nKXCCN34KyDTp7FgnVd41vNOEUAm1Mavht+7ajuuDgNMwdp
         WEcWTw5xYnziVfTrD6pPBFvgbXx7uI4D3QoULcAxRJIaL7iWObNy8+Hv7y7rz+DVS0C8
         MvxRNKqDaLJkXT0JUDjl2VIXd9eN8MjNqUAlyOWMNoioeCboT1sGLwhptviKr94AIrTG
         44X4LSn0cZC85cEO6V7PYHDZ+XuaY51kpHFdbalrcUh3EErqmGtsS9eIpmYVg7+5pVFA
         7YiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :in-reply-to:references:mime-version:content-transfer-encoding;
        bh=BsJZbGRix7+5K1tjuemItaLs8H0bgUtBBklvyw8W7P8=;
        b=fV2rHiOY54Oj6fWYyZoO2W09WrjDOw3UTLvKlPAEqktK6u23pW+Ood3/LmrEo000YD
         +dfdp0sVzVrFXwlQ/KKkDF2XwR5lWGfIVpnAgHg4a0v1lUqqX5XRc6p1JsSZA1TBQL5Q
         5SGVaF2tWcabA7WTTXPWn9VYhfYz045qf5a6BHb65dPEou6fBOkV5U0vVphDUW5vYR86
         0sKTR17ngh6VtQMPYmTJxD5BpP/hOityreRWxWNIjR3MEFRM/ifjxEt6KGgkgJGbW6x+
         Uo8ch7Uw5qs+zlMzqW1+8+SkL/7pq5+by3py8Tbl9mMmQLcrQNWRW/RifUAxdI056n/X
         tbSQ==
X-Gm-Message-State: APjAAAW2aCeM5rI+9ylPDBHuLhXwONubCiFFamPmu4edRiv6UZTYfozm
        npIJBHnaR2pvXW3WTz6pTYMl4JANjeNtbA==
X-Google-Smtp-Source: APXvYqyWCPkBzHzec5bJNWYUlJHNk103XoUkzyRvQIycJHoMl1G2LheAbNyT3LiW/YX3OjQuaWYqog==
X-Received: by 2002:a1c:1fc7:: with SMTP id f190mr13249103wmf.62.1567188666677;
        Fri, 30 Aug 2019 11:11:06 -0700 (PDT)
Received: from localhost.localdomain (ip5b4096c3.dynamic.kabel-deutschland.de. [91.64.150.195])
        by smtp.gmail.com with ESMTPSA id t8sm14591211wra.73.2019.08.30.11.11.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2019 11:11:05 -0700 (PDT)
From:   Krzysztof Wilczynski <kw@linux.com>
To:     Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] leds: lm3532: Move static keyword to the front of declarations
Date:   Fri, 30 Aug 2019 20:11:03 +0200
Message-Id: <20190830181104.5813-1-kw@linux.com>
X-Mailer: git-send-email 2.22.1
In-Reply-To: <20190830090958.27108-1-kw@linux.com>
References: <20190830090958.27108-1-kw@linux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-leds-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Move the static keyword to the front of declarations ramp_table,
als_avrg_table and als_imp_table, and resolve the following
compiler warnings that can be seen when building with warnings
enabled (W=1):

drivers/leds/leds-lm3532.c:209:1: warning:
‘static’ is not at beginning of declaration [-Wold-style-declaration]

drivers/leds/leds-lm3532.c:266:1: warning:
‘static’ is not at beginning of declaration [-Wold-style-declaration]

drivers/leds/leds-lm3532.c:281:1: warning:
‘static’ is not at beginning of declaration [-Wold-style-declaration]

Signed-off-by: Krzysztof Wilczynski <kw@linux.com>
---
Related: https://lore.kernel.org/r/20190827233017.GK9987@google.com

 drivers/leds/leds-lm3532.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

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
-- 
2.22.1

