Return-Path: <linux-leds+bounces-3686-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5B39F8E50
	for <lists+linux-leds@lfdr.de>; Fri, 20 Dec 2024 09:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9C85A160C9B
	for <lists+linux-leds@lfdr.de>; Fri, 20 Dec 2024 08:53:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C74019D88B;
	Fri, 20 Dec 2024 08:53:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b="L+O4kJdC"
X-Original-To: linux-leds@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C021A7ADD
	for <linux-leds@vger.kernel.org>; Fri, 20 Dec 2024 08:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734684835; cv=none; b=W7yoSBuVZ+S+wLmKJFUcr+hNz/PFfAcIdtBYEtaLlvlAS2ZNSfcohjVm2jaXier6hKARTXCl7rMiKhpDJrsXAhr9QBKXyAx4scQ+BY6CJEiiQwVwSIwO4/jJ5xvFJBVnksZo+GdRxyIaRs3J96QBi9bpO8wQy3MUGCNb0PEvMNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734684835; c=relaxed/simple;
	bh=S0J1+1SgZ+lESZzTh+NMC/1DMcSMDw/JgiL8OvgTvB8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DLOMQKPWdODx5WEv7/rDJHZw06mcPlWmCfZNYk6eMIV4BOYfEJVel17Ps0eyPSkMWn4mgX78tjYP6CH/gylkXlIyxdNGNHNZdXl1rHSHpE0/juQ850kjXTbjAcOYWvz6tZ7T9kz2AbfDKcMD6AX3o64E3K4xfHGAdAtNiNBAslw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp; dkim=pass (2048-bit key) header.d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.i=@pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com header.b=L+O4kJdC; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=pf.is.s.u-tokyo.ac.jp
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=pf.is.s.u-tokyo.ac.jp
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-725dac69699so1495916b3a.0
        for <linux-leds@vger.kernel.org>; Fri, 20 Dec 2024 00:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pf-is-s-u-tokyo-ac-jp.20230601.gappssmtp.com; s=20230601; t=1734684832; x=1735289632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pnx6QTAVXVVnfmAnGAR7i6UQkSzBmpi2LNWJzZSqUs0=;
        b=L+O4kJdCR89FHq7RssYlRZ7XCGNDRgd/xZW5fKPcGYZcYzq21k3wPsEfPy1HIMmEKf
         SOpiZV1vC2GIxBuDVpFATkxrSaW0/CZCHNuqYh4BZ0WZXuZtrsmFpniFUs0YyF4/3aed
         i4Z15toNvII3jdOYvV5l3NpvP1/bWr0nyaaVuLJg+xFShRVtQaA0sGL1aW4NXPjHfAUO
         zEeencllZKzeux1fIEDsO4CRlSB5bRIlf3II7Qa4IHnId9jK2L4vs2RkUp325BeYgWUM
         VlzJQVGkITvLrPTAFn79ktKThBn2FDRb/zMhweYNmaNSu8VydBkdMieloxhccUkXB8Sr
         np4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734684832; x=1735289632;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pnx6QTAVXVVnfmAnGAR7i6UQkSzBmpi2LNWJzZSqUs0=;
        b=saXXViSgstzwH3vOIyPtvK4iADeFnYTNwBeEQDC/ThIz0vkkq74Te5r+WbZ8UrN+QR
         yy2ODfbg4pRxvsilEgq/p1w88WWHi3m2WlHr8BkMONCr0OBXz6EwhdHNXfSLcd8PO1sZ
         i41mTC5d9xt3cg5WTo55TlRZe/OTucGCCLWAzvLJ1oNETsUR+t8i33RvwjlV08fIGAjV
         Q6mrKp5Eubx8oF8ZTV+FZ1w8YuMMnD6ElxYhvThVkVMA6TTcRqNHBTgUZ/j8iqRLvk9B
         hAPoEWJetxXmPZmWvDJN3nQapGYcttnn16OUFGGAf48+YzVyKbDQqXZWs3ZD9aWhXnnj
         hOZw==
X-Gm-Message-State: AOJu0Yzu6HsWgRkV0B/Xqt+fk2oChHERB+GcWdNHsNg/U1WzXyMDSx5A
	8LaHFzUfF7hbevs3xTBkOdnm90FjiC9OKas7HB+gu/YaiJLzShs2/F0Gf99UwhvN6sbpVKuDcfx
	b/bs=
X-Gm-Gg: ASbGncs7ChJlP3LWR4p+WRB+FynXhOvzxc2kE5vqcAvW9Wfj7c+D7ub3Ndzr9h5J6Hn
	GRe2bVoDO1VLufYwYhke4uS+tOgXrAUP00J3DZk9HkxhFTkwXSBG0f6BNfkTdkNdEnbl+LG8/bs
	kKGbmZtF+/wgVaeWHi/hSGIbj/bKp0yhI9CVgsjGrJ+9i8+MyIpGJt41GWry88yPO6YPpVLDbQ/
	QK6bHDMnCMDjraNQBbBieRzsYXp3G9l/De/5uY9oeV9jmhIbB4RjHsA3dHafPK6CBfnqxH+rX3N
	6jktA3zVvxEMtE8P9ZJe4sTrCJS+9CzeZjfQcAYqG0c=
X-Google-Smtp-Source: AGHT+IGAntOFrv9Y5dugN3nnpncSqwQvZ3OewunsRT4nBjrxQfS4t8gXPZKGu15OD7vbjXWZQ3mdDA==
X-Received: by 2002:a05:6a00:4391:b0:728:927b:7de2 with SMTP id d2e1a72fcca58-72abdd7cbaemr3671883b3a.8.1734684831996;
        Fri, 20 Dec 2024 00:53:51 -0800 (PST)
Received: from localhost.localdomain (133-32-227-190.east.xps.vectant.ne.jp. [133.32.227.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72aad90c13esm2617937b3a.190.2024.12.20.00.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Dec 2024 00:53:51 -0800 (PST)
From: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: pavel@ucw.cz,
	lee@kernel.org
Cc: linux-leds@vger.kernel.org,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
Subject: [PATCH] leds: cht-wcove: use devm_led_classdev_register() to avoid memory leak
Date: Fri, 20 Dec 2024 17:53:46 +0900
Message-Id: <20241220085346.533675-1-joe@pf.is.s.u-tokyo.ac.jp>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

cht_wc_leds_probe() leaks memory when the second led_classdev_register()
call in the for-loop fails as it does not call the cleanup function
led_classdev_unregister() on the first device. Avoid this leak by
calling devm_led_classdev_register().

Fixes: 047da762b9a9 ("leds: Add Intel Cherry Trail Whiskey Cove PMIC LED driver")
Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
---
 drivers/leds/leds-cht-wcove.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/leds/leds-cht-wcove.c b/drivers/leds/leds-cht-wcove.c
index 8246f048edcb..9a609dd5acdc 100644
--- a/drivers/leds/leds-cht-wcove.c
+++ b/drivers/leds/leds-cht-wcove.c
@@ -394,7 +394,7 @@ static int cht_wc_leds_probe(struct platform_device *pdev)
 		led->cdev.pattern_clear = cht_wc_leds_pattern_clear;
 		led->cdev.max_brightness = 255;
 
-		ret = led_classdev_register(&pdev->dev, &led->cdev);
+		ret = devm_led_classdev_register(&pdev->dev, &led->cdev);
 		if (ret < 0)
 			return ret;
 	}
@@ -406,10 +406,6 @@ static int cht_wc_leds_probe(struct platform_device *pdev)
 static void cht_wc_leds_remove(struct platform_device *pdev)
 {
 	struct cht_wc_leds *leds = platform_get_drvdata(pdev);
-	int i;
-
-	for (i = 0; i < CHT_WC_LED_COUNT; i++)
-		led_classdev_unregister(&leds->leds[i].cdev);
 
 	/* Restore LED1 regs if hw-control was active else leave LED1 off */
 	if (!(leds->led1_initial_regs.ctrl & CHT_WC_LED1_SWCTL))
-- 
2.34.1


