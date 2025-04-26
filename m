Return-Path: <linux-leds+bounces-4546-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9D7A9D73B
	for <lists+linux-leds@lfdr.de>; Sat, 26 Apr 2025 04:20:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EBD671BA78D7
	for <lists+linux-leds@lfdr.de>; Sat, 26 Apr 2025 02:21:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B8F1EEA59;
	Sat, 26 Apr 2025 02:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ponkila.com header.i=@ponkila.com header.b="HfMNfN2x"
X-Original-To: linux-leds@vger.kernel.org
Received: from www572.your-server.de (www572.your-server.de [188.40.218.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2644A02;
	Sat, 26 Apr 2025 02:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.218.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745634049; cv=none; b=gV2M+cWlEIFR/f8GFTExdV99vmv8ING2XlvO5QRRtKmuOEiN6kZhXkLBbuLyJqPCRfLkfzU1CU/CponBSRuSJ2Qm7LOorBpv5/y8A1gZQd9OsSO5EClQqJZMKPg/boyrNkG3ZTedCESI6XIDSPyKNUg4Gdavq38q+1valqw0nh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745634049; c=relaxed/simple;
	bh=abpqB7r7yhSJl9fJC74FAcYqtD9rIO9MlBWGIhv9euM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jqAhob3AS8e1IM5bv4iNjl5DMueOUaAaz1z0n2FE/lX99ieTh7fTXQfUJ9KRB9knIqeyDmO7qZ98lMdCcJ26ZbwljlwZzSKwBVIM1YdQLC/VgaDmcKOlNVwuGn3ks1SAyyZJkvF34jVLz0psNUhMQ5jjp8h4OZs58KBn4otGTNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ponkila.com; spf=pass smtp.mailfrom=ponkila.com; dkim=pass (2048-bit key) header.d=ponkila.com header.i=@ponkila.com header.b=HfMNfN2x; arc=none smtp.client-ip=188.40.218.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ponkila.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ponkila.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=ponkila.com
	; s=default2410; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=tz9cMsRoYeMhEHGF4I0Gy1Va1L8t4+FiGi1VZlVHcl0=; b=HfMNfN2xhuruSkGspT+3OMODbL
	7TtPuVvrPBq7qOr+W7d2mBtDOK7nR+6IFMFMyS5/o/wNU12risL7vZ1f638aLxPPu12GrIbTjV0zk
	jvtBKEbkSyJq0HNA7ZKyAJ4qyK7a6U5FucAjl1JhpqPag+C0Z9gvyrtxuXXXM4lZxrJhnTlzFcQAN
	0Emh0q2coGju0VBVY0zo2FaYgTO4QH6BE+L1IiRV+G+OfzNYb4V0G2W435KSqyWiZ0GRDk4YU32Fx
	Jz506kxcGVVXB9IUgHDc0QOcIQpvU+b8kt1CrztNpbRzRYNyQyTr9tUT+zI4A5W/CobDjeB8ieajD
	9H0DU1Pw==;
Received: from sslproxy05.your-server.de ([78.46.172.2])
	by www572.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <jesse@ponkila.com>)
	id 1u8Uuw-000OFY-2X;
	Sat, 26 Apr 2025 04:05:21 +0200
Received: from [2001:14ba:a86b:a900::1373] (helo=localhost)
	by sslproxy05.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <jesse@ponkila.com>)
	id 1u8Uuv-000OeU-1f;
	Sat, 26 Apr 2025 04:05:21 +0200
From: Jesse Karjalainen <jesse@ponkila.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-kernel@vger.kernel.org,
	Jesse Karjalainen <jesse@ponkila.com>
Subject: [PATCH] leds: pca995x: fix typo
Date: Sat, 26 Apr 2025 05:04:54 +0300
Message-ID: <20250426020454.47059-1-jesse@ponkila.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authenticated-Sender: jesse@ponkila.com
X-Virus-Scanned: Clear (ClamAV 1.0.7/27619/Fri Apr 25 10:35:46 2025)

Remove the stray space between the '.' and the 'data' field name in
the PCA995x device-tree match table.

Signed-off-by: Jesse Karjalainen <jesse@ponkila.com>
---
 drivers/leds/leds-pca995x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-pca995x.c b/drivers/leds/leds-pca995x.c
index 11c7bb69573e..6ad06ce2bf64 100644
--- a/drivers/leds/leds-pca995x.c
+++ b/drivers/leds/leds-pca995x.c
@@ -197,7 +197,7 @@ MODULE_DEVICE_TABLE(i2c, pca995x_id);
 
 static const struct of_device_id pca995x_of_match[] = {
 	{ .compatible = "nxp,pca9952", .data = &pca9952_chipdef },
-	{ .compatible = "nxp,pca9955b", . data = &pca9955b_chipdef },
+	{ .compatible = "nxp,pca9955b", .data = &pca9955b_chipdef },
 	{ .compatible = "nxp,pca9956b", .data = &pca9956b_chipdef },
 	{},
 };

base-commit: 02ddfb981de88a2c15621115dd7be2431252c568
-- 
2.48.1


