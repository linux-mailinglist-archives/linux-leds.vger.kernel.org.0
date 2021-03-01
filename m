Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23AFD327AC0
	for <lists+linux-leds@lfdr.de>; Mon,  1 Mar 2021 10:29:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233924AbhCAJ34 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Mon, 1 Mar 2021 04:29:56 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:54861 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233921AbhCAJ3z (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Mon, 1 Mar 2021 04:29:55 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614590972; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=jKJu5aDGrcqlDbzQ78CdwyQI6hSDHoApx/V49+oBu78=; b=Bo7PZCC0/qdn89ekJQT29VXIrVDVO2XEc4/EFhadbmTbwa8mVCJz6pmJnztJ7CclGAcDtkko
 sXXqADcSY8sMX+Gsk+tKlmcPqHvKGKynMFO8J1KGz6kzG9McFSyOQZTriMbtBXzqFSZvukrq
 pCDO79/FUcQ5UbH2u60fh5k+wlE=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJkODczOCIsICJsaW51eC1sZWRzQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 603cb3de7aa94c52e70c5752 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Mar 2021 09:29:02
 GMT
Sender: kgunda=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 852E2C433ED; Mon,  1 Mar 2021 09:29:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from kgunda-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kgunda)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 84F35C43463;
        Mon,  1 Mar 2021 09:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 84F35C43463
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=kgunda@codeaurora.org
From:   Kiran Gunda <kgunda@codeaurora.org>
To:     bjorn.andersson@linaro.org, jingoohan1@gmail.com,
        lee.jones@linaro.org, b.zolnierkie@samsung.com,
        dri-devel@lists.freedesktop.org, daniel.thompson@linaro.org,
        jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-fbdev@vger.kernel.org
Cc:     phone-devel@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>
Subject: [PATCH V3 1/2] backlight: qcom-wled: Fix FSC update issue for WLED5
Date:   Mon,  1 Mar 2021 14:58:35 +0530
Message-Id: <1614590916-27070-2-git-send-email-kgunda@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614590916-27070-1-git-send-email-kgunda@codeaurora.org>
References: <1614590916-27070-1-git-send-email-kgunda@codeaurora.org>
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Currently, for WLED5, the FSC (Full scale current) setting is not
updated properly due to driver toggling the wrong register after
an FSC update.

On WLED5 we should only toggle the MOD_SYNC bit after a brightness
update. For an FSC update we need to toggle the SYNC bits instead.

Fix it by adopting the common wled3_sync_toggle() for WLED5 and
introducing new code to the brightness update path to compensate.

Signed-off-by: Kiran Gunda <kgunda@codeaurora.org>
Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/video/backlight/qcom-wled.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 3bc7800..aef52b9 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -348,7 +348,7 @@ static int wled3_sync_toggle(struct wled *wled)
 	return rc;
 }
 
-static int wled5_sync_toggle(struct wled *wled)
+static int wled5_mod_sync_toggle(struct wled *wled)
 {
 	int rc;
 	u8 val;
@@ -445,10 +445,23 @@ static int wled_update_status(struct backlight_device *bl)
 			goto unlock_mutex;
 		}
 
-		rc = wled->wled_sync_toggle(wled);
-		if (rc < 0) {
-			dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
-			goto unlock_mutex;
+		if (wled->version < 5) {
+			rc = wled->wled_sync_toggle(wled);
+			if (rc < 0) {
+				dev_err(wled->dev, "wled sync failed rc:%d\n", rc);
+				goto unlock_mutex;
+			}
+		} else {
+			/*
+			 * For WLED5 toggling the MOD_SYNC_BIT updates the
+			 * brightness
+			 */
+			rc = wled5_mod_sync_toggle(wled);
+			if (rc < 0) {
+				dev_err(wled->dev, "wled mod sync failed rc:%d\n",
+					rc);
+				goto unlock_mutex;
+			}
 		}
 	}
 
@@ -1459,7 +1472,7 @@ static int wled_configure(struct wled *wled)
 		size = ARRAY_SIZE(wled5_opts);
 		*cfg = wled5_config_defaults;
 		wled->wled_set_brightness = wled5_set_brightness;
-		wled->wled_sync_toggle = wled5_sync_toggle;
+		wled->wled_sync_toggle = wled3_sync_toggle;
 		wled->wled_cabc_config = wled5_cabc_config;
 		wled->wled_ovp_delay = wled5_ovp_delay;
 		wled->wled_auto_detection_required =
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
 a Linux Foundation Collaborative Project

