Return-Path: <linux-leds+bounces-2769-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7A2C97CFF5
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 04:47:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D9A291C22927
	for <lists+linux-leds@lfdr.de>; Fri, 20 Sep 2024 02:47:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B57DC13B;
	Fri, 20 Sep 2024 02:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="mk/x513d"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtpbg151.qq.com (smtpbg151.qq.com [18.169.211.239])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42A6BDF42;
	Fri, 20 Sep 2024 02:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.169.211.239
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726800422; cv=none; b=qEFaKO0MYQW9Vj7V5iNRNLtwNmQYBzpOvKcDWjMAa2HT6XiqtZzv6IzPk/OKATL/RJRUMUiJgXE8X3oxE9ryykBWq8IR53AXT2wwj/GW/Oa4xH6S1rS9VwHAnSy/abxQEklJ306X+XjAbncDEdVMEVDq49nCL1M14Os7j+FsUkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726800422; c=relaxed/simple;
	bh=HMwqAktBHR321G4V0drhu3d2RksWelOXlZchpT6OQXY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S/cxIU91a1pthXAxKNfc8QC10OQ42oAQofhpyQIjgz8yNeUNuqzG3ubyZbHbx0WXU/RDwIhhlsTNTClianPk2aySpUAInWbTR6kM+SSbrdy1/jtP3FEDmmmH/GecfGfsDCcDj5N9DGUhYKa6oXExF7qha5zpUqerr7Lw0ggR07E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=mk/x513d; arc=none smtp.client-ip=18.169.211.239
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1726800332;
	bh=dEd10cim6i43JU3mwWFeexRFb9vw0bE8/cYxC7zHp8U=;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=mk/x513dPqmvsyHmhqVEuOrH0wWcnr3EC1W8BqucW/U6fKrEfmVaejWIHwMhQmaAn
	 r2CTxVIELct1NdHdugW8BLRkQtcGuC5GepIjR48S/mpEIr+Dw2EqE0hisHGfOoWCDp
	 26Ln2N/ipRt/B737VbpMIGRd8gbfe9CHGIx07AvU=
X-QQ-mid: bizesmtpsz15t1726800324twyqdd
X-QQ-Originating-IP: iIfI+RrGXex+r8Ho2ZfR3/8Vfrg+NQsYnJlQg7ZLZtc=
Received: from localhost.localdomain ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 20 Sep 2024 10:45:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 2362225561624237966
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
Subject: [PATCH] leds: rgb: leds-group-multicolor: Correct the typo 'acccess'
Date: Fri, 20 Sep 2024 10:45:14 +0800
Message-ID: <B586A1E6EA476B68+20240920024514.1182292-1-wangyuli@uniontech.com>
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


