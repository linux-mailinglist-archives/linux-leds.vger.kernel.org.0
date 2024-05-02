Return-Path: <linux-leds+bounces-1560-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 748078BA200
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2024 23:14:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2FC72280CA6
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2024 21:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E09A181BA8;
	Thu,  2 May 2024 21:14:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Lyz4gmHi"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2385180A96
	for <linux-leds@vger.kernel.org>; Thu,  2 May 2024 21:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714684478; cv=none; b=pJ6iE93Y9w9XjJF1h8quWFpGG8NkZovGGpeHOzQ/CGaacL3/a22wrBnHMSZwQALXgwlQrAPdz92o+TsTSDWMF49ivUJDpg6GuEeWvgmo37oYetQG60+8m0w0hCvyV6lgSw0g/mDkbDxob9d97Icm7AKGs5CLf9AsqC2zIXprg4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714684478; c=relaxed/simple;
	bh=1S+4GNAUpKXds7LcVmMe/jrs2SUyekeWRn931fwnhR8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qvsdabArYJvh7KbHCGhDTJmP3PpHejDDOlnusivCgwcneTLHqAZRUC/4L3Ykixn1Twh9RKlrcCUPBkPUy5XtZM5gJe7ySCqtw2iVi7pqSfgqWNzgRG5aTAtusvCEKoYEuny2t8LaIaYw2UP0asbelbn0f0yEi+Bd/WrypowJI0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Lyz4gmHi; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714684475;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ckF8SmGaQ0kzJOrgoMLDkNyaWhgKpKt8VrEVFWryMwc=;
	b=Lyz4gmHiaRPj3pzxS1ewTUZlx+Q7+g46DIbG99fBjKuEFef0HTaDLRB0Grb7skxddRN7Xr
	wqfynH46ZgFDncAYk1Nn29nZLJHoZg8SSTck6N0CdtfxbhMujtRHtdWA6VizUSPTME8Ckz
	YNsU7JhpTU9sjMaW1JLFft9VmnW0izI=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-258-sda8g02mNUSwXxz-Kbw2bg-1; Thu,
 02 May 2024 17:14:32 -0400
X-MC-Unique: sda8g02mNUSwXxz-Kbw2bg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2AE313C0256A;
	Thu,  2 May 2024 21:14:32 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id CDDD340BAA2;
	Thu,  2 May 2024 21:14:30 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Kate Hsuan <hpa@redhat.com>,
	Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	linux-leds@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v8 3/7] leds: rgb: leds-ktd202x: Initialize mutex earlier
Date: Thu,  2 May 2024 23:14:21 +0200
Message-ID: <20240502211425.8678-4-hdegoede@redhat.com>
In-Reply-To: <20240502211425.8678-1-hdegoede@redhat.com>
References: <20240502211425.8678-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10

The mutex must be initialized before the LED class device is registered
otherwise there is a race where it may get used before it is initialized:

 DEBUG_LOCKS_WARN_ON(lock->magic != lock)
 WARNING: CPU: 2 PID: 2045 at kernel/locking/mutex.c:587 __mutex_lock
 ...
 RIP: 0010:__mutex_lock+0x7db/0xc10
 ...
 set_brightness_delayed_set_brightness.part.0+0x17/0x60
 set_brightness_delayed+0xf1/0x100
 process_one_work+0x222/0x5a0

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/rgb/leds-ktd202x.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index 60ca6ec34336..77247a98fe66 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -572,21 +572,25 @@ static int ktd202x_probe(struct i2c_client *client)
 		return ret;
 	}
 
+	mutex_init(&chip->mutex);
+
 	ret = ktd202x_probe_fw(chip);
 	if (ret < 0) {
 		regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip->regulators);
-		return ret;
+		goto destroy_mutex;
 	}
 
 	ret = regulator_bulk_disable(ARRAY_SIZE(chip->regulators), chip->regulators);
 	if (ret) {
 		dev_err_probe(dev, ret, "Failed to disable regulators.\n");
-		return ret;
+		goto destroy_mutex;
 	}
 
-	mutex_init(&chip->mutex);
-
 	return 0;
+
+destroy_mutex:
+	mutex_destroy(&chip->mutex);
+	return ret;
 }
 
 static void ktd202x_remove(struct i2c_client *client)
-- 
2.44.0


