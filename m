Return-Path: <linux-leds+bounces-1559-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B35518BA1FE
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2024 23:14:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6988A1F2208E
	for <lists+linux-leds@lfdr.de>; Thu,  2 May 2024 21:14:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B866D181B99;
	Thu,  2 May 2024 21:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Fikgqm4z"
X-Original-To: linux-leds@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FDB181322
	for <linux-leds@vger.kernel.org>; Thu,  2 May 2024 21:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714684476; cv=none; b=CaC/o+ea5arryaPkUQXqAWlkCMGuAKkD7D1wpWd1Xn9CVu9WLMWs+EkxE8RmGL7+sJJFvrWpjQTMpaAsDWMQJgCM2Jkjp4RZ6zD4oaFSciuSYhiZas3I+Uhyh1khTmo1CU6cbxtW+aI2yEs7ZsV+otFlvDpcfEiLpoNmZivGw5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714684476; c=relaxed/simple;
	bh=6+iKMDBLa/uW1gaLOf3A/ew9VEwuynfr7LH5wkJyHEg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjMtaHdH+vHC8SFTB8hBHQzEOrG4RmCU0W2BtwmN741L9XsgPEoA5xUBqjuSpFJtoSC3pAzVW7kW5PW3u09jMxn/VhjasES6M2T+9otenQ/AHhotVJZZXY2EOuS5DYEnEu/m5Ztf392QwV1EaMJ3H5sD9K+ZAHX2aUSJBW/J4vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Fikgqm4z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1714684474;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0acOtjkhKZtbTeCtJ35pPqysLlNFjfSdDtnlseC+L2c=;
	b=Fikgqm4zDedhe3TnbbMioRBELVPoO3bBRvkqt4oiibPPrXNn5k4upkdp7VEbp/8nmWD4Jz
	A/oAu+V67/Tw1ZP3X5ktWq6GC1Rt7+1H0zsYaF2gZfQ4DYYOpM/MLbYbRSl28WQuR4jckp
	+ak3tL4/+pbhcCVYTzHjGwP7o+KsaEU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-379-7LNsTcJpMzmw2NLTRMGKTg-1; Thu, 02 May 2024 17:14:31 -0400
X-MC-Unique: 7LNsTcJpMzmw2NLTRMGKTg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9F43D800CA2;
	Thu,  2 May 2024 21:14:30 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.33])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4DDD840C5C2;
	Thu,  2 May 2024 21:14:29 +0000 (UTC)
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
Subject: [PATCH v8 2/7] leds: rgb: leds-ktd202x: I2C ID tables for KTD2026 and 2027
Date: Thu,  2 May 2024 23:14:20 +0200
Message-ID: <20240502211425.8678-3-hdegoede@redhat.com>
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

From: Kate Hsuan <hpa@redhat.com>

This table shows the maximum support LED channel for KTD2026 and KTD-2027.
The 3-channel LED controller KTD2026 controls R/G/B three LEDs. The
4-channel LED controller KTD2027 controls R/G/B and flashing LEDs.

Link: https://www.kinet-ic.com/uploads/KTD2026-7-04h.pdf
Signed-off-by: Kate Hsuan <hpa@redhat.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/leds/rgb/leds-ktd202x.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/leds/rgb/leds-ktd202x.c b/drivers/leds/rgb/leds-ktd202x.c
index f1c810c415a4..60ca6ec34336 100644
--- a/drivers/leds/rgb/leds-ktd202x.c
+++ b/drivers/leds/rgb/leds-ktd202x.c
@@ -606,6 +606,13 @@ static void ktd202x_shutdown(struct i2c_client *client)
 	regmap_write(chip->regmap, KTD202X_REG_RESET_CONTROL, KTD202X_RSTR_RESET);
 }
 
+static const struct i2c_device_id ktd202x_id[] = {
+	{"ktd2026", KTD2026_NUM_LEDS},
+	{"ktd2027", KTD2027_NUM_LEDS},
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, ktd202x_id);
+
 static const struct of_device_id ktd202x_match_table[] = {
 	{ .compatible = "kinetic,ktd2026", .data = (void *)KTD2026_NUM_LEDS },
 	{ .compatible = "kinetic,ktd2027", .data = (void *)KTD2027_NUM_LEDS },
@@ -621,6 +628,7 @@ static struct i2c_driver ktd202x_driver = {
 	.probe = ktd202x_probe,
 	.remove = ktd202x_remove,
 	.shutdown = ktd202x_shutdown,
+	.id_table = ktd202x_id,
 };
 module_i2c_driver(ktd202x_driver);
 
-- 
2.44.0


