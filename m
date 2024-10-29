Return-Path: <linux-leds+bounces-3190-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 336FB9B4B7F
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 14:57:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CCC601F227A9
	for <lists+linux-leds@lfdr.de>; Tue, 29 Oct 2024 13:57:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2576F20696B;
	Tue, 29 Oct 2024 13:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="txd4ZATU"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F6C20695A;
	Tue, 29 Oct 2024 13:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730210225; cv=none; b=EJkm3/NiPqh/C1WC+vncbpmwgW4WpkLm1douwnQ1eI6WhaoKvBIFl+7uN5Sh3ei3c5mzAa+isx51Td0BcpLtrvl1GCw4A4Rz2u+qb2kQtZoC9qncJivuJkumkoeOK4pJY563ogPcRZ5shz7K6BCMd+eSLHJnoV/P8cPluFk43Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730210225; c=relaxed/simple;
	bh=8xxaLaeqEAFIPs2iLJxr0JwGVdVOwPrRyzlBgb3dEzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=twHRs27sDmrpw7UpMpyvBPBY/qj6KVzX7MF4IC3UXvRdZfMzflBv0vxu7tb/UanqVSzVKU7HAKVoQafDmRLxx4pwO82y9wzR31YYofsJfhgl3lTccSH3JynZ0BOkJMjuFeNmfs2IT86zs+17tA5wuiYYnL+ux5WJS8FmrXw/FGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=txd4ZATU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA6DC4CEF1;
	Tue, 29 Oct 2024 13:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730210224;
	bh=8xxaLaeqEAFIPs2iLJxr0JwGVdVOwPrRyzlBgb3dEzU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=txd4ZATUmkVgcfssV3MltLERVxSDgAMZ2Y+lxSzZa3S2hV5JheIzHsfoon8HN0jF5
	 COA3Wx2HidN/cyWiHPue6v8RPgFiPfZ1SNi9BEPon4LvWl8nLT3wc2eP/AydaikD5l
	 PymDmNFjKegAMACjHVv9n3NSjOTsB65bsYnshIFnLJpLQCeuvQy8jZmiU8bwTvb+i/
	 xmSkTHvmG4UYhj4WSf+a8NYu4wlJa3OFlGJf/3gC0DevdN/vIiXJusFPqeGIwNJO6p
	 VBzW0bvbIAk9jXbIRtJ7OTVp6Gkc5mWlypWmWOfhRBJ3kfQLFzh1zNIddo9tRZd+vD
	 QG0IKbN05MGvw==
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
Subject: [PATCH leds v4 08/12] platform: cznic: turris-omnia-mcu: Inform about missing LED panel brightness change interrupt feature
Date: Tue, 29 Oct 2024 14:56:17 +0100
Message-ID: <20241029135621.12546-9-kabel@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241029135621.12546-1-kabel@kernel.org>
References: <20241029135621.12546-1-kabel@kernel.org>
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


