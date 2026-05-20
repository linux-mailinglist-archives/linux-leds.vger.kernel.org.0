Return-Path: <linux-leds+bounces-8234-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wBUAAp3gDWod4gUAu9opvQ
	(envelope-from <linux-leds+bounces-8234-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 18:26:05 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAF4591EE2
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 18:26:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1525331056CD
	for <lists+linux-leds@lfdr.de>; Wed, 20 May 2026 16:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE0D632B9B5;
	Wed, 20 May 2026 16:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OH/uNL6z"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B5D29B8D0;
	Wed, 20 May 2026 16:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779293155; cv=none; b=FEmEo8JIQoe2BxIc44Abdt9kkrsMVv4uFwzrXzIU4RBZvKDzxEHIIfJtKfcBlz/bjFP9IFIBraFXOchzPvLwZMXd1/cWPs8J+NWmIvM5fLsd7VQFgpUozgJyPsKzsrfC9qkZr/DxvaNSocIk9ge7kPBI8cSbNTkebqUucAXPaNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779293155; c=relaxed/simple;
	bh=yOhsqo7A1an5K36V6ciR4QgdBXrXhQJSvGzDPOSYsX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B9IB5BgHKHkBI0QFhu3NhD1u0DyZEna0pgZVbWWp9SpxdcaBqyICrwNpMWbFEw+Ao03bqM0U7RBECFe8fvZPGRpjoGUKhuAyrd57jRm7nG3g9DJQaBm94q/xZvgfrCcuXKiEHFm5hqqP5yT/ruaNgce2Zzi3B9ih8EDWq1dbBwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OH/uNL6z; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B5D1F000E9;
	Wed, 20 May 2026 16:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779293154;
	bh=r8XeWwPGiLxyObP8wbpH25CTUC+fb/5+tcRkNc9nH9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=OH/uNL6zULW2clXNBipy9sSPm2QBRqJFKHbqH1U3MLkKgvmQhvNk7Hqg46ZNZANNt
	 IFT3uHvwTbBSSZMD/3fnXUzdd0QedF2hs2qzekIfLcp9Vg/Zz6DbYSpPi6PAchxaq+
	 DUNC0HicLdVHDyJMsMyYnbe9bGtO+UuWMkJgDLtQELCbJPJR+D0iE8OjeLqH4OpQEn
	 5kIrsG6D8y7RFXi75Is9/+iD9lO3YZAkc9av4Z2d76tlNGeXLAuZdySbol9RLjwK0M
	 OshJ8QkSwhhgJ+CeP9O/TEK7ba3h/x98rvs31UnrGvMFpqas4PNt3yySAGGWe4/FXw
	 hbDm0aLTKUPvg==
Date: Wed, 20 May 2026 17:05:48 +0100
From: Lee Jones <lee@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Pavel Machek <pavel@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Tony Lindgren <tony@atomide.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org
Subject: Re: [PATCH v5 5/6] mfd: motorola-cpcap: diverge configuration
 per-board
Message-ID: <20260520160548.GK2767592@google.com>
References: <20260510110804.33045-1-clamor95@gmail.com>
 <20260510110804.33045-6-clamor95@gmail.com>
 <20260520150758.GG2767592@google.com>
 <CAPVz0n0t4PXfmgWYQ1vSTFwfg=+g4oGU+-dwgnBVKxUoUwHGqw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0t4PXfmgWYQ1vSTFwfg=+g4oGU+-dwgnBVKxUoUwHGqw@mail.gmail.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8234-lists,linux-leds=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AFAF4591EE2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 20 May 2026, Svyatoslav Ryhel wrote:

> ср, 20 трав. 2026 р. о 18:08 Lee Jones <lee@kernel.org> пише:
> >
> > On Sun, 10 May 2026, Svyatoslav Ryhel wrote:
> >
> > > MFD have rigid subdevice structure which does not allow flexible dynamic
> > > subdevice linking. Address this by diverging CPCAP subdevice composition
> > > to take into account board specific configuration.
> > >
> > > Create a common default subdevice composition, rename existing subdevice
> > > composition into cpcap_mapphone_mfd_devices since it targets mainly
> > > Mapphone board.
> > >
> > > Removed st,6556002 as it is no longer applicable to all cases and
> > > duplicates motorola,cpcap, which is used as the default composition.
> > >
> > > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > > ---
> > >  drivers/mfd/motorola-cpcap.c       | 142 ++++++++++++++++-------------
> > >  include/linux/mfd/motorola-cpcap.h |   6 ++
> > >  2 files changed, 87 insertions(+), 61 deletions(-)
> >
> > Looking much better, thanks.
> >
> > Nit: A patch-level changelog really is much more helpful to reviewers.
> >
> 
> Noted, but I will not guarantee that I will do patch-level changelogs, sorry.

That's fine.  All I can do is ask.

Note that, helping out reviewers usually ends up helping you too.

[...]

> > > +static const struct mfd_cell cpcap_default_mfd_devices[] = {
> > > +     MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-adc"),
> > > +     MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
> > > +                 "motorola,cpcap-battery"),
> > > +     MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
> > > +                 "motorola,cpcap-regulator"),
> > > +     MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc"),
> > > +     MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
> > > +                 "motorola,cpcap-pwrbutton"),
> > > +     MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
> > > +                 "motorola,cpcap-usb-phy"),
> > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-red"),
> > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-green"),
> > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-blue"),
> > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-adl"),
> > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
> > > +     MFD_CELL_NAME("cpcap-codec"),
> > > +};
> >
> > Nit: I wouldn't complain if you wanted to have all of these on a single
> > line for neatness.
> >
> 
> Noted
> 
> > > +static const struct mfd_cell cpcap_mapphone_mfd_devices[] = {
> > > +     MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0,
> > > +                 "motorola,mapphone-cpcap-adc"),
> > > +     MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0,
> > > +                 "motorola,cpcap-battery"),
> > > +     MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0,
> > > +                 "motorola,mapphone-cpcap-charger"),
> > > +     MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0,
> > > +                 "motorola,mapphone-cpcap-regulator"),
> > > +     MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc"),
> > > +     MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0,
> > > +                 "motorola,cpcap-pwrbutton"),
> > > +     MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0,
> > > +                 "motorola,mapphone-cpcap-usb-phy"),
> > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-red"),
> > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-green"),
> > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-blue"),
> > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-adl"),
> > > +     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
> > > +     MFD_CELL_NAME("cpcap-codec"),
> > >  };
> >
> > A lot of these are duplicated, right?
> >
> > I would have a comment set, then the differences in separate containers.
> 
> It may be impossible to predict a generic setup since some devices may
> require unique compatibles, other may not have LEDs, third may be
> partially incompatible with existing cells. In other mfd cases
> creating a generic bundle might be good, but in this case I would
> suggest better to keep these separate entirely per-device. They will
> not take much space, nor add confusion with these macros.

I'm not sure we're understanding each other.  Let me give you an example:

static const struct mfd_cell cpcap_common_devices[] = {
     MFD_CELL_OF("cpcap_battery", NULL, NULL, 0, 0, "motorola,cpcap-battery"),
     MFD_CELL_OF("cpcap-rtc", NULL, NULL, 0, 0, "motorola,cpcap-rtc"),
     MFD_CELL_OF("cpcap-pwrbutton", NULL, NULL, 0, 0, "motorola,cpcap-pwrbutton"),
     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 0, "motorola,cpcap-led-red"),
     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 1, "motorola,cpcap-led-green"),
     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 2, "motorola,cpcap-led-blue"),
     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 3, "motorola,cpcap-led-adl"),
     MFD_CELL_OF("cpcap-led", NULL, NULL, 0, 4, "motorola,cpcap-led-cp"),
     MFD_CELL_NAME("cpcap-codec"),
};

static const struct mfd_cell cpcap_default_devices[] = {
     MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,cpcap-adc"),
     MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,cpcap-regulator"),
     MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,cpcap-usb-phy"),
};

static const struct mfd_cell cpcap_mapphone_devices[] = {
     MFD_CELL_OF("cpcap_adc", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-adc"),
     MFD_CELL_OF("cpcap-charger", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-charger"),
     MFD_CELL_OF("cpcap-regulator", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-regulator"),
     MFD_CELL_OF("cpcap-usb-phy", NULL, NULL, 0, 0, "motorola,mapphone-cpcap-usb-phy"),
};

This way, it's super easy to read / maintain the common and unique devices.

The only potential drawback would be 2 calls to mfd_add_devices() but
that's common practice.

Also notice that I droped the "_mfd" parts, which you should too.

> > >  static int cpcap_probe(struct spi_device *spi)
> > >  {
> > >       struct cpcap_ddata *cpcap;
> > > +     const struct mfd_cell *cells;
> > > +     unsigned int num_cells;
> > >       int ret;
> > >
> > >       cpcap = devm_kzalloc(&spi->dev, sizeof(*cpcap), GFP_KERNEL);
> > >       if (!cpcap)
> > >               return -ENOMEM;
> > >
> > > +     cpcap->variant = (enum cpcap_variant)spi_get_device_match_data(spi);
> > > +     if (!cpcap->variant)
> > > +             return -ENODEV;
> >
> > Isn't this covered in the 'default' below?
> >
> 
> This is for case cpcap->variant = 0, it should never happen, but check
> will not cause harm

The 'default' branch in the switch below will pick that up too.  This
check is superfluous.

> > > +     switch (cpcap->variant) {
> > > +     case CPCAP_DEFAULT:
> > > +             cells = cpcap_default_mfd_devices;
> > > +             num_cells = ARRAY_SIZE(cpcap_default_mfd_devices);
> > > +             break;
> > > +     case CPCAP_MAPPHONE:
> > > +             cells = cpcap_mapphone_mfd_devices;
> > > +             num_cells = ARRAY_SIZE(cpcap_mapphone_mfd_devices);
> > > +             break;
> > > +     default:
> > > +             return dev_err_probe(&spi->dev, -EINVAL,
> > > +                                  "Unknown device %d\n", cpcap->variant);
> >
> > This should be -ENODEV.
> >
> 
> hm, match is ENODEV cause it looks for device, here driver checks
> id/variant, so shouldn't it be EINVAL? I assume error message should
> be "Unknown device version" or "Unknown device ID"

All of your supported devices are represented in this switch statement.
Any other request, regardless of the reason should results in
"Unsupported device" and a -ENODEV - same as your check for
!cpcap->variant above.

-- 
Lee Jones

