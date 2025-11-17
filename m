Return-Path: <linux-leds+bounces-6166-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 570C9C647A1
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 14:51:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 95EE64F09A8
	for <lists+linux-leds@lfdr.de>; Mon, 17 Nov 2025 13:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC6AF31D74C;
	Mon, 17 Nov 2025 13:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YvCw3v7M"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0B71C5D57;
	Mon, 17 Nov 2025 13:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763387165; cv=none; b=iij1H8kR6FQua9DVwHt+htOzJfybFiLQIXeqiJjKHdx8tq5AnqrkoocYaddIoJWJZWXQNCei1kOEIi4anYOEmgB7mngIWeRWtEClGykwNaYw1AyhUfsHBTh/ElNfUTqmDyY8D08CD2K7dS1E3NUE7+WGoEGdd+qGkLXPPlW+6Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763387165; c=relaxed/simple;
	bh=prknOErvYqJlNR5gbaI4sYWg9wmXS3XlbIYFUD4asxs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=QDXLYOAMuxWbiPiXIaXhhWahaJl+cYIYBOYmxk//nD2EfwUzLcosme8Y78Jq2N+8hv1JSXCDNsjyVo+a01JAaZYKlt1Q/YPUC+TqQYfjnZbRG4/hTOXfQ7p8lLCPYhyF7Kzu1SUvqz7tspSrr+JdqgIDC/u4+WaPq4ca3hZxrYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YvCw3v7M; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DD3C113D0;
	Mon, 17 Nov 2025 13:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763387165;
	bh=prknOErvYqJlNR5gbaI4sYWg9wmXS3XlbIYFUD4asxs=;
	h=From:Date:Subject:To:Cc:From;
	b=YvCw3v7M38HUZiF5jK42GOlVNQP9vFIz0TtQbJCVB9LRrSL7LFAuEs3k+lC1J7+G4
	 BPt9oCePYUN65zqQMhVpERSU/WHuxy/puZ4KcXsD/SoLica6f978VgBh5HMj+z9M5S
	 vfp5APZl/pS6FE29KxmQ+GGyLLKGVr+fcmu1S9BJk2FdfZO+1ll/qL4ua8GK5NvkvK
	 HELh7CHPc5YJuxvZe6ux+XOF8igLi3Ox1Pptuq0YiU9p3BwbfMEMnNTZ15XCYESpJc
	 sECLl5HHvzJt6x9+N3W6r8H2GPy15xRTXhfYDObJgalFbmAcMzTJ1xxZWfeeY4knn6
	 rvCajVhN2qFLQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Mon, 17 Nov 2025 14:45:59 +0100
Subject: [PATCH] leds: rgb: leds-qcom-lpg: Allow LED_COLOR_ID_MULTI
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251117-topic-lpg_multi-v1-1-05604374a2dd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIABYnG2kC/x3MQQqAIBBA0avErBOasISuEhFlkw2YiVoE0d2Tl
 m/x/wORAlOErngg0MWRD5eBZQF6m5whwUs21FXdIKIS6fCshfVm3E+bWOhVKpqwlTNKyJUPtPL
 9H/vhfT+Xsh8XYQAAAA==
X-Change-ID: 20251117-topic-lpg_multi-cf47ea164b14
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763387162; l=1817;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=7BhpOfxYXcRMA0NsNREP850/UJ5Yn5ksZiCNoPHzWgw=;
 b=tzak5VwOXtf6CnenCw+ZwJsEFM7t70VT9Qa/dXjaaxrFK7rbi+hviUBynpD38uv+oN3kFHl5b
 Dy6hSuf+J2VBjdHBw+iwPPeeylg5TZ5IvbqI718315p26o8Q+2XHSJe
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

There's nothing special about RGB multi-led instances. Allow any color
combinations by simply extending the "if _RGB" checks.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/leds/rgb/leds-qcom-lpg.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
index 4f2a178e3d26..c8afc68e442f 100644
--- a/drivers/leds/rgb/leds-qcom-lpg.c
+++ b/drivers/leds/rgb/leds-qcom-lpg.c
@@ -1382,7 +1382,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 		return dev_err_probe(lpg->dev, ret,
 			      "failed to parse \"color\" of %pOF\n", np);
 
-	if (color == LED_COLOR_ID_RGB)
+	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
 		num_channels = of_get_available_child_count(np);
 	else
 		num_channels = 1;
@@ -1394,7 +1394,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 	led->lpg = lpg;
 	led->num_channels = num_channels;
 
-	if (color == LED_COLOR_ID_RGB) {
+	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI) {
 		info = devm_kcalloc(lpg->dev, num_channels, sizeof(*info), GFP_KERNEL);
 		if (!info)
 			return -ENOMEM;
@@ -1454,7 +1454,7 @@ static int lpg_add_led(struct lpg *lpg, struct device_node *np)
 
 	init_data.fwnode = of_fwnode_handle(np);
 
-	if (color == LED_COLOR_ID_RGB)
+	if (color == LED_COLOR_ID_RGB || color == LED_COLOR_ID_MULTI)
 		ret = devm_led_classdev_multicolor_register_ext(lpg->dev, &led->mcdev, &init_data);
 	else
 		ret = devm_led_classdev_register_ext(lpg->dev, &led->cdev, &init_data);

---
base-commit: b179ce312bafcb8c68dc718e015aee79b7939ff0
change-id: 20251117-topic-lpg_multi-cf47ea164b14

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>


