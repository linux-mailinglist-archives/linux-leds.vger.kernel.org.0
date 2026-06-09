Return-Path: <linux-leds+bounces-8547-lists+linux-leds=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-leds@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id MwTqGVZqKGpIDwMAu9opvQ
	(envelope-from <linux-leds+bounces-8547-lists+linux-leds=lfdr.de@vger.kernel.org>)
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 21:32:38 +0200
X-Original-To: lists+linux-leds@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F2D663BEC
	for <lists+linux-leds@lfdr.de>; Tue, 09 Jun 2026 21:32:38 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=OCn7kXGn;
	spf=pass (mail.lfdr.de: domain of "linux-leds+bounces-8547-lists+linux-leds=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-leds+bounces-8547-lists+linux-leds=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6CB1731B4560
	for <lists+linux-leds@lfdr.de>; Tue,  9 Jun 2026 19:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 188024E3788;
	Tue,  9 Jun 2026 19:18:01 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8B34D90A1;
	Tue,  9 Jun 2026 19:17:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781032681; cv=none; b=SM3InJdcLULfQPnD7t4HdZQyZYg82KfW/Qx1bjVQ22ywtWwprFaWrsQphdFM77fn0bYtIOGUGr43hb8MQzSIFXdAc8WfOjn2JBBeoCqZFefnEr+c8W48A0FFM+RvkZOwh5iOTs0eFoO4VvyL0hsWcFy3Ip9yx3tX8KOzh/6C24c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781032681; c=relaxed/simple;
	bh=MTwsqfpI91yD0Y/+0nOvP+mQrtShptVr2NvwI5cxpnA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hIjWkZZh2OSQhCP7U6a5s5e6rz8LCsWzk5vxdPTuViRjOda6Y48XC+qJPw4IAwC2LSgy/poegFIr+wPkHzgAG1dWGttRfeaJvfRHh+ABdaiVeW8PenkcQENnopPYfWp0cDnIZSvreSPXxaGJErkPwdx03kS3isHxVKR7QRceFR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OCn7kXGn; arc=none smtp.client-ip=198.175.65.10
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781032679; x=1812568679;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MTwsqfpI91yD0Y/+0nOvP+mQrtShptVr2NvwI5cxpnA=;
  b=OCn7kXGnxujXwcPmUrC2R5vyMVOlqh7IiDCko1yC/fiS325+SL1mnE7H
   sIDul9AqFTRnWZMb4bIE3Q5rsSAT5QJDB8L4OkDd/EH0mtC5pyC/trx9u
   QnnDMrd+MiYbgtZ6GczD0zfzo784Jid5Cfw4aNwmOveA15z2QDHHXjj9G
   HhsdziRc+iz4jg7lgTitzDypnHvkDs9AoqVJoXbYDfBvYzeN5/otpwVu0
   F4BcnNEYvuWmh2QFfjJAFvKdUPwNAcTckRbwhGcbCFtJ83DcmUgSqUq76
   OlmOZurFRv1/hDeLrFXyo7QXEnwKfw4lM/k7aFWUThFf9EhgsPKV4BmXD
   w==;
X-CSE-ConnectionGUID: KFGlZF46THeYcpnM5b64Ww==
X-CSE-MsgGUID: HmFWX+HeTwK0jjqjv0Njrw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="99227005"
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="99227005"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 12:17:58 -0700
X-CSE-ConnectionGUID: HucDC72aTtue2Pp5rbNfxg==
X-CSE-MsgGUID: xJ6+Pb4NQQmRtoZsYTuqNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,196,1774335600"; 
   d="scan'208";a="276140448"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.162])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 12:17:54 -0700
Date: Tue, 9 Jun 2026 22:17:51 +0300
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
Subject: Re: [PATCH v4 10/14] mfd: lm3533: Set DMA mask
Message-ID: <aihm315UtdqJclhh@ashevche-desk.local>
References: <20260606045738.21050-1-clamor95@gmail.com>
 <20260606045738.21050-11-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260606045738.21050-11-clamor95@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-8547-lists,linux-leds=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:clamor95@gmail.com,m:lee@kernel.org,m:danielt@kernel.org,m:jingoohan1@gmail.com,m:pavel@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:deller@gmx.de,m:johan@kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-leds@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-fbdev@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,baylibre.com,analog.com,gmx.de,lists.freedesktop.org,vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-leds@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-leds,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:from_mime,ashevche-desk.local:mid,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 22F2D663BEC

On Sat, Jun 06, 2026 at 07:57:34AM +0300, Svyatoslav Ryhel wrote:
> Missing coherent_dma_mask assigning triggers the following warning in
> dmesg:
> 
> [    3.287872] platform lm3533-backlight.0: DMA mask not set
> 
> Since this warning might be elevated to an error in the future, set
> coherent_dma_mask to zero because both the core and cells do not utilize
> DMA.

Hmm... I am not sure about this. The entire kernel has only two drivers that
do that, and thanks to their commit messages one of them pointed out to the
commit from 2018. So, if no other devices suffer from this, I think it has to
be a better way of achieving the same.

-- 
With Best Regards,
Andy Shevchenko



