Return-Path: <linux-leds+bounces-3123-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E7289A2665
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2024 17:18:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C05A41C218AD
	for <lists+linux-leds@lfdr.de>; Thu, 17 Oct 2024 15:18:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D40DF1DED4A;
	Thu, 17 Oct 2024 15:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b="D/yhiiAJ"
X-Original-To: linux-leds@vger.kernel.org
Received: from uho.ysoft.cz (uho.ysoft.cz [81.19.3.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB0E1DED6E;
	Thu, 17 Oct 2024 15:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.19.3.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729178263; cv=none; b=AOHH2HAK074Io1crhw60uZqeOBrUovZKy7BsVeYGegoMilhNpH7mzjX5Gv5Fag4EsGLsfjdwTrlPPumB6o9rXF5remd1HnI0quOyZ7s7i5roLbjVHW+5eto3kxX5Luhfc+172a0BdSDeEuBEf1BipDHuEjm3ZICCT19Tc/sZP5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729178263; c=relaxed/simple;
	bh=/NihlQJA6Z7tTr9YQe6+KoIQTIW0kV4EScxxfXk4vyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=HoWbMqskOlJOhJ0UzvBB+ptPfc0GqRNu2DTzuuV68h49R83U0fpNMkpdVAfpf5o7ySh9kFFjv17enMSLPY/sTrYXFcL5V/iyg32HFigKiPw+/+wBCw+HxuH8U6EJqSwXY0xsbCSO3Sv8Drqo0Xo7Yigd3ca+iQwKhu3fBt6Tn8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com; spf=pass smtp.mailfrom=ysoft.com; dkim=pass (1024-bit key) header.d=ysoft.com header.i=@ysoft.com header.b=D/yhiiAJ; arc=none smtp.client-ip=81.19.3.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ysoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ysoft.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ysoft.com;
	s=20160406-ysoft-com; t=1729177710;
	bh=sDJoIPTfhEjh0TSEIcd63E+5stOgL4Hf4FbuPvcUPbI=;
	h=From:To:Cc:Subject:Date:From;
	b=D/yhiiAJ749VjL5CID0IZc0490lqPmIKK4O7Wc17vh5Pj34w05Z2YD97PpoQWDoSz
	 ioJokNnbf1/+z0PTf5li9dLdJflBDjuuY6d7zglk+iNfh3GKN9+AWEVcifmuRhwPKG
	 e3t8OYY9cDzIT8E+ytNoqRSFC5KQyDjMyS3s1Imw=
Received: from vokac-nb.ysoft.local (unknown [10.1.8.111])
	by uho.ysoft.cz (Postfix) with ESMTP id DFED8A021E;
	Thu, 17 Oct 2024 17:08:29 +0200 (CEST)
From: =?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Michal=20Vok=C3=A1=C4=8D?= <michal.vokac@ysoft.com>,
	stable@vger.kernel.org
Subject: [PATCH v2] leds: lp55xx: Remove redundant test for invalid channel number
Date: Thu, 17 Oct 2024 17:08:12 +0200
Message-ID: <20241017150812.3563629-1-michal.vokac@ysoft.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since commit 92a81562e695 ("leds: lp55xx: Add multicolor framework
support to lp55xx") there are two subsequent tests if the chan_nr
(reg property) is in valid range. One in the lp55xx_init_led()
function and one in the lp55xx_parse_common_child() function that
was added with the mentioned commit.

There are two issues with that.

First is in the lp55xx_parse_common_child() function where the reg
property is tested right after it is read from the device tree.
Test for the upper range is not correct though. Valid reg values are
0 to (max_channel - 1) so it should be >=.

Second issue is that in case the parsed value is out of the range
the probe just fails and no error message is shown as the code never
reaches the second test that prints and error message.

Remove the test form lp55xx_parse_common_child() function completely
and keep the one in lp55xx_init_led() function to deal with it.

Fixes: 92a81562e695 ("leds: lp55xx: Add multicolor framework support to lp55xx")
Cc: <stable@vger.kernel.org>
Signed-off-by: Michal Vokáč <michal.vokac@ysoft.com>
---
v2:
- Complete change of the approach to the problem.

In v1 I removed the test from lp55xx_init_led() but I failed  to test that
solution properly. It could not work. In v2 I removed the test for chan_nr
being out of range from the lp55xx_parse_common_child() function.

- Re-worded the subject and commit message to fit the changes. It was:

 "leds: lp55xx: Fix check for invalid channel number"

 drivers/leds/leds-lp55xx-common.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 5a2e259679cf..e71456a56ab8 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -1132,9 +1132,6 @@ static int lp55xx_parse_common_child(struct device_node *np,
 	if (ret)
 		return ret;
 
-	if (*chan_nr < 0 || *chan_nr > cfg->max_channel)
-		return -EINVAL;
-
 	return 0;
 }
 
-- 
2.1.4


