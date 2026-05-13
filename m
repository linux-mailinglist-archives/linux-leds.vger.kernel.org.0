Return-Path: <linux-leds+bounces-8088-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mATZBwSIBGoJLQIAu9opvQ
	(envelope-from <linux-leds+bounces-8088-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 16:17:40 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FFF534DC1
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 16:17:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 3A4753003BE6
	for <lists+linux-leds@lfdr.de>; Wed, 13 May 2026 14:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4CC2ECE86;
	Wed, 13 May 2026 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ma0jKcK3"
X-Original-To: linux-leds@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2E7231C91;
	Wed, 13 May 2026 14:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778681103; cv=none; b=a3uU2MEDxkeHmcsmjVS9Py2t6YSjqlkUsfb1a3mG9xDoN77ziQH58TEOVkTGfubEVPOKwCr8C6GcBnetfXNPu4WvLczZI2ebgqrZFhr8j0NIYB2n/gxMbAL7uFeEhj/Y3DSsb2esFWSjqq4v4G1ZuhOX1qAQnyS1zweXA7JT2r8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778681103; c=relaxed/simple;
	bh=NzlJNgMNg5iz4NK5vod6ydIIw0nsL+RlD6WSnIjY3B0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mba9VNaS2iUKMOMWI7W2YdEJUewrlnFKCDovJ1CH7GIpVwVHMyPCD7LG/RgGi+gBPX0b1f9Xj3tiBTdtgWsMzp3RczERGLB0aHQHqNTV3wLMNOptelvIphiH1hyhkiC/tcb7MDrbI3EnM3U4hLfqSm4Zx0gGkEXvf+07GwLIBCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ma0jKcK3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B77C19425;
	Wed, 13 May 2026 14:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778681102;
	bh=NzlJNgMNg5iz4NK5vod6ydIIw0nsL+RlD6WSnIjY3B0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ma0jKcK3C2P3PmwoBryXaPiweI+zvVIjq99Ud8un2/n43g3VWgHQETzJdbrRj365M
	 6xfXLtC3DYMCV0iQt0GV0B9HWxK2FoV0N+T/ZBTQ/sEa1lq6BFl08bMg2qtGUE3zWa
	 I8VQr2fU88WhUozi1wXAaPVHWkOcQvZLYwGXVw+3Awtmst7HQKNRd6H0VyoJ3NbD+s
	 C6D9nUrhBsnV5tzXX6aJKKGyti4kRxK4DlHuvSAw3ZnqCU6k2dWX8tto1q5ukqJaz6
	 vNTDJx8bcEhBYEY7/NQnKjaL13ZZ+wNLPpQZrX4GTNGlyZxDSJixbPDCuFJGvRtaZh
	 kFF0NGw8+zKsQ==
Date: Wed, 13 May 2026 15:04:57 +0100
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
Subject: Re: [PATCH v4 5/6 RESEND] mfd: motorola-cpcap: diverge configuration
 per-board
Message-ID: <20260513140457.GC305027@google.com>
References: <20260428153611.142816-1-clamor95@gmail.com>
 <20260428153611.142816-6-clamor95@gmail.com>
 <20260507140519.GO305027@google.com>
 <CAPVz0n24U3=hwda5BTXUhHiiFHKmWUfLy_nxJp_CFHBHEYDWsA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n24U3=hwda5BTXUhHiiFHKmWUfLy_nxJp_CFHBHEYDWsA@mail.gmail.com>
X-Rspamd-Queue-Id: 16FFF534DC1
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-8088-lists,linux-leds=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,baylibre.com,atomide.com,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lee@kernel.org,linux-leds@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Thu, 07 May 2026, Svyatoslav Ryhel wrote:

> чт, 7 трав. 2026 р. о 17:05 Lee Jones <lee@kernel.org> пише:
> >
> > On Tue, 28 Apr 2026, Svyatoslav Ryhel wrote:
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
> >
> > Changelog?
> >
> > >  drivers/mfd/motorola-cpcap.c | 101 ++++++++++++++++++++++++++++-------
> > >  1 file changed, 83 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/drivers/mfd/motorola-cpcap.c b/drivers/mfd/motorola-cpcap.c
> > > index d8243b956f87..516d1e33affa 100644
> > > --- a/drivers/mfd/motorola-cpcap.c
> > > +++ b/drivers/mfd/motorola-cpcap.c
> > > @@ -12,6 +12,7 @@
> > >  #include <linux/kernel.h>
> > >  #include <linux/module.h>
> > >  #include <linux/mod_devicetable.h>
> > > +#include <linux/property.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/sysfs.h>
> > >
> > > @@ -24,10 +25,16 @@
> > >  #define CPCAP_REGISTER_SIZE  4
> > >  #define CPCAP_REGISTER_BITS  16
> > >
> > > +struct cpcap_chip_data {
> > > +     const struct mfd_cell *mfd_devices;
> > > +     unsigned int num_devices;
> > > +};
> >
> > This is a red flag.
> >
> > >  struct cpcap_ddata {
> > >       struct spi_device *spi;
> > >       struct regmap_irq *irqs;
> > >       struct regmap_irq_chip_data *irqdata[CPCAP_NR_IRQ_CHIPS];
> > > +     const struct cpcap_chip_data *cdata;
> > >       const struct regmap_config *regmap_conf;
> > >       struct regmap *regmap;
> > >  };
> > > @@ -195,20 +202,6 @@ static int cpcap_init_irq(struct cpcap_ddata *cpcap)
> > >       return 0;
> > >  }
> > >
> > > -static const struct of_device_id cpcap_of_match[] = {
> > > -     { .compatible = "motorola,cpcap", },
> > > -     { .compatible = "st,6556002", },
> > > -     {},
> > > -};
> > > -MODULE_DEVICE_TABLE(of, cpcap_of_match);
> > > -
> > > -static const struct spi_device_id cpcap_spi_ids[] = {
> > > -     { .name = "cpcap", },
> > > -     { .name = "6556002", },
> > > -     {},
> > > -};
> > > -MODULE_DEVICE_TABLE(spi, cpcap_spi_ids);
> > > -
> > >  static const struct regmap_config cpcap_regmap_config = {
> > >       .reg_bits = 16,
> > >       .reg_stride = 4,
> > > @@ -241,7 +234,56 @@ static int cpcap_resume(struct device *dev)
> > >
> > >  static DEFINE_SIMPLE_DEV_PM_OPS(cpcap_pm, cpcap_suspend, cpcap_resume);
> > >
> > > -static const struct mfd_cell cpcap_mfd_devices[] = {
> > > +static const struct mfd_cell cpcap_default_mfd_devices[] = {
> > > +     {
> > > +             .name          = "cpcap_adc",
> > > +             .of_compatible = "motorola,cpcap-adc",
> > > +     }, {
> > > +             .name          = "cpcap_battery",
> > > +             .of_compatible = "motorola,cpcap-battery",
> > > +     }, {
> > > +             .name          = "cpcap-regulator",
> > > +             .of_compatible = "motorola,cpcap-regulator",
> > > +     }, {
> > > +             .name          = "cpcap-rtc",
> > > +             .of_compatible = "motorola,cpcap-rtc",
> > > +     }, {
> > > +             .name          = "cpcap-pwrbutton",
> > > +             .of_compatible = "motorola,cpcap-pwrbutton",
> > > +     }, {
> > > +             .name          = "cpcap-usb-phy",
> > > +             .of_compatible = "motorola,cpcap-usb-phy",
> > > +     }, {
> > > +             .name          = "cpcap-led",
> > > +             .id            = 0,
> > > +             .of_compatible = "motorola,cpcap-led-red",
> > > +     }, {
> > > +             .name          = "cpcap-led",
> > > +             .id            = 1,
> > > +             .of_compatible = "motorola,cpcap-led-green",
> > > +     }, {
> > > +             .name          = "cpcap-led",
> > > +             .id            = 2,
> > > +             .of_compatible = "motorola,cpcap-led-blue",
> > > +     }, {
> > > +             .name          = "cpcap-led",
> > > +             .id            = 3,
> > > +             .of_compatible = "motorola,cpcap-led-adl",
> > > +     }, {
> > > +             .name          = "cpcap-led",
> > > +             .id            = 4,
> > > +             .of_compatible = "motorola,cpcap-led-cp",
> > > +     }, {
> > > +             .name          = "cpcap-codec",
> > > +     },
> > > +};
> 
> Lee, would you mind if I convert these mfd_cell structures to use
> macros in this commit since I am refactoring them anyway?

Sure.

-- 
Lee Jones

