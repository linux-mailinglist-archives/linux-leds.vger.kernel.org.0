Return-Path: <linux-leds+bounces-8428-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKohKJe6HmrZJgAAu9opvQ
	(envelope-from <linux-leds+bounces-8428-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 13:12:23 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A980E62D2F9
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 13:12:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 72FA830013A7
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 11:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 606263955FB;
	Tue,  2 Jun 2026 11:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i9wS+XhQ"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845ED2E36F8;
	Tue,  2 Jun 2026 11:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780398329; cv=none; b=mnN7HkQytnpShAmXsYP4/BwAI34p8LhixyDKI8eiYxeurtFptnFOkeRRs9kbzI3+fmCrOkKYR74iKFobMUtMcn/br6nPWokaKBQDYPZXz6zDzYf3FVf7gyDgyIi+pRQaUwLuNgKZ/rpopTBN4ILDOB93D03YmED1uw/C4uV4g2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780398329; c=relaxed/simple;
	bh=334jL2lAPjuPlqw0djaN2J2L0UdWoI+uZoHt6zyLO1c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IlNp2PS91aWNQMgXGX1xdKxjfUZ9V3uoLjB2ZZ7wD2gMKP/+3f8U9ZoJu+1heWhitWCVVJmW5nO28BH/GU0iNFNu+YX/PLrQA6WX4PWm0vnSzon4+bPWwGwYbIl7Et0VoA73aBo5fkO0I0MT3hh2bBAWrPTmfV/0ZRpU3oTZ4p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i9wS+XhQ; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780398327; x=1811934327;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=334jL2lAPjuPlqw0djaN2J2L0UdWoI+uZoHt6zyLO1c=;
  b=i9wS+XhQxWjMPUM2zuh8A6KQPchyKLj1Hq4UCVSyast7a+3cTl7uiS3d
   ODtqt5jgCY478osJiJU+jO7nSMu63hGg7gCEZnUVVxyWcskhYIClITAeK
   eL8QSUAfelyanCwlVnV2kAZ7JtfLsQOy1Wx+Da8IuPGnzkeEvaIPkSiVd
   kRDOxsSMKUTdmsguMGkzhVz6fMMYbapZIMK1a3mXsXQvkYkxNdsGxASsL
   FLCvZKfL4vdqx32u/WLTYSW/RiDIM9ofLsCEitIj3eaCJjD5gJmBTpQy2
   KHUV4+SItX23g1yD6oVkUW7GYiYnDwTynJxtwZsskEBQ/sqEKX1xT35QZ
   g==;
X-CSE-ConnectionGUID: 7w4miiwdSuOaJOfV2ohMYg==
X-CSE-MsgGUID: pau65ajjS8O/lFrW2kzKZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="85035811"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="85035811"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 04:05:26 -0700
X-CSE-ConnectionGUID: 3MDQwoTqTGO+0B9MM5EZIQ==
X-CSE-MsgGUID: F/HgBAMISWmlXhvc9MCs9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="239709107"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 04:05:22 -0700
Date: Tue, 2 Jun 2026 14:05:20 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Helge Deller <deller@gmx.de>,
	Johan Hovold <johan@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v3 05/11] mfd: lm3533: Convert to use OF bindings
Message-ID: <ah648F2plc4UHTM1@ashevche-desk.local>
References: <20260601151831.76350-1-clamor95@gmail.com>
 <20260601151831.76350-6-clamor95@gmail.com>
 <ah6TGjRNnDpQGO60@ashevche-desk.local>
 <CAPVz0n21RGAaJc1sda4xyp1h0z+6R6FJ4=XWdOtB1mgtV8=RUA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n21RGAaJc1sda4xyp1h0z+6R6FJ4=XWdOtB1mgtV8=RUA@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: A980E62D2F9
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-8428-lists,linux-leds=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,ashevche-desk.local:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Tue, Jun 02, 2026 at 01:31:44PM +0300, Svyatoslav Ryhel wrote:
> вт, 2 черв. 2026 р. о 11:24 Andy Shevchenko <andriy.shevchenko@intel.com> пише:
> > On Mon, Jun 01, 2026 at 06:18:25PM +0300, Svyatoslav Ryhel wrote:


...

> > > +     device_for_each_child_node_scoped(lm3533->dev, child) {
> >
> > > +             if (!fwnode_device_is_available(child))
> > > +                     continue;
> >
> > Do we need this check?
> 
> This is nice to have if the node is disabled. If we assume that there
> are no disabled nodes, I can remove it.

It's already implied. See

static struct fwnode_handle *
of_fwnode_get_next_child_node(const struct fwnode_handle *fwnode, struct fwnode_handle *child)
{
        return of_fwnode_handle(of_get_next_available_child(to_of_node(fwnode), to_of_node(child)));
}

And I believe it's written somewhere in the documentation (if not, feel free to
patch that).

...

> > > +     ret = sysfs_create_group(&dev->kobj, &lm3533_attribute_group);
> >
> > No way. You should use .dev_groups.
> 
> I did not change how driver does this, just swapped lm3533->dev to
> dev. I will set is back as it was.

This is a serious race condition that needs to be addressed. Since you are
touching this driver the fixes against known issues probably are the first
things that have to be done.

> > > +     if (ret) {
> > > +             dev_err(dev, "failed to create sysfs attributes\n");
> > >               goto err_unregister;
> > >       }

...

> > Can you think on how to split this change to smaller steps? I believe it's
> > possible.
> 
> No, I am done with tinkering with this patchset. It is broken enough
> and it has inflated enough.

Probably you don't want this to be reviewed then? I believe other kernel
developers and maintainers will ask you the same.

-- 
With Best Regards,
Andy Shevchenko



