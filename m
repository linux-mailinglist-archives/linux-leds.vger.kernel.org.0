Return-Path: <linux-leds+bounces-5940-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBAFC1C9EE
	for <lists+linux-leds@lfdr.de>; Wed, 29 Oct 2025 18:56:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 197504E6F51
	for <lists+linux-leds@lfdr.de>; Wed, 29 Oct 2025 17:52:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF8D3446B5;
	Wed, 29 Oct 2025 17:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tr8RjkwN"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AD882D8DA4;
	Wed, 29 Oct 2025 17:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761760356; cv=none; b=DwDrOO8kS1FWdqnzRRIHJ/S/gBK6z2KDVKG4H9g0rJ+dGqf+rtMZi2FT4I0gbHWJ3VLQGIsG63QyxEmlt03fbnpQmX79QFcMEydohoyM7+euZKWYAsaN4Td1oIZDZDUr21EvldUQqZ4Hl/qP5xOmZpa7+KxEL3v2eFv0qrJJ+s8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761760356; c=relaxed/simple;
	bh=0YBScoJ8j4SEyGyzFWW4kdvZXQlp+HgJ7s1KzaPXNDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bn/Ac/DCcmFMiHFrpVOqRK17qssEHt2ONWTV32Wq6gh8nohSEg7rdhdS7J8W8sGbKt7qqo71y/5mN5WK9jXZJUoz7o3SPsTgVazJ1lSHEsDQ9Vak/a6UtOcoUSkuQ4BerZ1t9Wr+/XAdSkkuZiMm6BkIGZTh1n8O7alIbsQG1vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tr8RjkwN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EBE6C4CEF7;
	Wed, 29 Oct 2025 17:52:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761760355;
	bh=0YBScoJ8j4SEyGyzFWW4kdvZXQlp+HgJ7s1KzaPXNDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tr8RjkwNuP9TI9R6Dv4328MqMFROy/G1RzcO3D+YUqrzInGDBmSUn6dWtqJl4ViHD
	 RwWjAcNHTuYjNFImMaLZE7bHMtLXm+2kE+086j9yN/NONlyNv8JHtglIkMWnZIsvXf
	 FalyX9cBXS4k8sNIlnmP0ADnY+1FeeIECSsC9cBHU2OQvxRs1n47fq4Aw5G/1L3/mk
	 tOweAgQRN+NTuyN2RWGuAyvQ1ujoSuPFwZRXNjuISPfWGGRGS+lo+DIcswLY7fy9u1
	 4HxpKFB38E/VhrBd9r1GMZiiVY4DtPSzzpBeG4xRujhI9bX9uKWVgVyO3cFABWRley
	 WU+A6rf3lbhTg==
Date: Wed, 29 Oct 2025 17:53:31 +0000
From: Daniel Thompson <danielt@kernel.org>
To: Junjie Cao <caojunjie650@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
	dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-fbdev@vger.kernel.org, Pengyu Luo <mitltlatltl@gmail.com>
Subject: Re: [PATCH 2/2] backlight: aw99706: Add support for Awinic AW99706
 backlight
Message-ID: <aQJUmx5elYOW2TvO@aspen.lan>
References: <20251026123923.1531727-1-caojunjie650@gmail.com>
 <20251026123923.1531727-3-caojunjie650@gmail.com>
 <aQDDjzl65dMZEnwM@aspen.lan>
 <CAK6c68h3Mc0=JbbbVAmo_cYeOR_T-_rRy5EacgYQh7HgQZOPBg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAK6c68h3Mc0=JbbbVAmo_cYeOR_T-_rRy5EacgYQh7HgQZOPBg@mail.gmail.com>

On Wed, Oct 29, 2025 at 07:49:35PM +0800, Junjie Cao wrote:
> On Tue, Oct 28, 2025 at 9:21 PM Daniel Thompson <danielt@kernel.org> wrote:
> >
> > On Sun, Oct 26, 2025 at 08:39:23PM +0800, Junjie Cao wrote:
> > > Add support for Awinic AW99706 backlight, which can be found in
> > > tablet and notebook backlight, one case is the Lenovo Legion Y700
> > > Gen4. This driver refers to the official datasheets and android
> > > driver, they can be found in [1].
> > >
> > > [1] https://www.awinic.com/en/productDetail/AW99706QNR
> > >
> > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > Signed-off-by: Junjie Cao <caojunjie650@gmail.com>
> > > ---
> > > diff --git a/drivers/video/backlight/aw99706.c b/drivers/video/backlight/aw99706.c
> > > <snip>
> > > +static void aw99706_dt_parse(struct aw99706_device *aw)
> > > +{
> > > +     struct aw99706_dt_prop *prop;
> > > +     int ret, i;
> > > +
> > > +     for (i = 0; i < ARRAY_SIZE(aw99706_dt_props); i++) {
> > > +             prop = &aw99706_dt_props[i];
> > > +             ret = device_property_read_u32(aw->dev, prop->name,
> > > +                                            &prop->raw_val);
> > > +             if (ret < 0) {
> > > +                     dev_warn(aw->dev, "Missing property %s: %d\n",
> > > +                              prop->name, ret);
> >
> > Why is there a warning when an optional property is not present. A DT
> > not including an optional property needs no message at all.
> >
>
> They are mandatory in the downstream, and providing all properties is
> difficult sometimes, so I set a default value if one is missing. But
> one device may use a configuration different from the component
> vendor's. These default values may be not optimal, so I issue a
> warning for property missing. (I forgot to address it)

All sensible but to be clear...

From my point-of-view the driver should match the upstream bindings.
Either the properties are required (in which case missing them can be
dev_err() and/or fail to probe) or they are optional (in which case
there should be no warnings).

Similarly if missing values is likely to lead to very sub-optimal
behavior (or something that has a risk of over-current or component
failure) then consider making the options mandatory.


Daniel.

