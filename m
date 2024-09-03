Return-Path: <linux-leds+bounces-2595-lists+linux-leds=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-leds@lfdr.de
Delivered-To: lists+linux-leds@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 782F496A443
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 18:28:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC350B224CC
	for <lists+linux-leds@lfdr.de>; Tue,  3 Sep 2024 16:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F6E18B499;
	Tue,  3 Sep 2024 16:28:11 +0000 (UTC)
X-Original-To: linux-leds@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBA118A951
	for <linux-leds@vger.kernel.org>; Tue,  3 Sep 2024 16:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725380891; cv=none; b=O+Ul5An7FHun5Fgvhf4a52NtX5E3ZBCAlE4IoRnmkc8aERTWdYHM7TVKN6xbbOrboO0Eqn7ZUqfnGN5qtw7pJacdukxCdt0e+rQYssbVjrMfx+mVjT//s39DrsA9dOKuqe5hBNkjmGXLCmoKD1+qtLseR/k0duEuOsOh4SQF7zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725380891; c=relaxed/simple;
	bh=Qn8Vle4YzbT9CMeyJ56kQ43laZX95CLTz/I4UFvWo0M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dH5zrX5Zu0tjtY7bz4r6AZ+ZQ2JKQzKcZxJCphaIPYy9lbrw5++eKhvmMM+Zg1jVdZCgtAyTqdNlwV/SbCaLJR3W5PuZf3wXNhKAJJTfdzJzBALaUeXMxeaqr7IVpaeeUpl9RS1CXKA2o0fJFGUcEAHgYtd7Nux//kyigznmEC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com; spf=fail smtp.mailfrom=gmail.com; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=gmail.com
X-CSE-ConnectionGUID: FN28pa5XQH+0fRjkr9HGkA==
X-CSE-MsgGUID: k6XbnC4PQZeR87/VrWAbtQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11184"; a="13350421"
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="13350421"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:28:09 -0700
X-CSE-ConnectionGUID: H0nsuZymTK6TK1w/YJD53g==
X-CSE-MsgGUID: KvJed8sQQw2POQM2xfjzKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,199,1719903600"; 
   d="scan'208";a="95703733"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2024 09:28:05 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.98)
	(envelope-from <andy.shevchenko@gmail.com>)
	id 1slWNu-00000004lnM-1jA0;
	Tue, 03 Sep 2024 19:28:02 +0300
Date: Tue, 3 Sep 2024 19:28:02 +0300
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Lee Jones <lee@kernel.org>, Pavel Machek <pavel@ucw.cz>,
	linux-leds@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
	soc@kernel.org, Gregory CLEMENT <gregory.clement@bootlin.com>,
	arm@kernel.org, Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Subject: Re: [PATCH leds v2 08/11] leds: turris-omnia: Use dev_err_probe()
 where appropriate
Message-ID: <Ztc5ErXbwF7ElhDF@smile.fi.intel.com>
References: <20240903101930.16251-1-kabel@kernel.org>
 <20240903101930.16251-9-kabel@kernel.org>
 <CAHp75VfEnuJb2s4QWJ3NNeXcx+qwNXf2ypJ6A35ECOEf+TA9EQ@mail.gmail.com>
 <224af639-babd-4d6e-813b-70fe07d5e337@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <224af639-babd-4d6e-813b-70fe07d5e337@lunn.ch>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Tue, Sep 03, 2024 at 05:56:29PM +0200, Andrew Lunn wrote:
> On Tue, Sep 03, 2024 at 01:45:49PM +0300, Andy Shevchenko wrote:
> > On Tue, Sep 3, 2024 at 1:20 PM Marek Behún <kabel@kernel.org> wrote:

...

> > > +       if (ret)
> > > +               return dev_err_probe(dev, ret, "Cannot set LED %pOF to software mode\n", np);
> > 
> > Side note: Not sure how np is being used besides the messaging. If
> > it's only for the messaging, I would rather see %pfw and fwnode based
> > approach.
> 
> This board has a number of Ethernet switches described in DT.  Nobody
> takes ACPI seriously for any sort of complex networking. So using
> fwnode is probably pointless, this board will probably never be used
> with anything other than DT.

Okay, fair enough!

-- 
With Best Regards,
Andy Shevchenko



