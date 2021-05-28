Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7C72393F54
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 11:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236488AbhE1JIm (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 05:08:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45240 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236491AbhE1JI1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 05:08:27 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8200FC061354
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:06:47 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id c3so2521854wrp.8
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=GLZXBhmwHs3m982hWlJhp8h3QkAX722ImZXcYdfXoKY=;
        b=A+CpxW+t5xcY16+9v7nPOjbvDZQnx1tQNWUUV1uv7hswRzoUvpJkaYsIz7fv3N8ISr
         gCw0g1cxV3pE1fxDXl4kdTOAD7WR57fjaIVENWQhTOMSu8rV6v+ikBCH1nhZUW22kKcf
         HgjcEPekQgLE3PMCAQ8qHZP014z7OQk31NJTkGkME1xe8KqLEa50J0Uv8pFIHpwvUbHI
         cmXvxBktTZdZz49VS/CqfRiBOgcm8t/YpEnnImS1m81jX2yqiEtu8LHd8Fjype/1q2qh
         HVv59s2M93U22PPmOmw8NrGjjSSFI8WTW+eElmTM5MikwZv0ZPBlMJy4rmWxWbJ5YFBz
         6IrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=GLZXBhmwHs3m982hWlJhp8h3QkAX722ImZXcYdfXoKY=;
        b=e7eQAoNOykv5CdETQDvCP6zYjlgM/akA0L7W7Q71tYnTMc8qo31nQhb/OBnZf6K2iU
         ogSveKylkpfNNXKTOeGUrQodNhFxGsrmru+G8GuCi3ZsoxiqzFxnf2yNVCQlhkt0mWVS
         BNhrhpLRVHlsS6aW/UUGvqo5ALKtLQzh9aowd4C+u+6E+PDOj/a7JOLK6b8VNqacFdat
         thJLyTwt/tgOnnpPVs5Sp1XjyRcYkoDy0efLhZ0CSrIXWsFicMwigVhy58tJE9arICyb
         LfMi0uBThVWqHUSo78BBEk9+XVS/nQ+ut+g9jZuek9K67i3iMNrKZ5r9pK4qnB7ZIxJQ
         CuRQ==
X-Gm-Message-State: AOAM531RUDof+wEbgjg5phP63FkwPbbxV+m0lA05M4UsNuAUpl8SXqwM
        q09ALjasjpyy8J4p5XX4u5wb0w==
X-Google-Smtp-Source: ABdhPJyPSI/iszCB7O7e9Ltvnz8LSoQ5LP3n5DfEr3H33CCkgqkTreTcNBeAVp/JdNtHr3efPdVhDA==
X-Received: by 2002:a5d:6e92:: with SMTP id k18mr823317wrz.94.1622192806109;
        Fri, 28 May 2021 02:06:46 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id m132sm6105911wmf.11.2021.05.28.02.06.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 02:06:45 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Dan Murphy <dmurphy@ti.com>,
        linux-leds@vger.kernel.org
Subject: [PATCH 14/15] leds: leds-lm3692x: Demote non-complete kernel-doc
Date:   Fri, 28 May 2021 10:06:28 +0100
Message-Id: <20210528090629.1800173-15-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528090629.1800173-1-lee.jones@linaro.org>
References: <20210528090629.1800173-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Needs updating by the author to re-promote.

Fixes the following W=1 kernel build warning(s):

 drivers/leds/leds-lm3692x.c:121: warning: Function parameter or member 'boost_ctrl' not described in 'lm3692x_led'
 drivers/leds/leds-lm3692x.c:121: warning: Function parameter or member 'brightness_ctrl' not described in 'lm3692x_led'
 drivers/leds/leds-lm3692x.c:121: warning: Function parameter or member 'enabled' not described in 'lm3692x_led'

Cc: Pavel Machek <pavel@ucw.cz>
Cc: Liam Girdwood <lgirdwood@gmail.com>
Cc: Mark Brown <broonie@kernel.org>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/leds/leds-lm3692x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-lm3692x.c b/drivers/leds/leds-lm3692x.c
index a2ab6bd5de111..f386766b2c4c1 100644
--- a/drivers/leds/leds-lm3692x.c
+++ b/drivers/leds/leds-lm3692x.c
@@ -95,7 +95,7 @@
 #define LM3692X_FAULT_FLAG_SHRT BIT(3)
 #define LM3692X_FAULT_FLAG_OPEN BIT(4)
 
-/**
+/*
  * struct lm3692x_led
  * @lock: Lock for reading/writing the device
  * @client: Pointer to the I2C client
-- 
2.31.1

