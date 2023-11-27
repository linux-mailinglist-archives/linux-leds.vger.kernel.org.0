Return-Path: <linux-leds+bounces-173-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4934F7F9C70
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 10:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D732EB20CAF
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 09:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D1BDD292;
	Mon, 27 Nov 2023 09:14:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iN6sC3Mp"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E034B14F87;
	Mon, 27 Nov 2023 09:14:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 041C3C433C9;
	Mon, 27 Nov 2023 09:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701076449;
	bh=DHYCKu65cSstrrIdF03A4jEuXB7unahDVkMh4BL9CKo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iN6sC3MpQfNv1EpyQZFoONrjp7xB5wX6a+Sw/vFi7bp4VixpXh+W7T+K/LJN368B8
	 vkCRmVZK29aFqSS5l0/xLkmSZPLZjziFso+Y2B+TA8gWzd2SgXs8MJ8i12YJdl2gG+
	 wCqJ/FoXjxUh0shL+N0HFe3IsWd7tojKz3xJtFMQQTOWd2gKZjg7QVOVawgRP34u3L
	 5M79xYmtT2661AW36XyfZn2Nx4nGOLQ1egjMfdGA97EaT8132TY9EgmnCK287O5p1T
	 d02Sp7ll+uCOdd/qwnIKE3wc7wB9uWpm4IbmxYxAZmiEkz2Y3E5rIrvfvjh6KvA1VG
	 0+RL+lmVV/56Q==
Date: Mon, 27 Nov 2023 09:14:03 +0000
From: Lee Jones <lee@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, andy.shevchenko@gmail.com,
	kernel@sberdevices.ru, rockosov@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	George Stark <gnstark@salutedevices.com>
Subject: Re: [PATCH v4 06/11] leds: aw200xx: add delay after software reset
Message-ID: <20231127091403.GF1470173@google.com>
References: <20231121202835.28152-1-ddrokosov@salutedevices.com>
 <20231121202835.28152-7-ddrokosov@salutedevices.com>
 <20231123163816.GG1354538@google.com>
 <20231124093722.picykrqaewxlxa7h@CAB-WSD-L081021>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231124093722.picykrqaewxlxa7h@CAB-WSD-L081021>

On Fri, 24 Nov 2023, Dmitry Rokosov wrote:

> Hello Lee,
> 
> Thank you for the detailed review!
> 
> Please find my answer below.
> 
> On Thu, Nov 23, 2023 at 04:38:16PM +0000, Lee Jones wrote:
> > On Tue, 21 Nov 2023, Dmitry Rokosov wrote:
> > 
> > > From: George Stark <gnstark@salutedevices.com>
> > > 
> > > According to datasheets of aw200xx devices software reset takes at
> > > least 1ms so add delay after reset before issuing commands to device.
> > 
> > Are you able to use an auto-correct tool to sharpen the grammar a little?
> > 
> > > Signed-off-by: George Stark <gnstark@salutedevices.com>
> > > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > > Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> > > ---
> > >  drivers/leds/leds-aw200xx.c | 3 +++
> > >  1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
> > > index 4bce5e7381c0..bb17e48b3e2a 100644
> > > --- a/drivers/leds/leds-aw200xx.c
> > > +++ b/drivers/leds/leds-aw200xx.c
> > > @@ -321,6 +321,9 @@ static int aw200xx_chip_reset(const struct aw200xx *const chip)
> > >  	if (ret)
> > >  		return ret;
> > >  
> > > +	/* according to datasheet software reset takes at least 1ms */
> > 
> > Please start sentences with an uppercase char.
> > 
> > "According to the datasheet, software resets take at least 1ms"
> >               ^                            ^     ^
> > 
> 
> Here it's only one 'software reset' mentioned.

That's okay.  The English is still 100% valid, since this describes them
happening more than once; say per week, per year, per lifetime of the
H/W or some such.  If you *really* want to describe one reset happening
once, ever, then you can say "a software reset takes".

> > > +	fsleep(1000);
> > > +
> > >  	regcache_mark_dirty(chip->regmap);
> > >  	return regmap_write(chip->regmap, AW200XX_REG_FCD, AW200XX_FCD_CLEAR);
> > >  }

-- 
Lee Jones [李琼斯]

