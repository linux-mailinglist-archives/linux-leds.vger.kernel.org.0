Return-Path: <linux-leds+bounces-3280-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C019BCFBB
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 15:49:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 012B81C239FD
	for <lists+linux-leds@lfdr.de>; Tue,  5 Nov 2024 14:49:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42BC31D935A;
	Tue,  5 Nov 2024 14:49:53 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B3FEAD2;
	Tue,  5 Nov 2024 14:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730818193; cv=none; b=X/Wb+BbJu/nrbHW8T2fLDP9bV2m+RbO+vcXHw7i83SQ4ymNWbape7U48OKVcqTLui2LsPA8I3GgVVAtSWcSWTzGO1StTnht5yLNp0kAgExIOLANjtJgWfHQSOFn5bVDXqGV7mYu9J83vVu8pFpOUrUTeQV9Ci5wvl9hQBLbheKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730818193; c=relaxed/simple;
	bh=eVgItqG+GImhCC0U26TnBXZER+rPehddUZBS6jR1FGc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlETE0laT7B84rdgCVC1sCX7qJJfF72nfkWOkSiYE3gcKWeiLhm4jLBFkcpYU4JuHSx0YuTYxWqxgXA25xTleBKB6YHF5c6wv7+mM7pzbaGwpgL4Qqy585/muQqAcPy/XPjx/+7P531uVJOqgof67z3du/98dO49m63Q8FK6Dzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=fail smtp.mailfrom=kernel.org; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=kernel.org
X-CSE-ConnectionGUID: p4mkdtaFQhWYdgWW8t6etw==
X-CSE-MsgGUID: 7sGRTnRgTyy+bkxlvMmWuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="34354559"
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="34354559"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 06:49:52 -0800
X-CSE-ConnectionGUID: lluOpqQhSSSA9uNkzDRNfg==
X-CSE-MsgGUID: 3TQ5IxQWSI2uPWt4rP1zNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="88833322"
Received: from smile.fi.intel.com ([10.237.72.154])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2024 06:49:48 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy@kernel.org>)
	id 1t8KsK-0000000BR9F-1Uni;
	Tue, 05 Nov 2024 16:49:44 +0200
Date: Tue, 5 Nov 2024 16:49:44 +0200
From: Andy Shevchenko <andy@kernel.org>
To: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH leds v5 02/12] leds: turris-omnia: Use command execution
 functions from the MCU driver
Message-ID: <ZyowiA5ibJTO_Lc8@smile.fi.intel.com>
References: <20241104141924.18816-1-kabel@kernel.org>
 <20241104141924.18816-3-kabel@kernel.org>
 <ZyjfbOkJgpWVvj9v@smile.fi.intel.com>
 <y57d4i3kzk2w7bceuikfrr37ba2iwzdysj3ojjhexrvq6il23f@kkglnapi552l>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <y57d4i3kzk2w7bceuikfrr37ba2iwzdysj3ojjhexrvq6il23f@kkglnapi552l>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Nov 05, 2024 at 10:07:51AM +0100, Marek Behún wrote:
> On Mon, Nov 04, 2024 at 04:51:24PM +0200, Andy Shevchenko wrote:
> > On Mon, Nov 04, 2024 at 03:19:14PM +0100, Marek Behún wrote:

...

> > I'm wondering why the MCU driver (and node) is not represented as syscon
> > (with some regmap beneath it).
> > 
> > In such a case it would be something like
> > 
> >   foo = syscon_regmap_lookup_by_compatible();
> > 
> > here instead of all these dances.
> 
> Hi Andy,
> 
> the MCU interface is command-reply oriented. It is incompatible with
> regmap.

I'm not sure I understand the impediment here. There are plenty of hardware
that uses the similar approach and well compatible with regmap (assuming
custom ->read*() / ->write*() callbacks)...

> I investigated this back in 2019 and explained to Jacek why it
> is not possible, but can't find the e-mail on mailing lists, so I am
> attaching it.

...but I'm not insisting you to revisit this right now, just maybe
you can think more about this again at some point.

> So regmap is most probably not possible, unless things changed.
> 
> It is possible to add MCU node to the DT binding and find the device
> that way. But if the device-tree does not contain the MCU node, the
> driver would still have to fall back to this dance, for backwards
> compatibility. Otherwise it would not be able to determine whether gamma
> correction is supported with old device tree, as it does currently.
> 
> I guess I could break backwards compatibility with old device tree with
> this small feature. I don't think there are any users that don't use
> TurrisOS, do upgrade the kernel, but don't upgrade the device-tree...

-- 
With Best Regards,
Andy Shevchenko



