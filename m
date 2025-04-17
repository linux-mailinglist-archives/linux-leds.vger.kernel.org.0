Return-Path: <linux-leds+bounces-4497-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EE502A914B2
	for <lists+linux-leds@lfdr.de>; Thu, 17 Apr 2025 09:05:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1676F440156
	for <lists+linux-leds@lfdr.de>; Thu, 17 Apr 2025 07:05:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 693D6215762;
	Thu, 17 Apr 2025 07:05:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFrqZ3AZ"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D932063FD;
	Thu, 17 Apr 2025 07:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744873512; cv=none; b=QIPaW2uDLVVlq5QktuIM7YTrkfjp1L2nZ6uwWBR/6o8mhyTVbaZNiWjqjdXPnf8HkDjCIq9JLA6EIiI7gpO9K0c2sG6aXscJj2DzSsg16a0SvQzG9ANRFKDZLnU+QS1bAcI4GtHiaUMI51ejCSnHkIm2uKGFYB4zv1wQX7TqXgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744873512; c=relaxed/simple;
	bh=CM3c7kttlAmkfG9mpn/1GKkcT/fF1wsADoMjIZhEQ9c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AmWooFmHy793cnNyjYAS26SMohUGzc50lpQ4iXAYldQKZ8yYvaLQ/UDhIItXOLfDptMQh3MqTJD+xmmKJCTNJYJNYtUwPI/tI+utolDtzrurOuiT0lYQRtNrPTqzVnOXqpWr9tdduZslzSeSypasXrb+/z7zBxuNE2IM826GDkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nFrqZ3AZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C6A0C4CEE4;
	Thu, 17 Apr 2025 07:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744873511;
	bh=CM3c7kttlAmkfG9mpn/1GKkcT/fF1wsADoMjIZhEQ9c=;
	h=From:To:Cc:Subject:Date:From;
	b=nFrqZ3AZisIRdjloO6fSLrsVfn0ugOh83hUZCtuHtmWP7g1SvlXGH3m3W0YyWDEIM
	 b+/wjqJ/rKAqzy12/DP/652fqkVdNM+52j0nCLzk9kP2aN0dAYsc2Kp79Oe8TLQLdB
	 XSYyJJ2ZndPf5PkUzBew8WXBiPBd9JSjzdjtkCNvX37WHWQ4keFa7/JU/GCOkM/XJz
	 GW2FPM6uxMUiboM/EPSEgoisMdOV64xcT/GhK6u6ExaPz8wvquMgVHvQCUXyQ2rOUU
	 1VZxon0MYC2EP05YONUFCJUoK/b8n2Reyhr8LXQznwh3ZWS4/rEzcoDP3W6jzfPaiD
	 jjFOIE5W1e7mQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds] leds: turris-omnia: Drop commas in the terminator entries
Date: Thu, 17 Apr 2025 09:05:07 +0200
Message-ID: <20250417070507.24929-1-kabel@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Drop commas in terminator entries of `struct attribute` array and
`struct of_device_id` array.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/leds-turris-omnia.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/leds/leds-turris-omnia.c b/drivers/leds/leds-turris-omnia.c
index 4fe1a9c0bc1b..25ee5c1eb820 100644
--- a/drivers/leds/leds-turris-omnia.c
+++ b/drivers/leds/leds-turris-omnia.c
@@ -361,7 +361,7 @@ static DEVICE_ATTR_RW(gamma_correction);
 static struct attribute *omnia_led_controller_attrs[] = {
 	&dev_attr_brightness.attr,
 	&dev_attr_gamma_correction.attr,
-	NULL,
+	NULL
 };
 ATTRIBUTE_GROUPS(omnia_led_controller);
 
@@ -527,7 +527,7 @@ static void omnia_leds_remove(struct i2c_client *client)
 
 static const struct of_device_id of_omnia_leds_match[] = {
 	{ .compatible = "cznic,turris-omnia-leds", },
-	{},
+	{ }
 };
 MODULE_DEVICE_TABLE(of, of_omnia_leds_match);
 
-- 
2.49.0


