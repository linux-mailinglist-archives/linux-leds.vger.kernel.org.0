Return-Path: <linux-leds+bounces-3355-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BC059C1E06
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 14:29:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EAE091C20749
	for <lists+linux-leds@lfdr.de>; Fri,  8 Nov 2024 13:29:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFCC11EF92B;
	Fri,  8 Nov 2024 13:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wc24V5K6"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1791EF929;
	Fri,  8 Nov 2024 13:29:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731072566; cv=none; b=PMvzKmhTNcAjBBR51XNBhCB24YzGwPFXRwaPI2dUtdHxFK3emI6hGMx5XEMUbaUDiYrKUnyMmMqs/4fcjGR1Mj9F9G9fdKmtQNeuf+csM9XFkNc/4jAWFGHcnXSu9Ms85IyLEREIhnfSYNZX9Xf0QQq8tW7y8n+tGvOBRyjCQZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731072566; c=relaxed/simple;
	bh=8xxaLaeqEAFIPs2iLJxr0JwGVdVOwPrRyzlBgb3dEzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=FuAoo9hBHcKF1GA2Zl/M5SFRL9JWYEs7p0rC4bu3AzbaDb1/zlgwW3RAtGbcl/2RSci6DaJQDmZLPZN4AtpIuAOwKYyKzq2xqpxw2E8Ch1wcFhiojnufLpnuCNDKz7PhyIGnwKIEXSdC0Dv+eldzT5I7yWkf50IhERFB/ServFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wc24V5K6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B68B9C4CED5;
	Fri,  8 Nov 2024 13:29:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731072566;
	bh=8xxaLaeqEAFIPs2iLJxr0JwGVdVOwPrRyzlBgb3dEzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wc24V5K6NOmGgBHHVV6UvSugHFUqXmenpiTWH6orzO5BlrtW+PUwiPDQD+HJ44EoE
	 7FMhMpj8GlWHVN7zMwdqKj6K9c3QgHC7WxRC4FO0kNgJ2d1gnqCVtyHKJl6KfZr5ya
	 7E6ZtfsPifyMDyrxehh+OK5jnKVOk60pIZzT3lpns+geuj6HvoqlH5UR0Fkszx3NC1
	 tckRNO5AlzMweNptHTsAGWGNRoSpQ3zXXaX8kpPDG6qJT4iWd22+WnDxYOpbL5Zdk0
	 cIFcYKD+DjAAQVPuUC6uMd7duXhCOJu6DcYPSOR9kd7I3fx+YkOzewnC5kYJSNalv/
	 V6MvpTSX8VHWQ==
From: =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org,
	Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH leds v6 08/12] platform: cznic: turris-omnia-mcu: Inform about missing LED panel brightness change interrupt feature
Date: Fri,  8 Nov 2024 14:28:41 +0100
Message-ID: <20241108132845.31005-9-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108132845.31005-1-kabel@kernel.org>
References: <20241108132845.31005-1-kabel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

When reading MCU firmware features, check also for the LED panel
brightness change interrupt feature, and suggest upgrading the firmware
if it is missing.

Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/platform/cznic/turris-omnia-mcu-base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/cznic/turris-omnia-mcu-base.c b/drivers/platform/cznic/turris-omnia-mcu-base.c
index bb871226e357..3bb4a3cfdb29 100644
--- a/drivers/platform/cznic/turris-omnia-mcu-base.c
+++ b/drivers/platform/cznic/turris-omnia-mcu-base.c
@@ -258,6 +258,7 @@ static int omnia_mcu_read_features(struct omnia_mcu *mcu)
 		_DEF_FEAT(NEW_INT_API,		"new interrupt API"),
 		_DEF_FEAT(POWEROFF_WAKEUP,	"poweroff and wakeup"),
 		_DEF_FEAT(TRNG,			"true random number generator"),
+		_DEF_FEAT(BRIGHTNESS_INT,	"LED panel brightness change interrupt"),
 #undef _DEF_FEAT
 	};
 	struct i2c_client *client = mcu->client;
-- 
2.45.2


