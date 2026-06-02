Return-Path: <linux-leds+bounces-8429-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFt7Gle7HmrZJgAAu9opvQ
	(envelope-from <linux-leds+bounces-8429-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 13:15:35 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3CA62D3E0
	for <lists+linux-leds@lfdr.de>; Tue, 02 Jun 2026 13:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 8E9D23003BDC
	for <lists+linux-leds@lfdr.de>; Tue,  2 Jun 2026 11:08:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9BA9439B954;
	Tue,  2 Jun 2026 11:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nmoBBVOr"
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B102248A8;
	Tue,  2 Jun 2026 11:07:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780398479; cv=none; b=eFov4wTzc2+mmEHVIhmDWhZJDK5BSIvDydgXqTDgycSbmKCDY7ZqFIDt+O0a0KukfNuYyIoDrxRLBbTcAc/8e/Tpc7q6e+ZhgJXTcO290gctgx469J4TALMknESQ8f7KKD5ZXeAbdUrLRu3FtKyfJWwry/XslfO5DGvbwoVPceg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780398479; c=relaxed/simple;
	bh=mFctebV6efZPkxdiXhNEx0eARojG2bev1G/ivejaxqo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N5wKO8m96znIGQ/0XMMQP7T7KO+4pogBlQAeP5k+mz0MgyGHLW62+e7/BevmT3b6NTZhXvXkPY+qlXwjfeHAzUUayzDZT7hwZN0w1uedJGVW5ZPDutvrDsVaJc6j/Wvi6gTJegP2sFnvBpO2iDfbVYyzXg2VxOIHjnKpa8Y8m8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nmoBBVOr; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780398478; x=1811934478;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=mFctebV6efZPkxdiXhNEx0eARojG2bev1G/ivejaxqo=;
  b=nmoBBVOrwCFnArKyPsbRh2FzPl9jwRcZOXoLNpFrFLjddrEvZmlZfG/v
   /QXsOWkVLe8NH9Xs6+JLb7cBlw62RvEmm/OciI4i6wvzdCW4v1MU4Cd2w
   YS6vTxn1ep4t898jFGxkMebeSof0l3zILA6pY2Yb/h1jjYcdlzApxrM6P
   PSbQzaAarTyQM9wH+nnTCHqtngFD/zXzqh5iYspCTfrLUFc3DHt//x5nx
   DjlZFl7x6LbKi+LrQELFP+ramY9+p67RIHmH12PZrFLhUVQ41qyGDxOru
   hWhOA7BN45MXBZgLaNM0cFAJsXbixOLJdXSV4NzEOZinf73HOS96Wx3Pt
   g==;
X-CSE-ConnectionGUID: I7V0s52lSaCsHjS5TnTuVg==
X-CSE-MsgGUID: bT+99yrZQBGd+OXYk9skhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="81207825"
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="81207825"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 04:07:57 -0700
X-CSE-ConnectionGUID: lhiRJlaQQHmUbKHn1VV+4A==
X-CSE-MsgGUID: r7XmoXFkTjavabE0tmKG2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,183,1774335600"; 
   d="scan'208";a="243975444"
Received: from mkosciow-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.229])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 04:07:52 -0700
Date: Tue, 2 Jun 2026 14:07:49 +0300
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
Subject: Re: [PATCH v3 08/11] video: backlight: lm3533_bl: Improve linear
 sysfs logic
Message-ID: <ah65hfgoM67V6-iR@ashevche-desk.local>
References: <20260601151831.76350-1-clamor95@gmail.com>
 <20260601151831.76350-9-clamor95@gmail.com>
 <ah6PxFtoJUWkd79P@ashevche-desk.local>
 <CAPVz0n0P7Jk17cM2M1zuHZfySo2=Uibr5izwKU2tqiBpBcg0FQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPVz0n0P7Jk17cM2M1zuHZfySo2=Uibr5izwKU2tqiBpBcg0FQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Queue-Id: 7E3CA62D3E0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	TAGGED_FROM(0.00)[bounces-8429-lists,linux-leds=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ashevche-desk.local:mid,intel.com:dkim,intel.com:email]
X-Rspamd-Action: no action

On Tue, Jun 02, 2026 at 01:19:00PM +0300, Svyatoslav Ryhel wrote:
> вт, 2 черв. 2026 р. о 11:09 Andy Shevchenko <andriy.shevchenko@intel.com> пише:
> > On Mon, Jun 01, 2026 at 06:18:28PM +0300, Svyatoslav Ryhel wrote:

...

> > >       if (kstrtoul(buf, 0, &linear))
> > >               return -EINVAL;
> >
> > Besides _assign_bits() in the below, side note here to unshadow error codes:
> >
> >         ret = kstrtoul(buf, 0, &linear);
> >         if (ret)
> >                 return ret;
> >
> > (obviously in a separate change).
> 
> Won't happen in this patches.

You mean both suggestions or you are talking about kstrotoul() only? If it's
only about the latter, it's fine with me, but _assign_bits() makes sense to do
in this patch as you already change the parameters enough to make it better.

...

> > >       ret = regmap_update_bits(bl->lm3533->regmap, LM3533_REG_CTRLBANK_AB_BCONF,
> > > -                              mask, val);
> > > +                              CTRLBANK_AB_BCONF_MODE(id),
> > > +                              linear ? CTRLBANK_AB_BCONF_MODE(id) : 0);
> > >       if (ret)
> > >               return ret;

^^^ left for the context.

-- 
With Best Regards,
Andy Shevchenko



