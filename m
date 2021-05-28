Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8FF10393F47
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 11:07:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236555AbhE1JIa (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 05:08:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236519AbhE1JIP (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 05:08:15 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A3B3C061345
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:06:38 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id x8so2514397wrq.9
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:06:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=flWkEvuyWcSWIehnz5RywDGRAA/KaDRdI7W1OSESvMU=;
        b=N7DNOKE1+iD8ct5UbAYF1i+FbbX6L3oE0dq3C1Ur3V+MmQmE/Dadn+x0H0xtaRCG/U
         bDoc3pEMC2klFvGV5r/s1ATH/Gn8OeZfNY8cUmvLTCAJWzDfawAoMgPvU1miyTZXViNI
         1xcWJQENF/QQXujVAQcC9hnBAxSzFzJHu9OGS0AX3utGnUOrZrWOYXkVazdNQ72cE6aY
         b3J8+kxm1ZezBhm9QGacpTl3nGMIHQa2a6L0x1iBdC5ZPfJKlQlzVgKoGMHlAZ4e/Aeb
         ElwVDOclzc7n8YOEfHWcMbOnEHkwllCyVaMwL70SliomfxCfAbpWGiBn6TypNpQnftBp
         VRfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=flWkEvuyWcSWIehnz5RywDGRAA/KaDRdI7W1OSESvMU=;
        b=hoBKi4n3qy2PbtRy55hQBb0+JAFngo+CLbz6/8ATFgxclfc3BgQA+JzZgN2YPR4dDg
         T3zsetiBEvnyeolsArCLCS0jNScorslU+0XEiTPhMJ2Y6YL1oIwjeQhynwDVjSy+EfOH
         n15POjJbNT4I40AdmYt6hMzYXhWz4fIGOylqBfOKoGRadgPdMBeGO8p26gJDj0WzcHqe
         rjhdSDzYJrMP9IS7/8knVGdE8hB02xZjmgf90G/bGNCvMsbkKDCwPspxl/pRfJ2ZnRl1
         S9jZA9MRG2ewwfP46+JY7ruhBEHnWGKnEVxRBdDOH0cVtT7Os+Qm6u9h9ELm5PsCgWW+
         tKVw==
X-Gm-Message-State: AOAM530qDtJ5IoS8iu/g0IcZI0YxFbTBT1COnlFhvAhikeniLs9L9zVt
        dBwMsCi09TIrmcSPFEK9NrvV5w==
X-Google-Smtp-Source: ABdhPJwvni6BEcxdc2txs0qIKQHQDLukoLHzIgV658ueYUmKWHQN5ymZssb6iUC8NYILMoCFJi1PWg==
X-Received: by 2002:a5d:4151:: with SMTP id c17mr7671732wrq.262.1622192797055;
        Fri, 28 May 2021 02:06:37 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id m132sm6105911wmf.11.2021.05.28.02.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 02:06:36 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-leds@vger.kernel.org
Subject: [PATCH 05/15] leds: leds-as3645a: Fix function name 'as3645a_set_current()'
Date:   Fri, 28 May 2021 10:06:19 +0100
Message-Id: <20210528090629.1800173-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528090629.1800173-1-lee.jones@linaro.org>
References: <20210528090629.1800173-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/leds/leds-as3645a.c:198: warning: expecting prototype for as3645a_set_config(). Prototype was for as3645a_set_current() instead

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Pavel Machek <pavel@ucw.cz>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/leds/leds-as3645a.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-as3645a.c b/drivers/leds/leds-as3645a.c
index e8922fa033796..c41937ff8fd33 100644
--- a/drivers/leds/leds-as3645a.c
+++ b/drivers/leds/leds-as3645a.c
@@ -185,7 +185,7 @@ static int as3645a_read(struct as3645a *flash, u8 addr)
  */
 
 /**
- * as3645a_set_config - Set flash configuration registers
+ * as3645a_set_current - Set flash configuration registers
  * @flash: The flash
  *
  * Configure the hardware with flash, assist and indicator currents, as well as
-- 
2.31.1

