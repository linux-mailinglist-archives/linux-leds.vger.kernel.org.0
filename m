Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2989C39B14A
	for <lists+linux-leds@lfdr.de>; Fri,  4 Jun 2021 06:19:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229474AbhFDEVL (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Fri, 4 Jun 2021 00:21:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55640 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbhFDEVL (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Fri, 4 Jun 2021 00:21:11 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08162C06174A
        for <linux-leds@vger.kernel.org>; Thu,  3 Jun 2021 21:19:26 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id h12-20020a17090aa88cb029016400fd8ad8so5138141pjq.3
        for <linux-leds@vger.kernel.org>; Thu, 03 Jun 2021 21:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=6NIcNIw0OVJvBwtgy0wjLvb3KiHAfCLN0V7S2OeoMU4=;
        b=PLvZRZBtkOT3pUmi74jBu7hWC4jWRVKYTM4RZfz4ZRQ5Jl9WW7f2HIf7PKESbtIPjV
         WCAVWJo6sJp6w+sJGqb0EHcSsaVbBrL4yUDIKd2+RhdFkZKQbt+pbiD2CxKWzWln14cy
         f8i/s+EHSKOgPXb5zg4hydYVF1SCogyEpbtJC/sC3dflKO06aofruKbeVCRHvx6CoVKS
         H4atfxTACORpTDRNoKVsHjeArV2tFMCRizE4GQ1T2iFJ/mloYi6GURUfa99DX6eHIKfS
         +h+ReVpEDAvUW5zCAfer7hqQl+XR2UodVD3JnA0ifnMQ6WESVpNQiJtCaNNC34+9Ml8m
         fVAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=6NIcNIw0OVJvBwtgy0wjLvb3KiHAfCLN0V7S2OeoMU4=;
        b=mFZ09Prrp//9/LGtoOyIcgYpPrc6tO4bW5bmrAqKuGBHmO3sLSdQhXDKVe80IxcgKY
         ljQn14D7ctfCnBxG+oL5CvBMgkzpNK/tFhSYY1LQmdrvWd+sn3kHRxGvmJgP/aQmrCgV
         e1YzkvDJqwJ787chRyIDSFXNp//yBhmDU+InJOfTBTYEwS+ztSKX0ianTSYVUvyEn3Wf
         mOH4PcU4F6Ys2SK3XEQN5k1iKHEH8e6XZoLlERCSRCD84XMk6S3rP1A4SCFeY2Ifj/9c
         56KacSc5vDejs9eKeLjieULKHvWOHELoLZJ4mQKK/ikhskxIFujCQSebngkVBxJUiZ8j
         0Rqw==
X-Gm-Message-State: AOAM532pdBwSizpa1BzXEB/0FUA+TfaznqvtDen9ylUbWE4msTpf79V1
        NkECY6OwpwsgKujv4HO3iW3Plns4hDA=
X-Google-Smtp-Source: ABdhPJzWvpm6eFuEGPvvlZ25Djxs8LgF+aBtKm/V2KoxZbUuT0p+mcI2vO46oNRu/uGKO3UQySCTyQ==
X-Received: by 2002:a17:90b:e8e:: with SMTP id fv14mr14831715pjb.29.1622780365477;
        Thu, 03 Jun 2021 21:19:25 -0700 (PDT)
Received: from voyager.lan ([45.124.203.14])
        by smtp.gmail.com with ESMTPSA id z22sm528870pfa.157.2021.06.03.21.19.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jun 2021 21:19:24 -0700 (PDT)
Sender: "joel.stan@gmail.com" <joel.stan@gmail.com>
From:   Joel Stanley <joel@jms.id.au>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
        Andrew Jeffery <andrew@aj.id.au>,
        Vishwanatha Subbanna <vishwa@linux.vnet.ibm.com>,
        linux-leds@vger.kernel.org
Subject: [PATCH v3] leds: pca955x: Allow platform data to set full name
Date:   Fri,  4 Jun 2021 13:48:30 +0930
Message-Id: <20210604041830.221635-1-joel@jms.id.au>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The PCA955x driver since it was merged has added a "pca955x:" prefix to
LED names. This means platform data (such as the device tree) cannot
fully control the name. This patch drops the hardcoded prefix.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
v3: Fix typos in commit message, remove confusing example, and use
snprintf to be consistent with the rest of the driver.

v2: Drop kconfig option, per Pavel's review:

 > No. Config option is not acceptable for this.
 >
 > Just delete the prefix and fix the breakage.

 drivers/leds/leds-pca955x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca955x.c b/drivers/leds/leds-pca955x.c
index 7087ca4592fc..24f44fb6da93 100644
--- a/drivers/leds/leds-pca955x.c
+++ b/drivers/leds/leds-pca955x.c
@@ -504,7 +504,7 @@ static int pca955x_probe(struct i2c_client *client,
 					sizeof(pdata->leds[i].name), "%d", i);
 
 			snprintf(pca955x_led->name,
-				sizeof(pca955x_led->name), "pca955x:%s",
+				sizeof(pca955x_led->name), "%s",
 				pdata->leds[i].name);
 
 			if (pdata->leds[i].default_trigger)
-- 
2.30.2

