Return-Path: <linux-leds+bounces-5166-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C907B15203
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 19:19:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 35AB618960B1
	for <lists+linux-leds@lfdr.de>; Tue, 29 Jul 2025 17:19:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B361029898D;
	Tue, 29 Jul 2025 17:19:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b="l6zPQ/b6"
X-Original-To: linux-leds@vger.kernel.org
Received: from mx.olsak.net (mx.olsak.net [37.205.8.231])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49420220F35;
	Tue, 29 Jul 2025 17:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.8.231
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753809549; cv=none; b=Um3655Ro2szoPhkoaT1Xbk40uFyeakRRU+wq5/I0yG3Rz4E44uDZKbiLf6ZZoZam12jS2WbeUPJNGEmkVZ6G5DtZfx+bOIq/ps7KRdD/fy79hXYI3w3y+lDM7CbRBWBEYcZ/i9RSXJuAV5imfqPdZxBAo7y6GvNxgotip1IDHqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753809549; c=relaxed/simple;
	bh=bvWDVVpk4oQ7rFFnlM8bA7rrp960UJMZcCVetBY4MuY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fbsLf15aeMFWnmdixmBxL13ywRLXxMt0b/1ubjYpQRNiBV4M47Oo1t30BhKOUnMD2SMuTuUMCqBeSfc/idx6MRV2Aiv0iw3oPmw7S34iv2vEhi9U5AqsTxDWx+JTvn4Yzz/UOMJ2Il/SzGf2Zf0KO08x91bqIN0TLWGX7N6PATc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz; spf=pass smtp.mailfrom=dujemihanovic.xyz; dkim=pass (2048-bit key) header.d=dujemihanovic.xyz header.i=@dujemihanovic.xyz header.b=l6zPQ/b6; arc=none smtp.client-ip=37.205.8.231
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=dujemihanovic.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dujemihanovic.xyz
DKIM-Signature: a=rsa-sha256; bh=KtOg56+S4xfGCOYiMQ0mc7kx1YDPunzosiHCMEL6Lnc=;
 c=relaxed/relaxed; d=dujemihanovic.xyz;
 h=Subject:Subject:Sender:To:To:Cc:Cc:From:From:Date:Date:MIME-Version:MIME-Version:Content-Type:Content-Type:Content-Transfer-Encoding:Content-Transfer-Encoding:Reply-To:In-Reply-To:In-Reply-To:Message-Id:Message-Id:References:References:Autocrypt:Openpgp;
 i=@dujemihanovic.xyz; s=default; t=1753809529; v=1; x=1754241529;
 b=l6zPQ/b6tFVgjCiE07rNfSwynt4+rG+JW4SaQgn6QLoOLrl7bQu30/PFlWn3Obxwph6KaWZp
 ffrDMaH0yNYxo7jvfKIRqDddvv9EgdGE4GcfabhhIOuw69b0W6pr/2ngwCjEYmDWxhVByrpKNNr
 vGi6o388rs15BPK/YYJ+awyl485oiAKf0d7nx4wybw5aGZ3SU22/isYjJjlCuFINiEetMXVq6B5
 iKqC1PDW9yAXMLC0WIr0QdnDQRvL4Pi32LKRPnaXPOkNnM0T4whWO4NCXQUOvaaD/n3qH7ycJZM
 YVvM2xbt1oA56ixs5CaQ9Z1p1hElZQgCDUYsqYz8ydvEg==
Received: by mx.olsak.net (envelope-sender <duje@dujemihanovic.xyz>) with
 ESMTPS id fd44c069; Tue, 29 Jul 2025 19:18:49 +0200
From: =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
Date: Tue, 29 Jul 2025 19:18:30 +0200
Subject: [PATCH 2/2] backlight: ktd2801: Depend on GPIOLIB
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250729-expresswire-dep-fix-v1-2-635cd4cc746b@dujemihanovic.xyz>
References: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
In-Reply-To: <20250729-expresswire-dep-fix-v1-0-635cd4cc746b@dujemihanovic.xyz>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Daniel Thompson <danielt@kernel.org>, Jingoo Han <jingoohan1@gmail.com>, 
 Helge Deller <deller@gmx.de>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-leds@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-fbdev@vger.kernel.org, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje@dujemihanovic.xyz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=938; i=duje@dujemihanovic.xyz;
 s=20240706; h=from:subject:message-id;
 bh=bvWDVVpk4oQ7rFFnlM8bA7rrp960UJMZcCVetBY4MuY=;
 b=owGbwMvMwCW21nBykGv/WmbG02pJDBmdTOXied73I7Zl7j4tyjU9pG3+go1LOKest1AKj89Ru
 MyxJte6o5SFQYyLQVZMkSX3v+M13s8iW7dnLzOAmcPKBDKEgYtTACbyfz/D/zCBeN7Wif9+SRlb
 3997LL8kUj2t3XD2ttSKKxPWrg186cjIcEBPW3tjpCR3rEPkH7aH3bt8M27/3qGawnX51ck7wan
 17AA=
X-Developer-Key: i=duje@dujemihanovic.xyz; a=openpgp;
 fpr=6DFF41D60DF314B5B76BA630AD319352458FAD03

The LEDS_EXPRESSWIRE library used by the driver requires GPIOLIB. Make
sure this dependency is not left unsatisfied.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Link: https://lore.kernel.org/all/b6c481bb-e854-405e-a428-90301789fe20@infradead.org/
Signed-off-by: Duje Mihanović <duje@dujemihanovic.xyz>
---
 drivers/video/backlight/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/Kconfig b/drivers/video/backlight/Kconfig
index d9374d208ceebbf8b3c27976e9cb4d725939b942..37341474beb9982f7099711e5e2506081061df46 100644
--- a/drivers/video/backlight/Kconfig
+++ b/drivers/video/backlight/Kconfig
@@ -185,6 +185,7 @@ config BACKLIGHT_KTD253
 
 config BACKLIGHT_KTD2801
 	tristate "Backlight Driver for Kinetic KTD2801"
+	depends on GPIOLIB || COMPILE_TEST
 	select LEDS_EXPRESSWIRE
 	help
 	  Say Y to enable the backlight driver for the Kinetic KTD2801 1-wire

-- 
2.50.1


