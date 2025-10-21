Return-Path: <linux-leds+bounces-5834-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F1BACBF5E1F
	for <lists+linux-leds@lfdr.de>; Tue, 21 Oct 2025 12:50:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9161218C79B1
	for <lists+linux-leds@lfdr.de>; Tue, 21 Oct 2025 10:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCE1932C931;
	Tue, 21 Oct 2025 10:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ny3nfq0f"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5B3E32C33B;
	Tue, 21 Oct 2025 10:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761043815; cv=none; b=gXFjzlOPqphVlU6eMl6Sm2yRRWhFl9alGjz5Adl6J2ELPFziUm5+AarsDTKjwNmq6aIjv7/W1wqzcgJGFZCPliMTCWxGqj5JmjdO7hevrGxTIVPKaTe9Ne3st/7VVbJQfZosP0mwLwg6+yshqUu5EyyTt49gRTF2JnfSxz03SpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761043815; c=relaxed/simple;
	bh=K/2vERcbAwFCVwr76LZbkx/kjJBJLSsur2UIOY6FUpM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eOXEpa8pr/02HCIGqqPZLxZe6v7CvomnuncfvqxVQrC27lb1QROPiJtLChhjVc0aoKogdaAus+SOFr/dmfSpaCCxCVrezviadEPeVG+oMG502Bx5tkQZIGn7cMs4EgxlO9Z7NyTqhcVyf0mh1RatNYRipk11dkTcRavgSPBupS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ny3nfq0f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3E24C116B1;
	Tue, 21 Oct 2025 10:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761043815;
	bh=K/2vERcbAwFCVwr76LZbkx/kjJBJLSsur2UIOY6FUpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ny3nfq0fWu7YAOY8Rane5t5+nVdm4p2WchbMvlCQWdTZiX+HJQ3u0xYL03LsIsn3f
	 rRTLNVZSPUkEI9c2HtCxrUAGwUwnJIlAL6yG7dEiwFEB4OCFV0ZM+bZO//yn4YuCMb
	 W8EZl18n4easc0wXhlZ3Fp0dXfMOaiCWUdwpaPJRVhzDTkBcNZKR9l601GgZJ9H+3e
	 +pQwwu5LS4LlI3RRsz1Emxbo+OyW/yvvz1IKW/6j/lYO0yqwGIVnqG1+cvIe3zZZvv
	 xFJlnLjNvpRFOH1M8s6x8YPX3UyprAIb9ypIj7j2/lwwRkoi7+D8vw+kqbmwPPs6+U
	 N2xlM6Eo/S4XQ==
Date: Tue, 21 Oct 2025 11:50:10 +0100
From: Lee Jones <lee@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	linux-leds@vger.kernel.org, netdev@vger.kernel.org,
	Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
	Jacek Anaszewski <jacek.anaszewski@gmail.com>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Subject: Re: [PATCH leds v2 00/10] Add support for offloading netdev trigger
 to HW + example implementation for Turris Omnia
Message-ID: <20251021105010.GD475031@google.com>
References: <20210601005155.27997-1-kabel@kernel.org>
 <CA+V-a8tW9tWw=-fFHXSvYPeipd8+ADUuQj7DGuKP-xwDrdAbyQ@mail.gmail.com>
 <7d510f5f-959c-49b7-afca-c02009898ef2@lunn.ch>
 <CA+V-a8ve0eKmBWuxGgVd_8uzy0mkBm=qDq2U8V7DpXhvHTFFww@mail.gmail.com>
 <87875554-1747-4b0e-9805-aed1a4c69a82@lunn.ch>
 <CA+V-a8vv=5yRDD-fRMohTiJ=8j-1Nq-Q7iU16Opoe0PywFb6Zg@mail.gmail.com>
 <bd95b778-a062-47b1-a386-e4561ef0c8cd@lunn.ch>
 <CA+V-a8uB2WxU74mhkZ3SCpcty4T10Y3MOAf-SkodLCkp-_-AGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+V-a8uB2WxU74mhkZ3SCpcty4T10Y3MOAf-SkodLCkp-_-AGA@mail.gmail.com>

On Fri, 17 Oct 2025, Lad, Prabhakar wrote:

> Hi Andrew,

[...]

> > mxl-gpy.c:              .led_brightness_set = gpy_led_brightness_set,

[...]

> Thank you for the pointers.

Yes, thank you, Andrew.

-- 
Lee Jones [李琼斯]

