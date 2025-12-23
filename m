Return-Path: <linux-leds+bounces-6463-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B43E6CDAB65
	for <lists+linux-leds@lfdr.de>; Tue, 23 Dec 2025 22:52:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 877FA301B3F5
	for <lists+linux-leds@lfdr.de>; Tue, 23 Dec 2025 21:52:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A714311C2D;
	Tue, 23 Dec 2025 21:52:31 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE279199EAD;
	Tue, 23 Dec 2025 21:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766526751; cv=none; b=cwKkGEaKDMpa+dv94m5Nzw9IMQXycdVe05d2AWpeECNuJ2RKpLlR5aV2EaYKLoEUXMGrKu0S5GrowtIovNQ/StyqOWSSZWIna2LC+zcDFzsAjzaSksZ0njIhrbH5FE+pqIqG1AcxuRxEOPXYs5Ye7wTIDPF3kqogIn1jtZ2A13E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766526751; c=relaxed/simple;
	bh=wYLPmD/kSg7BJHILh61NFTIWSODhiSPUe2iSGHVj26s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F3tb0n4sUNk7AObi3xdyIuq5kwwl/mK8gDX80lNBu/VDgnareRLz+WMife7hYn5xWMWQguiYTAuIFYp+oizNWn0wvt90fxa/PirszNCTqpK4cXOJX8LE6Qvj2zS7Nq7e3GNM1Jyqkp+ddlQ/7pWIgk7Ox9FiEK6VVxLraMN+fWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space; spf=pass smtp.mailfrom=timmermann.space; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=timmermann.space
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=timmermann.space
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dbTJ24cHBz9srq;
	Tue, 23 Dec 2025 22:52:18 +0100 (CET)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=linux@timmermann.space
Date: Tue, 23 Dec 2025 22:52:14 +0100
From: Lukas Timmermann <linux@timmermann.space>
To: Lee Jones <lee@kernel.org>, pavel@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 0/2] Support for Osram as3668 LED driver
Message-ID: <aUsN9pK1i3u5D8Uc@archstation>
References: <20251125114015.355487-1-linux@timmermann.space>
 <176572651204.304949.14632935583958995926.b4-ty@kernel.org>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <176572651204.304949.14632935583958995926.b4-ty@kernel.org>
X-Rspamd-Queue-Id: 4dbTJ24cHBz9srq

On Sun, Dec 14, 2025 at 03:35:12PM +0000, Lee Jones wrote:
> On Tue, 25 Nov 2025 12:40:13 +0100, Lukas Timmermann wrote:
> > This patch adds basic support for the as3668 driver IC via I2C interface.
> > The IC is capable of driving four individual LEDs up to 25.5mA per
> > channel. Hardware blinking would be theoretically possible, but this chip
> > only supports a few set on/off-delays which makes using that feature
> > unfeasable, therefore my driver doesn't offer that capability.
> > It's intended applications is in mobile devices such as phones,
> > tablets and cameras. This driver was tested and is working on
> > a google-manta which is running postmarketOS with a near mainline kernel.
> > Also there is a patch in the linux mailing list for that device:
> > https://lore.kernel.org/all/20251120201958.1970828-1-linux@timmermann.space/
> > The register names and values are taken from the official datasheet which
> > can be found here:
> > https://www.mouser.com/datasheet/2/588/AS3668_DS000196_1-00-1512816.pdf
> > 
> > [...]
> 
> Applied, thanks!
Overall great news, thanks. There is a newer version (v13) with a few fixes
available here:
https://lore.kernel.org/all/20251201230601.285641-1-linux@timmermann.space/
Have you seen this version? 
There are smaller corrections around as3668_channel_mode_set()
Could be worth to drop this version and reapply. What are your thoughts on this?

Best regards
Lukas Timmermann
> 
> [1/2] dt-bindings: leds: Add new as3668 support
>       commit: a093bc82b6013c40add22b96deed4d2b67905f41
> [2/2] leds: as3668: Driver for the ams Osram 4-channel i2c LED driver
>       commit: 8856d7fe1758937ac528770f552ec58c388c255b
> 
> --
> Lee Jones [李琼斯]
> 
> 

