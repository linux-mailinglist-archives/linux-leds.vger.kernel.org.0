Return-Path: <linux-leds+bounces-172-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DEC1D7F9C27
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 09:58:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 87B8F280CF4
	for <lists+linux-leds@lfdr.de>; Mon, 27 Nov 2023 08:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E296710A24;
	Mon, 27 Nov 2023 08:58:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Uk9vjKJH"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB5810952;
	Mon, 27 Nov 2023 08:58:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8762CC433C9;
	Mon, 27 Nov 2023 08:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701075481;
	bh=vlkRKPap0wgeSnSlCOGOwGwxoaA4L0nJ8YvdUXJ/oeg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Uk9vjKJHr7sPMTPnALarecQpDW7LAKnT4LzjIEtlya1P5X9r6ERMVISFOopfB6v4h
	 LOcELYHn2GcLnJW0rQF7EVRkBczbEiIelJtBSP0f75l31jxyugBEnozPcftGGBKhMO
	 h1F/m5pP4Bj0zKE8KWLhL/EkS+EjMxRXzUNi4VXAwsxKvtYh0c5eDtYfLEnIYhB14M
	 2IBldoTCvQdKUs6fetJXUobrYghWn2iO+wsKoSibvhBDcAPwvyKB6P2KZZZ0e4KVIY
	 H32nAcxfn0HJOv1ZCzS/jvfkgCTRR0xXvgigSDl4XefjL85MCyIPCwJw0/c3Rn+KvF
	 lDgVnLqpRt4RA==
Date: Mon, 27 Nov 2023 08:57:55 +0000
From: Lee Jones <lee@kernel.org>
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: pavel@ucw.cz, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, andy.shevchenko@gmail.com,
	kernel@sberdevices.ru, rockosov@gmail.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	George Stark <gnstark@salutedevices.com>
Subject: Re: [PATCH v4 04/11] leds: aw200xx: calculate dts property
 display_rows in the driver
Message-ID: <20231127085755.GE1470173@google.com>
References: <20231121202835.28152-1-ddrokosov@salutedevices.com>
 <20231121202835.28152-5-ddrokosov@salutedevices.com>
 <20231123163252.GF1354538@google.com>
 <20231124094146.qsgmmbwulemjikpg@CAB-WSD-L081021>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231124094146.qsgmmbwulemjikpg@CAB-WSD-L081021>

On Fri, 24 Nov 2023, Dmitry Rokosov wrote:

> On Thu, Nov 23, 2023 at 04:32:52PM +0000, Lee Jones wrote:
> > On Tue, 21 Nov 2023, Dmitry Rokosov wrote:
> > 
> > > From: George Stark <gnstark@salutedevices.com>
> > > 
> > > Get rid of device tree property "awinic,display-rows". The property
> > > value actually means number of current switches and depends on how leds
> > 
> > Nit: LEDs
> > 
> > > are connected to the device. It should be calculated manually by max
> > > used led number. In the same way it is computed automatically now.
> > 
> > As above - I won't mention this again.
> > 
> > > Max used led is taken from led definition subnodes.
> > > 
> > > Signed-off-by: George Stark <gnstark@salutedevices.com>
> > > Signed-off-by: Dmitry Rokosov <ddrokosov@salutedevices.com>
> > > ---
> > >  drivers/leds/leds-aw200xx.c | 39 +++++++++++++++++++++++++------------
> > >  1 file changed, 27 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/leds/leds-aw200xx.c b/drivers/leds/leds-aw200xx.c
> > > index 7762b3a132ac..4bce5e7381c0 100644
> > > --- a/drivers/leds/leds-aw200xx.c
> > > +++ b/drivers/leds/leds-aw200xx.c
> > > @@ -379,6 +379,30 @@ static void aw200xx_disable(const struct aw200xx *const chip)
> > >  	return gpiod_set_value_cansleep(chip->hwen, 0);
> > >  }
> > >  
> > > +static bool aw200xx_probe_get_display_rows(struct device *dev, struct aw200xx *chip)
> > > +{
> > > +	struct fwnode_handle *child;
> > > +	u32 max_source = 0;
> > > +
> > > +	device_for_each_child_node(dev, child) {
> > > +		u32 source;
> > > +		int ret;
> > > +
> > > +		ret = fwnode_property_read_u32(child, "reg", &source);
> > > +		if (ret || source >= chip->cdef->channels)
> > 
> > Shouldn't the second clause fail instantly?
> > 
> 
> We already have such logic in the aw200xx_probe_fw() function, which
> skips the LED node with the wrong reg value too. Furthermore, we have
> strict reg constraints in the dt-bindings parts (in the current patch
> series), so we assume that the DT developer will not create an LED with
> the wrong reg value.

Why is it being checked again then?

-- 
Lee Jones [李琼斯]

