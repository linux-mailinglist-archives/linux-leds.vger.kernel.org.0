Return-Path: <linux-leds+bounces-4575-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E514AA8E20
	for <lists+linux-leds@lfdr.de>; Mon,  5 May 2025 10:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 129E17A9DA5
	for <lists+linux-leds@lfdr.de>; Mon,  5 May 2025 08:20:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C6CB1EDA34;
	Mon,  5 May 2025 08:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=itb.spb.ru header.i=@itb.spb.ru header.b="iov0e4Xg"
X-Original-To: linux-leds@vger.kernel.org
Received: from forward203b.mail.yandex.net (forward203b.mail.yandex.net [178.154.239.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435531E7C24;
	Mon,  5 May 2025 08:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746433275; cv=none; b=XWvBMKfZh7sc4AkabpfhgvkKumNv7kADeIsQ3VI4Y06mmzet6EGaV8RoiXqzSWLS7cnn1E5uqD+eGxpdURq9px2GPsGFVdHCqeB4c4Q8wCA3MSGz5jQrhqC7QRgA5dITD/i6vBHfgyNGT7d/gdiaHhS0ZxKsoYWa+FDmfK2hpaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746433275; c=relaxed/simple;
	bh=Ubx4IIN/jFj2W5sWJUDmRo/Czw/KW+u7tWQC4o0VLwY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o/Ct77WSrQIKl10tor2Eat6HFEmXtNoHCteJXa1gutj7Hne/2e6kJDy+1Z25E4Ho9SSDe9pyWY/rhMpByWwOjVV4qCO3Ng3trr+USSQeaU1VAfJMWBviGGJs8NnxZBotH6g9v4/89PyEfX8lsPp+zxIdIwQwF8rlR5z+HM6ARNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=itb.spb.ru; spf=pass smtp.mailfrom=itb.spb.ru; dkim=pass (1024-bit key) header.d=itb.spb.ru header.i=@itb.spb.ru header.b=iov0e4Xg; arc=none smtp.client-ip=178.154.239.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=itb.spb.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=itb.spb.ru
Received: from forward100b.mail.yandex.net (forward100b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d100])
	by forward203b.mail.yandex.net (Yandex) with ESMTPS id F048A63213;
	Mon,  5 May 2025 11:14:26 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-88.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-88.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:2e20:0:640:2132:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTPS id 5338F60B29;
	Mon,  5 May 2025 11:14:18 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-88.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id xDW2KY8LZqM0-B44wJ027;
	Mon, 05 May 2025 11:14:17 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=itb.spb.ru; s=mail;
	t=1746432857; bh=HuQQ0othjGHwBJR53YINjZq8Dpvlg0YbKAb0yWqBg2c=;
	h=Message-Id:Date:Cc:Subject:To:From;
	b=iov0e4Xg6B+R6tH1qs104OemT08iTHa6qu1rWMFZwuSe6F7FLA6t5MEA2UHnny8Dt
	 YCUIlKypQUD2wrty3CmL3SL7k0KI7wYOe68zzs3679vsGMsGNfmgS02JXsnqc132yQ
	 fCCZRNEqJltC5cGpQyRmLF4cpdQx2ouK2kR9wsC0=
Authentication-Results: mail-nwsmtp-smtp-production-main-88.iva.yp-c.yandex.net; dkim=pass header.i=@itb.spb.ru
From: Ivan Stepchenko <sid@itb.spb.ru>
To: Lee Jones <lee@kernel.org>
Cc: Ivan Stepchenko <sid@itb.spb.ru>,
	Pavel Machek <pavel@kernel.org>,
	David Lechner <david@lechnology.com>,
	Jacek Anaszewski <j.anaszewski@samsung.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] leds: uleds: fix unchecked copy_to_user() in uleds_read()
Date: Mon,  5 May 2025 11:13:42 +0300
Message-Id: <20250505081342.3855-1-sid@itb.spb.ru>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The copy_to_user() is annotated with __must_check, indicating that
its return value must be checked by the caller. Currently, uleds_read()
ignores it. If the userspace buffer is invalid and copy_to_user() fails,
the userspace application may assume it has received fresh data, while
in fact copying has failed. This can leave applications out of sync
with the actual device state.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: e381322b0190 ("leds: Introduce userspace LED class driver")
Signed-off-by: Ivan Stepchenko <sid@itb.spb.ru>
---
 drivers/leds/uleds.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/uleds.c b/drivers/leds/uleds.c
index 374a841f18c3..41bfce43136c 100644
--- a/drivers/leds/uleds.c
+++ b/drivers/leds/uleds.c
@@ -147,10 +147,13 @@ static ssize_t uleds_read(struct file *file, char __user *buffer, size_t count,
 		} else if (!udev->new_data && (file->f_flags & O_NONBLOCK)) {
 			retval = -EAGAIN;
 		} else if (udev->new_data) {
-			retval = copy_to_user(buffer, &udev->brightness,
-					      sizeof(udev->brightness));
-			udev->new_data = false;
-			retval = sizeof(udev->brightness);
+			if (copy_to_user(buffer, &udev->brightness,
+					 sizeof(udev->brightness))) {
+				retval = -EFAULT;
+			} else {
+				udev->new_data = false;
+				retval = sizeof(udev->brightness);
+			}
 		}
 
 		mutex_unlock(&udev->mutex);
-- 
2.39.5


