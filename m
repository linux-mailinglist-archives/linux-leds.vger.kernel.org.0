Return-Path: <linux-leds-owner@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2832B32724C
	for <lists+linux-leds@lfdr.de>; Sun, 28 Feb 2021 13:52:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229982AbhB1Mw1 (ORCPT <rfc822;lists+linux-leds@lfdr.de>);
        Sun, 28 Feb 2021 07:52:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230083AbhB1Mw1 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sun, 28 Feb 2021 07:52:27 -0500
Received: from relay07.th.seeweb.it (relay07.th.seeweb.it [IPv6:2001:4b7a:2000:18::168])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7177C061756
        for <linux-leds@vger.kernel.org>; Sun, 28 Feb 2021 04:51:31 -0800 (PST)
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 1115E3EBAD;
        Sun, 28 Feb 2021 13:42:11 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Lee Jones <lee.jones@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@ucw.cz>,
        Dan Murphy <dmurphy@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kiran Gunda <kgunda@codeaurora.org>,
        dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-fbdev@vger.kernel.org
Subject: [PATCH 2/2] video: backlight: qcom-wled: Add PMI8994 compatible
Date:   Sun, 28 Feb 2021 13:41:05 +0100
Message-Id: <20210228124106.135812-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210228124106.135812-1-konrad.dybcio@somainline.org>
References: <20210228124106.135812-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add a compatible for PMI8994 WLED. It uses the V4 of WLED IP.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 drivers/video/backlight/qcom-wled.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/qcom-wled.c b/drivers/video/backlight/qcom-wled.c
index 3bc7800eb0a9..497b9035a908 100644
--- a/drivers/video/backlight/qcom-wled.c
+++ b/drivers/video/backlight/qcom-wled.c
@@ -1704,6 +1704,7 @@ static int wled_remove(struct platform_device *pdev)
 
 static const struct of_device_id wled_match_table[] = {
 	{ .compatible = "qcom,pm8941-wled", .data = (void *)3 },
+	{ .compatible = "qcom,pmi8994-wled", .data = (void *)4 },
 	{ .compatible = "qcom,pmi8998-wled", .data = (void *)4 },
 	{ .compatible = "qcom,pm660l-wled", .data = (void *)4 },
 	{ .compatible = "qcom,pm8150l-wled", .data = (void *)5 },
-- 
2.30.1

