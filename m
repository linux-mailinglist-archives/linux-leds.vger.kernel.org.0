Return-Path: <linux-leds+bounces-6344-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF2EC8E0EA
	for <lists+linux-leds@lfdr.de>; Thu, 27 Nov 2025 12:32:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5FCCE4E6445
	for <lists+linux-leds@lfdr.de>; Thu, 27 Nov 2025 11:32:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D88E032825B;
	Thu, 27 Nov 2025 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A6OkcU2+"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C101CEAA3;
	Thu, 27 Nov 2025 11:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764243139; cv=none; b=f9y1ztXVO0ADFSEEuyvsIbkl7ac/qfJIEHS9yjoJPnRK57fhz9I9s6DWol/1pbhAwhnr8YpGWdus7sCJ2nECG6SFbmoMh4fjpH6NY7T+iYpsks1AM4tbndhrLBLRxnxIP5Y6eHl7zSH07aouqqRMCJA47OrVD5zFUF++mGswacY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764243139; c=relaxed/simple;
	bh=tj0lS7DdoAPQr2ERf+1y9nts1ZyFCni7ZhxheEkBTvg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V9bHEkNe7qAxkPQRxrmCLfPsGLVHFIbI+jsSGspSfIPsurbVocRWLU6id7l9F6ZG3QHjQ7lRPLsMEg2fa72DsyGbmSDLnQ0TyE5Bu7Rah/BR/uMqO8bLsNWmhi7di7vWkYv1oyDkacXyyMcN11f3bE7z3pbemWDCkBLPVFZYIFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A6OkcU2+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543A5C4CEF8;
	Thu, 27 Nov 2025 11:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764243139;
	bh=tj0lS7DdoAPQr2ERf+1y9nts1ZyFCni7ZhxheEkBTvg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A6OkcU2+6vY+ruG5rNfD4I2Q0lW8Xx8u7um9781+twFJpfMSP0eI/nHoDT5lud0Tn
	 3Iv+q1EID5qMZwczSqUrcLaTzLzhQpPKdPxYi5f1y5HoLmFSbUIOvc7QLeNmo2iAZb
	 /iEm6J4imT4tFFCYCA8TdkBvFAxSYreQB0Jy0o6VXsi36AfHY8JypZzxH+272BX9cU
	 yASq2HgE64s/4G4q5SqaL2Z6P7QuQ6Zh7j+u6weD4X3dR0123qxWOj7WMMhZqOmlXh
	 2fkjnLd/oV6R3gC1oKK7acgYGy2jXvL249MTa52xJbPWkD9SIymA1LXk9SZJ5IXJ22
	 F8AqGFErnV12A==
Date: Thu, 27 Nov 2025 11:32:13 +0000
From: Lee Jones <lee@kernel.org>
To: Nam Tran <trannamatk@gmail.com>
Cc: gregkh@linuxfoundation.org, pavel@kernel.org, rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net, linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v18 2/3] leds: add basic support for TI/National
 Semiconductor LP5812 LED Driver
Message-ID: <20251127113213.GI3070764@google.com>
References: <20251125134836.GC1127788@google.com>
 <20251126160024.141129-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251126160024.141129-1-trannamatk@gmail.com>

On Wed, 26 Nov 2025, Nam Tran wrote:

> On Tue, 25 Nov 2025, Lee Jones wrote:
> 
> > > +static ssize_t parse_drive_mode(struct lp5812_chip *chip, const char *str)
> > > +{
> > > +	int i;
> > > +
> > > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_0 = false;
> > > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_1 = false;
> > > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_2 = false;
> > > +	chip->u_drive_mode.s_drive_mode.mix_sel_led_3 = false;
> > > +
> > > +	if (sysfs_streq(str, LP5812_MODE_DIRECT_NAME)) {
> > > +		chip->u_drive_mode.s_drive_mode.led_mode = LP5812_MODE_DIRECT_VALUE;
> > > +		return 0;
> > > +	}
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(chip_mode_map); i++) {
> > > +		if (!sysfs_streq(str, chip_mode_map[i].mode_name))
> > > +			continue;
> > > +
> > > +		chip->u_drive_mode.s_drive_mode.led_mode = chip_mode_map[i].mode;
> > > +		chip->u_scan_order.s_scan_order.scan_order_0 = chip_mode_map[i].scan_order_0;
> > > +		chip->u_scan_order.s_scan_order.scan_order_1 = chip_mode_map[i].scan_order_1;
> > > +		chip->u_scan_order.s_scan_order.scan_order_2 = chip_mode_map[i].scan_order_2;
> > > +		chip->u_scan_order.s_scan_order.scan_order_3 = chip_mode_map[i].scan_order_3;
> > 
> > Where are all of these used?
> 
> These fields are part of unions (u_drive_mode and u_scan_order).
> The bitfields are packed into drive_mode_val and scan_order_val, which are
> written to DEV_CONFIG1 and DEV_CONFIG2 in lp5812_set_drive_mode_scan_order().

Sure, but where.  What line of code?

-- 
Lee Jones [李琼斯]

