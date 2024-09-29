Return-Path: <linux-leds+bounces-2886-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 657B3989476
	for <lists+linux-leds@lfdr.de>; Sun, 29 Sep 2024 11:24:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95E841C232CF
	for <lists+linux-leds@lfdr.de>; Sun, 29 Sep 2024 09:24:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175031779AE;
	Sun, 29 Sep 2024 09:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Nusst0kc"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D8B152790;
	Sun, 29 Sep 2024 09:22:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727601763; cv=none; b=QVgF1TYTUChuhA6xD76nR27jZoBWW16M7ii9A3+TB2PYNR/0Lb0cIWIfGqlnZF0iAbGrP3ApD2fcNznZhfYQy2VbCGlfRsYsBfYBDbhPAH90XIT3C/ljGb1hq8eQFQjFzFtgWuv1vmg+gFy36MU1V0fuK8VQFlZ644TwMlEtmzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727601763; c=relaxed/simple;
	bh=HMwqAktBHR321G4V0drhu3d2RksWelOXlZchpT6OQXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o2JVBgVFa3FeSJVh4IGxTeuiisy378aXxb0JfLKgmWoRq31lM4RHT/3SPWv++1weeUCYVpbxU3gUFZopa9+UVIjhF4smRJKDt9K+LwuVitguOobs9lajMzSNRAmtR+x/vwTJ5x2ujSAzJMkJqvmmw5rGX5fn5tV2B9Ff65iXluI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Nusst0kc; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1727601694;
	bh=dEd10cim6i43JU3mwWFeexRFb9vw0bE8/cYxC7zHp8U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=Nusst0kcYfgZA9K8UtkOXTz+R+3sezFyGabrSwNQK5pVwbi4X2uwkQK2uL3QIDVG3
	 q3GVSmjanICDEGK/yw2y9BBTGvaWkQdVPTLwHrpzRVRQLW2x4sI3sfKHgKrv57ZtLI
	 CfD/TgWXwldvp+ap31DaZeKm7DfUZFzj+wscmQo4=
X-QQ-mid: bizesmtpsz11t1727601663th71y9
X-QQ-Originating-IP: XO3PTpV1d7mu0tyJTNtMJ62elmv8jBM4+fmPaBs/1GU=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 29 Sep 2024 17:21:01 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 11011655909713705943
From: WangYuli <wangyuli@uniontech.com>
To: pavel@ucw.cz,
	lee@kernel.org,
	aren@peacevolution.org,
	tzimmermann@suse.de,
	wangyuli@uniontech.com
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jjhiblot@traphandler.com,
	guanwentao@uniontech.com,
	zhanjun@uniontech.com
Subject: [RESEND. PATCH] leds: rgb: leds-group-multicolor: Correct the typo 'acccess'
Date: Sun, 29 Sep 2024 17:20:57 +0800
Message-ID: <DA8E8FA1F45D2F5A+20240929092057.1037448-1-wangyuli@uniontech.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: ORsPGgEyjQSPL+g5xeTt9lUpoSBYFV3HVdoq4Jm6VrXJ3Nrxdj/wipW6
	/7aR17zPn9aHcak81PrT3cnyCeS22MiPZdffIpGKeEjCoRYRhbA2h3KcOZUIcJfepjQc7Td
	pW17DX5q3OVhFDHvs47h/mTGck/51mV1KfyLQeS/SdGI55s6wFqz3ge4GwANqxYTUekiArJ
	qCgstgSWXj3iSqyiuxWMmGoFLjZjODbAHBfH7OsDAY9pVhZkoFXiB1mzcnX5ug8w6FtDXaH
	yYHBMUjFEojJHErrOdfbv3C3jRYlSJro6mClsUk9qhD+rW4EeFkJnQahYkfChTkdwS5PUjQ
	smcYLlRD4QpR+qcnx+bSTVuHucCfJ3XxJJoiyWdrtU+xBA5uKIvNDmDCtC9F/0X/d36UKyA
	N3uzKoMdfg9imUDabApzBLFX8dus7+dNCXgEAOdDtJhlxIbkuSlDavfau6SleG4VfjpcMhP
	Jy1ShduMFTCDcTdI1oTr7+30klf1MD1ZdJnc1m0KYTc2ghTnNZrZiZ8Bk0X6uw2DPkqMFXH
	s5uKQOhszihB+w46IjUT9WDukWhQjtQ/dTvIi51OmVlwqjrGwzlWWWi06Ame/La8ttwkMeD
	IQSg8mFz63L1kEL3ZX0e1JRUyujyhfWUu8bltQ6jwkur/uOjmzX8YygktPrYNzuEYOWkwL0
	rIKGiVCiU2FStCxpwcnmn/QvZXKtbdzHYtuPysYoIzzzK0cRvpDBH1K6takbAfzf6TN5t/G
	lNeStRuA+jV3eQJlMVsny5tfP7f8qTvSHSdS+1dFhzqDMNV074tlAuiv8HFRQV2VNh1AgR4
	cWhr17s/DppQz6QPV4AXUTdIPC8am9ztm3xHWCqF+JFOQAIV9XjOK2MJW7rD+Itv9SiiWth
	lzyppXGU+wJUObQaAA0utLJUe88lCAxWWPO1oM9fnOsWV9Nu9mbl7wkFLbU7z0JqjK65BbG
	AlJvpwk9oP65+JRXqe7/N6i0e5UVBPG14E53u2LfumVonSrohlSDg9DkOOsBQJyRY981RX5
	c15dwz6NZz7tYxyKXgz39BqZaIAiM=
X-QQ-XMRINFO: M/715EihBoGSf6IYSX1iLFg=
X-QQ-RECHKSPAM: 0

There is a spelling mistake of 'acccess' which should be instead of
'access'.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://lore.kernel.org/all/0c768bf6-bc19-43de-a30b-ff5e3ddfd0b3@suse.de/
Signed-off-by: WangYuli <wangyuli@uniontech.com>
---
 drivers/leds/rgb/leds-group-multicolor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-group-multicolor.c b/drivers/leds/rgb/leds-group-multicolor.c
index b6c7679015fd..548c7dd63ba1 100644
--- a/drivers/leds/rgb/leds-group-multicolor.c
+++ b/drivers/leds/rgb/leds-group-multicolor.c
@@ -55,7 +55,7 @@ static void restore_sysfs_write_access(void *data)
 {
 	struct led_classdev *led_cdev = data;
 
-	/* Restore the write acccess to the LED */
+	/* Restore the write access to the LED */
 	mutex_lock(&led_cdev->led_access);
 	led_sysfs_enable(led_cdev);
 	mutex_unlock(&led_cdev->led_access);
-- 
2.45.2


