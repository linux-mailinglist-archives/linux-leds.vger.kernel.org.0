Return-Path: <linux-leds+bounces-193-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C07297FCB6A
	for <lists+linux-leds@lfdr.de>; Wed, 29 Nov 2023 01:35:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 72ACE1F20FAF
	for <lists+linux-leds@lfdr.de>; Wed, 29 Nov 2023 00:35:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FF2374;
	Wed, 29 Nov 2023 00:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="O2EKC4lJ"
X-Original-To: linux-leds@vger.kernel.org
X-Greylist: delayed 560 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 28 Nov 2023 16:35:29 PST
Received: from relay.smtp-ext.broadcom.com (lpdvsmtp11.broadcom.com [192.19.166.231])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D105E19A7;
	Tue, 28 Nov 2023 16:35:29 -0800 (PST)
Received: from mail-lvn-it-01.lvn.broadcom.net (mail-lvn-it-01.lvn.broadcom.net [10.36.132.253])
	by relay.smtp-ext.broadcom.com (Postfix) with ESMTP id 0E229C001643;
	Tue, 28 Nov 2023 16:26:09 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 relay.smtp-ext.broadcom.com 0E229C001643
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=broadcom.com;
	s=dkimrelay; t=1701217569;
	bh=gbwr4Aa7VlrPDI1za+jF9nhh4IDn/MUXtOuvYtaY/bM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=O2EKC4lJDNo+CW1xXUcu/ER4BfXTDIXwO6BmCcoyWeYD5YPXLBVJsJHJdiyfceKyY
	 XhKeXuvZqo84Rx/z6zTBAps8+gfR6UsBn6jk6KmLAgn8u7FH+poDiYVyQJ4hNLUjYy
	 C92sua3H/Slw6FTS5DJIQIQ3lUE4R0QS559QQdXc=
Received: from fainelli-desktop.igp.broadcom.net (fainelli-desktop.dhcp.broadcom.net [10.67.48.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail-lvn-it-01.lvn.broadcom.net (Postfix) with ESMTPSA id C3AED18041CAC4;
	Tue, 28 Nov 2023 16:26:07 -0800 (PST)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Stefan Wahren <wahrenst@gmx.net>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH V2 2/2] ARM: dts: bcm2711-rpi-400: Fix delete-node of led_act
Date: Tue, 28 Nov 2023 16:26:08 -0800
Message-Id: <20231129002608.1041601-1-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231118124252.14838-3-wahrenst@gmx.net>
References: <20231118124252.14838-1-wahrenst@gmx.net> <20231118124252.14838-3-wahrenst@gmx.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Florian Fainelli <f.fainelli@gmail.com>

On Sat, 18 Nov 2023 13:42:52 +0100, Stefan Wahren <wahrenst@gmx.net> wrote:
> The LED ACT which is included from bcm2711-rpi-4-b doesn't exists
> on the Raspberry Pi 400. So the bcm2711-rpi-400.dts tries to
> use the delete-node directive in order to remove the complete
> node. Unfortunately the usage get broken in commit 1156e3a78bcc
> ("ARM: dts: bcm283x: Move ACT LED into separate dtsi")
> and now ACT and PWR LED using the same GPIO and this prevent
> probing of led-gpios on Raspberry Pi 400:
> 
>     leds-gpio: probe of leds failed with error -16
> 
> So fix the delete-node directive.
> 
> Fixes: 1156e3a78bcc ("ARM: dts: bcm283x: Move ACT LED into separate dtsi")
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---

Applied to https://github.com/Broadcom/stblinux/commits/devicetree/fixes, thanks!
--
Florian

