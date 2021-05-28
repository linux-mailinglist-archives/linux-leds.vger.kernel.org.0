Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 241DE393F52
	for <lists+linux-leds@lfdr.de>; Fri, 28 May 2021 11:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236631AbhE1JIk (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 28 May 2021 05:08:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236161AbhE1JI0 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 28 May 2021 05:08:26 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5239C061760
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:06:44 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id f17so270930wmf.2
        for <linux-leds@vger.kernel.org>; Fri, 28 May 2021 02:06:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=qo0P3VAUaaC0rGaccceg1Xwi3VOmQzxxnDFSUtDbQVY=;
        b=xkMc8n03C9qNMBP/ffDVyelt5dkLTk0NiMhYljGoR9aSGgQ9Cs4GyIJmg18iZB2QTS
         ywpN6CG8rPcBrlOQPylthnjZSEQBfHZYL95JU0Vefkra+p1LqvDZKZc5CpJtxgMXqzjj
         XrQwfzp+S30Xwf9eOg69yPkLUkm14RL/vJHfIyuCoWP6j6AcVgunnc/RFnlE73AEcMtm
         vJabvm6+dlKL3OWCZHz2FGFA86bo9k25qMtJhA8AZxXXH93C3/eW+4nZcg8VNIFI3BNV
         faRaKQX+SzN65xqgCNBxGl0Hw1W0QHyK1dJJmcJPkji1eskeJs08uCI+goiABDlKS9Uc
         8V2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=qo0P3VAUaaC0rGaccceg1Xwi3VOmQzxxnDFSUtDbQVY=;
        b=Su4YFgtb9sk+xBiVBpa2yk/yxlWqpdFr01pTcN2Pc+AilbyCwzDupdi8Wy8+nqMxYW
         5Dd+Pozte29EndfX0Xqm1DgQDagxXtBBGPOlL9BE5aJgEoxCAn1bmMUyVsew02R4jzqW
         bZZ0FzR4xWo8LRpORLYkwGSsYN+jIr+17L/b0cUJ71iqhd0zURO8y6mA5wJdlXwvjl6/
         rHlO9fqousFFxR7bLcuMFa/6C26XBAgiTEL8fRxSI/oc2vpUM9ZyaK33CmYU07NMOdA3
         n5fQ6kTMqjjfmAyrbnVzLaQKJ7MuKmd8QW56cR6mQ67w0K/bms54t3XzY7FMce05bh8v
         F9RQ==
X-Gm-Message-State: AOAM531Tk4c8kOLsOvxIO+/2rSbmSPz95CO2GTdv9EJQb10lawCrD3Le
        25g2biapclqp4XNp0FeE6+hmng==
X-Google-Smtp-Source: ABdhPJyU6zXR8SFXvZz50vH8VHCtYys5A47i8rDLyIqLHxAtoL+cffb40Ec70xnTYtFPcIueYqwCHA==
X-Received: by 2002:a7b:c24a:: with SMTP id b10mr12362865wmj.157.1622192803306;
        Fri, 28 May 2021 02:06:43 -0700 (PDT)
Received: from dell.default ([91.110.221.223])
        by smtp.gmail.com with ESMTPSA id m132sm6105911wmf.11.2021.05.28.02.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 May 2021 02:06:42 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     lee.jones@linaro.org
Cc:     linux-kernel@vger.kernel.org, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, linux-leds@vger.kernel.org
Subject: [PATCH 11/15] leds: leds-lm3697: Provide some missing descriptions for struct members
Date:   Fri, 28 May 2021 10:06:25 +0100
Message-Id: <20210528090629.1800173-12-lee.jones@linaro.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210528090629.1800173-1-lee.jones@linaro.org>
References: <20210528090629.1800173-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fixes the following W=1 kernel build warning(s):

 drivers/leds/leds-lm3697.c:60: warning: Function parameter or member 'enabled' not described in 'lm3697_led'
 drivers/leds/leds-lm3697.c:60: warning: Function parameter or member 'num_leds' not described in 'lm3697_led'
 drivers/leds/leds-lm3697.c:84: warning: Function parameter or member 'bank_cfg' not described in 'lm3697'
 drivers/leds/leds-lm3697.c:84: warning: Function parameter or member 'num_banks' not described in 'lm3697'

Cc: Pavel Machek <pavel@ucw.cz>
Cc: Dan Murphy <dmurphy@ti.com>
Cc: linux-leds@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/leds/leds-lm3697.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/leds/leds-lm3697.c b/drivers/leds/leds-lm3697.c
index 7d216cdb91a8a..0d10d12134479 100644
--- a/drivers/leds/leds-lm3697.c
+++ b/drivers/leds/leds-lm3697.c
@@ -47,6 +47,8 @@
  * @lmu_data: Register and setting values for common code
  * @control_bank: Control bank the LED is associated to. 0 is control bank A
  *		   1 is control bank B
+ * @enabled: LED brightness level (or LED_OFF)
+ * @num_leds: Number of LEDs available
  */
 struct lm3697_led {
 	u32 hvled_strings[LM3697_MAX_LED_STRINGS];
@@ -68,6 +70,8 @@ struct lm3697_led {
  * @dev: Pointer to the devices device struct
  * @lock: Lock for reading/writing the device
  * @leds: Array of LED strings
+ * @bank_cfg: OUTPUT_CONFIG register values
+ * @num_banks: Number of control banks
  */
 struct lm3697 {
 	struct gpio_desc *enable_gpio;
-- 
2.31.1

