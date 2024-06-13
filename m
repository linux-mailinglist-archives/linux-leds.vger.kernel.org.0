Return-Path: <linux-leds+bounces-1903-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3BE9075A1
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 16:49:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 26118285399
	for <lists+linux-leds@lfdr.de>; Thu, 13 Jun 2024 14:49:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 580DA14658F;
	Thu, 13 Jun 2024 14:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="XN1JFlti"
X-Original-To: linux-leds@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4245A145FEA;
	Thu, 13 Jun 2024 14:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718290130; cv=none; b=DH9ewGyvSybQHK78EtosZsLLbGf8XelLk0V+/cdItviYlO9IhGCA6vD+sy1DR+tUjRNoYyN7LPGaeNdpqP3ynI5iSkqZ3vfNbyNym51BqF/5uGaRLezYOA8pYEreFXGbVGbBVOT0R0MFIKPGZLm0Dgkd237GMar/wtBCD2HwpfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718290130; c=relaxed/simple;
	bh=RYdWV51r8PcyeNbSw5etkeGipgLJ2iNvDv6KpRFCB3g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UBiU4M+WYADDXGhdDAakXHLdpoQL1DicWrXG5taLh+l1drDRKherLB6SEbQUAddMCoI6VmyESIiiwnrRW2vIW3DJnQAfSfjBcWSzXr0olBreGeaojBsWjPG3B/qmjtTp5qIn0pK85pbSeDJLm04KSJuoZrZA+M2cSd6w/4HnGWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=XN1JFlti; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1718290120;
	bh=RYdWV51r8PcyeNbSw5etkeGipgLJ2iNvDv6KpRFCB3g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=XN1JFltiFXp2L2rqTWR4Bz22ATckDg7dp1tfm/cpV2hBrSJEvEOCSoL97+FO3IO+z
	 85ywGoHF876rW5xjwbhMHGwN7zw3rMNyabdV8OpnQSAgk0NAQBXksKAKAK2j+e5tUS
	 F6JedxHDukOqh/Zv8Ql0ybBwe6hROnjwyN0LtxKo=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Thu, 13 Jun 2024 16:48:37 +0200
Subject: [PATCH v3 2/5] leds: multicolor: Use led_get_color_name() function
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240613-cros_ec-led-v3-2-500b50f41e0f@weissschuh.net>
References: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
In-Reply-To: <20240613-cros_ec-led-v3-0-500b50f41e0f@weissschuh.net>
To: Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@weissschuh.net>, 
 Benson Leung <bleung@chromium.org>, Guenter Roeck <groeck@chromium.org>, 
 Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, Dustin Howett <dustin@howett.net>, 
 Mario Limonciello <mario.limonciello@amd.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1718290119; l=942;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=RYdWV51r8PcyeNbSw5etkeGipgLJ2iNvDv6KpRFCB3g=;
 b=OItp3aZh/jgZ1XoXq/Awow9+PJGcoX1ucS+3ULAY1SaAQkDtBjZYWsqdkIXTJJsHIMeZ7pUsA
 CuWDYaZXNKMDlICN14C6oy/Lv+V9npjsNFOx04X51PW3RxG0yI4/cYO
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

led_get_color_name() is a safer alternative to led_colors.

led-class-multicolor.c is the only external user of led_colors and its
removal allows unexporting the array.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/leds/led-class-multicolor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
index ec62a4811613..584e3786a1e7 100644
--- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -101,7 +101,7 @@ static ssize_t multi_index_show(struct device *dev,
 
 	for (i = 0; i < mcled_cdev->num_colors; i++) {
 		index = mcled_cdev->subled_info[i].color_index;
-		len += sprintf(buf + len, "%s", led_colors[index]);
+		len += sprintf(buf + len, "%s", led_get_color_name(index));
 		if (i < mcled_cdev->num_colors - 1)
 			len += sprintf(buf + len, " ");
 	}

-- 
2.45.2


