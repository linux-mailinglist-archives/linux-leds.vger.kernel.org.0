Return-Path: <linux-leds+bounces-4610-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E92CAB0E5C
	for <lists+linux-leds@lfdr.de>; Fri,  9 May 2025 11:12:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 137421BC4F74
	for <lists+linux-leds@lfdr.de>; Fri,  9 May 2025 09:12:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EAF6274FFB;
	Fri,  9 May 2025 09:12:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E+cjk0yy"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009B34964E;
	Fri,  9 May 2025 09:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781946; cv=none; b=kyOEGhbDRO6LUeyx9BN6Th5/f5hDJrbyMe2ICBaVUyplpFonpMcaNsEZ8CXbnGuVq7npzV1eodpruIyVrRa5PbHU3K3JJvkKutW5MmT2DD9NEjdRUu2dKw8sw2j7+B9nWZ4ahPYjmdUfxiYXoTw7OHfSWyKk2+Xj6Tsnhba2xak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781946; c=relaxed/simple;
	bh=LRDCv2DLLNlrGCaFKvlPxw4rdYXFaY3NsGc82HtsQTw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hlsWo1psyCRpJYWGyFkBlDtMglz+GlRd0k/sGxeb3mvC+lR1oq93/569Q5g7Y0mLeUWp7JHdJXRzoNi7Oske6T/V71x2QrfHMFTSUxHOhHlTaL0CsVL9DASKyntUiXEdnTqjWrJ4Sqsimel6ZtMG5Vko3wBkJKPVEN/VGlUg5TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E+cjk0yy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76DA5C4CEEE;
	Fri,  9 May 2025 09:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746781945;
	bh=LRDCv2DLLNlrGCaFKvlPxw4rdYXFaY3NsGc82HtsQTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E+cjk0yyG0nPD29rJU+wSm3TBB71u8BKQsXWAwzKGNhcSIlA6WUKGY2I7FKikbZfS
	 0anlG0tgVAyYoPZJmN9zkJbFDTUXeyPcIW+rEGYUIBFq+TALZbQxn7aKuIriNcA5QF
	 7dwXTh9OKRn54uodCphSNn1yNv6/fgREU9VX/T5FXq1gASC5elkLVTFBIn36IJt7E1
	 9m0EgZl+0ApiFlFD5oObfzhEvi4sdvmSivCySveJrrbTJoJS7iyVKgHbBsnwkoxJ4d
	 nn1sNP6jKSb5ctyMid0XgdDr1ouAqTmN60B6Q5ENAh90B89Ct8QgsNQ8E4X0NbbWwG
	 yQ+dRdQVsMxqg==
Date: Fri, 9 May 2025 10:12:20 +0100
From: Lee Jones <lee@kernel.org>
To: Matthias Fend <matthias.fend@emfend.at>
Cc: Pavel Machek <pavel@ucw.cz>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bsp-development.geo@leica-geosystems.com
Subject: Re: [PATCH v3 2/2] leds: tps6131x: add support for Texas Instruments
 TPS6131X flash LED driver
Message-ID: <20250509091220.GB2492385@google.com>
References: <20250423-leds-tps6131x-v3-0-ca67d346a4ea@emfend.at>
 <20250423-leds-tps6131x-v3-2-ca67d346a4ea@emfend.at>
 <20250501110306.GF1567507@google.com>
 <74577715-b644-4281-8e9b-b481d2a026f3@emfend.at>
 <20250508143146.GP3865826@google.com>
 <8220a150-b114-441a-a13a-62dc5dbf0ade@emfend.at>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8220a150-b114-441a-a13a-62dc5dbf0ade@emfend.at>

On Fri, 09 May 2025, Matthias Fend wrote:

> Hi Lee,
> 
> thank you for your answers and additional explanations.
> Except for one point, I think I understand the rest and will amend it
> accordingly.
> 
> Am 08.05.2025 um 16:31 schrieb Lee Jones:
> > On Fri, 02 May 2025, Matthias Fend wrote:
> > 
> > > Hi Lee,
> > > 
> > > thank you for taking the time for this review.
> > > 
> > > Am 01.05.2025 um 13:03 schrieb Lee Jones:
> > > > On Wed, 23 Apr 2025, Matthias Fend wrote:
> > > > 
> > > > > The TPS61310/TPS61311 is a flash LED driver with I2C interface. Its power
> > > > > stage is capable of supplying a maximum total current of roughly 1500mA.
> > > > > The TPS6131x provides three constant-current sinks, capable of sinking up
> > > > > to 2 × 400mA (LED1 and LED3) and 800mA (LED2) in flash mode. In torch mode
> > > > > each sink (LED1, LED2, LED3) supports currents up to 175mA.
> > > > > 
> > > > > Signed-off-by: Matthias Fend <matthias.fend@emfend.at>
> > > > > ---
> > > > >    MAINTAINERS                        |   7 +
> > > > >    drivers/leds/flash/Kconfig         |  11 +
> > > > >    drivers/leds/flash/Makefile        |   1 +
> > > > >    drivers/leds/flash/leds-tps6131x.c | 798 +++++++++++++++++++++++++++++++++++++
> > > > >    4 files changed, 817 insertions(+)

[...]

> > > > > +static int tps6131x_probe(struct i2c_client *client)
> > > > > +{
> > > > > +	struct tps6131x *tps6131x;
> > > > > +	int ret;
> > > > > +
> > > > > +	tps6131x = devm_kzalloc(&client->dev, sizeof(*tps6131x), GFP_KERNEL);
> > > > > +	if (!tps6131x)
> > > > > +		return -ENOMEM;
> > > > > +
> > > > > +	tps6131x->dev = &client->dev;
> > > > > +	i2c_set_clientdata(client, tps6131x);
> > > > 
> > > > If you already have client, to fetch this, you'll already have access to dev.
> > > 
> > > I understand that in principle. However, I'm still not entirely sure what
> > > exactly I should change. Could you please provide me with some further
> > > guidance?
> > 
> > Yes, don't store 'dev' in 'tps6131x'.
> 
> Ah, I see. Yes, the functions currently using 'dev' are all called from the
> probe path, so I could just pass 'dev' as a separate argument and remove it
> from 'tps6131x'.
> But since I now also output a message with dev_err in
> tps6131x_torch_refresh_handler() in case of an error, I need 'tps6131x->dev'
> there. I haven't thought of any other way to get 'dev' here.
> 
> In this context, is it okay for you if 'dev' remains a member of 'tps6131x'?

Ah yes.  Looks like you do need it then.  No problem.

-- 
Lee Jones [李琼斯]

